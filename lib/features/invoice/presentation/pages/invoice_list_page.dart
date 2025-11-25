import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:open_filex/open_filex.dart';
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_list/invoice_list_state.dart';
import '../cubit/invoice_list/invoice_list_cubit.dart';
import 'invoice_form_page.dart';

class InvoiceListPage extends StatelessWidget {
  const InvoiceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faktury'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/form'),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<InvoiceListCubit, InvoiceListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return InvoiceListBody();
        },
      ),
    );
  }
}

class InvoiceListBody extends StatelessWidget {
  const InvoiceListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceListCubit, InvoiceListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Szukaj faktury...',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: context.read<InvoiceListCubit>().search,
              ),
            ),
            Expanded(
              child: state.filteredInvoices.isEmpty
                  ? const Center(child: Text('Brak faktur'))
                  : ListView.builder(
                      itemCount: state.filteredInvoices.length,
                      itemBuilder: (context, index) {
                        final invoice = state.filteredInvoices[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: ListTile(
                            title: Text(invoice.invoiceNumber),
                            subtitle: Text(
                                '${invoice.contractor} • ${invoice.grossAmount} zł brutto'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (invoice.attachmentPath != null)
                                  IconButton(
                                    icon: const Icon(Icons.attachment,
                                        color: Colors.blue),
                                    onPressed: () =>
                                        OpenFilex.open(invoice.attachmentPath!),
                                  ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => InvoiceFormPage(
                                          invoiceId: invoice.id),
                                    ),
                                  ).then((_) => context
                                      .read<InvoiceListCubit>()
                                      .loadInvoices()),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text('Usunąć fakturę?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Anuluj'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context
                                                .read<InvoiceListCubit>()
                                                .deleteInvoiceMethod(
                                                    invoice.id);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Usuń'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
