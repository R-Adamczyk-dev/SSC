import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:open_filex/open_filex.dart';
import 'package:ssc_invoice_app/core/di/injection.dart';
import 'package:ssc_invoice_app/features/invoice/domain/entities/vat_rate.dart';
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_form/invoice_form_cubit.dart';
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_form/invoice_form_state.dart';
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_list/invoice_list_cubit.dart';

class InvoiceFormPage extends StatelessWidget {
  final String? invoiceId;

  const InvoiceFormPage({super.key, this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<InvoiceFormCubit>()..loadInvoice(invoiceId),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/logo_ssc.png', height: 36),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  invoiceId == null ? 'Nowa faktura' : 'Edytuj fakturę',
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
            BlocConsumer<InvoiceFormCubit, InvoiceFormState>(
              listener: (context, state) {
                if (state.saved) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Faktura zapisana pomyślnie!'),
                      backgroundColor: Colors.green,
                    ),
                  );

                  context.read<InvoiceListCubit>().loadInvoices();

                  context.pop();
                }
                if (state.error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(state.error!),
                        backgroundColor: Colors.red),
                  );
                }
              },
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () async {
                    await context.read<InvoiceFormCubit>().save();
                  },
                );
              },
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: _InvoiceFormBody(),
          ),
        ),
      ),
    );
  }
}

class _InvoiceFormBody extends StatelessWidget {
  const _InvoiceFormBody();

  void _openAttachment(BuildContext context, String path) async {
    final result = await OpenFilex.open(path);
    if (result.type != ResultType.done && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nie można otworzyć pliku: ${result.message}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
              initialValue: state.vatRate,
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
              elevation: 3,
              child: InkWell(
                onTap: state.attachmentPath != null
                    ? () => _openAttachment(context, state.attachmentPath!)
                    : cubit.pickAttachment,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: state.attachmentPath != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: state.attachmentPath!
                                        .toLowerCase()
                                        .endsWith('.pdf')
                                    ? const Icon(Icons.picture_as_pdf,
                                        color: Colors.red, size: 40)
                                    : Image.file(
                                        File(state.attachmentPath!),
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                            const Icon(Icons.image, size: 40),
                                      ),
                              )
                            : const Icon(Icons.attach_file,
                                color: Colors.grey, size: 40),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.attachmentName ??
                                  'Dodaj załącznik (PDF/zdjęcie)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: state.attachmentName != null
                                    ? Colors.black87
                                    : Colors.grey[600],
                              ),
                            ),
                            if (state.attachmentName != null)
                              Text(
                                'Kliknij, aby otworzyć',
                                style: TextStyle(
                                    color: Colors.blue[700], fontSize: 12),
                              ),
                          ],
                        ),
                      ),
                      // PRZYCISK USUŃ
                      if (state.attachmentName != null)
                        IconButton(
                          icon: const Icon(Icons.clear, color: Colors.red),
                          onPressed: cubit.removeAttachment,
                        )
                      else
                        const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
