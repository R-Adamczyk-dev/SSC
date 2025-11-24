import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ssc_invoice_app/features/invoice/domain/entities/vat_rate.dart';
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_form_state.dart';
import '../cubit/invoice_form_cubit.dart';

class InvoiceFormPage extends StatelessWidget {
  final String? editId;

  const InvoiceFormPage({super.key, this.editId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InvoiceFormCubit(editId),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/logo_ssc.png', height: 36),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  editId == null ? 'Nowa faktura' : 'Edytuj fakturę',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          actions: [
            // PRZYCISK SAVE JEST TERAZ WEWNĄTRZ BlocProvider!
            BlocBuilder<InvoiceFormCubit, InvoiceFormState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () async {
                    final saved = await context.read<InvoiceFormCubit>().save();
                    if (saved && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Faktura zapisana!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      context.go('/');
                    }
                  },
                );
              },
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: _InvoiceFormBody(), // <-- Twój piękny formularz
          ),
        ),
      ),
    );
  }
}

class _InvoiceFormBody extends StatelessWidget {
  const _InvoiceFormBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceFormCubit, InvoiceFormState>(
      builder: (context, state) {
        final cubit = context.read<InvoiceFormCubit>();

        return Column(
          children: [
            // 1. Nr faktury
            TextField(
              controller: state.invoiceNumberController,
              decoration: InputDecoration(
                labelText: 'Nr faktury *',
                errorText: state.showErrors && state.invoiceNumber.isEmpty
                    ? 'Pole wymagane'
                    : null,
              ),
              onChanged: cubit.updateInvoiceNumber,
            ),
            const SizedBox(height: 16),

            // 2. Kontrahent
            TextField(
              controller: state.contractorController,
              decoration: InputDecoration(
                labelText: 'Nazwa kontrahenta *',
                errorText: state.showErrors && state.contractor.isEmpty
                    ? 'Pole wymagane'
                    : null,
              ),
              onChanged: cubit.updateContractor,
            ),
            const SizedBox(height: 16),

            // 3. Kwota netto
            TextField(
              controller: state.netAmountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Kwota netto *',
                suffixText: 'zł',
                errorText: state.showErrors &&
                        (state.netAmount.isEmpty ||
                            double.tryParse(
                                    state.netAmount.replaceAll(',', '.')) ==
                                null ||
                            double.tryParse(
                                    state.netAmount.replaceAll(',', '.'))! <=
                                0)
                    ? 'Musi być większa od 0'
                    : null,
              ),
              onChanged: cubit.updateNetAmount,
            ),
            const SizedBox(height: 16),

            // 4. Stawka VAT
            DropdownButtonFormField<VatRate>(
              decoration: const InputDecoration(labelText: 'Stawka VAT'),
              items: VatRate.values
                  .map((v) =>
                      DropdownMenuItem(value: v, child: Text(v.displayName)))
                  .toList(),
              onChanged: (v) => v != null ? cubit.updateVatRate(v) : null,
            ),
            const SizedBox(height: 16),

            // 5. Kwota brutto – tylko do odczytu
            TextField(
              enabled: false,
              controller: TextEditingController(text: state.grossAmount),
              decoration: const InputDecoration(
                labelText: 'Kwota brutto',
                suffixText: 'zł',
                filled: true,
                fillColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // 6. Załącznik
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(
                  state.attachmentName == null
                      ? Icons.attach_file
                      : Icons.description,
                  color:
                      state.attachmentName == null ? Colors.grey : Colors.green,
                ),
                title: Text(
                  state.attachmentName ?? 'Dodaj załącznik (PDF/zdjęcie)',
                  style: TextStyle(
                    color: state.attachmentName == null
                        ? Colors.grey
                        : Colors.black87,
                    fontWeight: state.attachmentName == null
                        ? FontWeight.normal
                        : FontWeight.bold,
                  ),
                ),
                trailing: state.attachmentName != null
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.red),
                        onPressed: cubit.removeAttachment,
                      )
                    : null,
                onTap: cubit.pickAttachment,
              ),
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
