// lib/features/invoice/presentation/pages/invoice_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:open_filex/open_filex.dart';
import 'package:ssc_invoice_app/core/di/injection.dart';
import 'package:ssc_invoice_app/features/invoice/data/models/invoice_isar.dart';
import '../cubit/invoice_list_cubit.dart';

class InvoiceListPage extends StatelessWidget {
  const InvoiceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InvoiceListCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/logo_ssc.png',
                  height: 36,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.business, size: 36),
                ),
              ),
              const SizedBox(width: 12),
              const Text('Lista faktur',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: const Column(
          children: [
            _SearchBar(),
            Expanded(child: _InvoiceList()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/form'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Szukaj po numerze, kontrahencie, kwocie...',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (q) => context.read<InvoiceListCubit>().updateSearch(q),
      ),
    );
  }
}

class _InvoiceList extends StatelessWidget {
  const _InvoiceList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceListCubit, InvoiceListState>(
      builder: (context, state) {
        if (state.invoices.isEmpty) {
          return const Center(child: Text('Brak faktur – dodaj pierwszą!'));
        }

        return ListView.builder(
          itemCount: state.invoices.length,
          itemBuilder: (context, i) {
            final inv = state.invoices[i];
            return ListTile(
              title: Text(inv.invoiceNumber),
              subtitle: Text(
                  '${inv.contractor} • ${inv.grossAmount.toStringAsFixed(2)} zł'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => context.go('/form?id=${inv.id}'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _showDeleteDialog(context, inv),
                  ),
                ],
              ),
              onTap: () => context.go('/form?id=${inv.id}'),
              onLongPress: () async {
                if (inv.attachmentPath != null) {
                  await OpenFilex.open(inv.attachmentPath!);
                }
              },
            );
          },
        );
      },
    );
  }
}

void _showDeleteDialog(BuildContext context, InvoiceIsar invoice) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Usunąć fakturę?'),
      content:
          Text('Faktura nr ${invoice.invoiceNumber}\n${invoice.contractor}'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('Anuluj'),
        ),
        TextButton(
          onPressed: () async {
            final isar = getIt<Isar>();
            await isar.writeTxn(() async {
              await isar.invoiceIsars.delete(invoice.isarId);
            });
            if (ctx.mounted) Navigator.pop(ctx);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Faktura usunięta'),
                backgroundColor: Colors.red,
              ),
            );
          },
          child: const Text('Usuń', style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}
