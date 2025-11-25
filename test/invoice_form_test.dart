// test/invoice_form_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ssc_invoice_app/core/di/injection.dart';
import 'package:ssc_invoice_app/features/invoice/domain/entities/vat_rate.dart';
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_form/invoice_form_cubit.dart';
import 'package:ssc_invoice_app/features/invoice/presentation/pages/invoice_form_page.dart';

void main() {
  setUpAll(() async {
    await configureDependencies();
  });

  tearDownAll(() {
    GetIt.I.reset();
  });

  group('InvoiceFormPage – Walidacja formularza', () {
    testWidgets('Pokazuje błąd walidacji przy pustych wymaganych polach',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => GetIt.I<InvoiceFormCubit>(),
            child: const InvoiceFormPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final saveButton = find.byIcon(Icons.save);
      expect(saveButton, findsOneWidget);

      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      expect(find.textContaining('Pole wymagane'), findsAtLeastNWidgets(1));
    });

    testWidgets(
      'Automatycznie przelicza kwotę brutto po wpisaniu netto i zmianie VAT (0%, 7%, 23%)',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider(
              create: (_) => getIt<InvoiceFormCubit>(),
              child: const InvoiceFormPage(),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // 1. Wpisujemy 1000 w pole "Kwota netto *"
        final netField = find.widgetWithText(TextField, 'Kwota netto *');
        await tester.enterText(netField, '1000');
        await tester.pumpAndSettle();

        // Kwota brutto powinna być teraz: 1230.00 (23% VAT domyślnie)
        expect(find.text('1230.00'), findsOneWidget);

        // 2. Zmieniamy VAT na 7%
        await tester.tap(find.byType(DropdownButtonFormField<VatRate>));
        await tester.pumpAndSettle();
        await tester.tap(find.text('7%').last);
        await tester.pumpAndSettle();

        expect(find.text('1070.00'), findsOneWidget);

        // 3. Zmieniamy VAT na 0%
        await tester.tap(find.byType(DropdownButtonFormField<VatRate>));
        await tester.pumpAndSettle();
        await tester.tap(find.text('0%').last);
        await tester.pumpAndSettle();

        expect(find.text('1000.00'), findsOneWidget);
      },
    );

    testWidgets('Nie pozwala zapisać gdy kwota netto = 0', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => getIt<InvoiceFormCubit>(),
            child: const InvoiceFormPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Wpisujemy 0 w pole "Kwota netto *"
      final netField = find.widgetWithText(TextField, 'Kwota netto *');
      await tester.enterText(netField, '0');
      await tester.pump();

      // Klikamy ikonę dyskietki (Icons.save) w AppBar
      await tester.tap(find.byIcon(Icons.save));
      await tester.pumpAndSettle();

      // Spodziewamy się błędu walidacji
      expect(find.text('Musi być większa od 0'), findsOneWidget);
    });
  });
}
