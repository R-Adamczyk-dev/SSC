import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:ssc_invoice_app/core/database/isar_service.dart';
import 'package:ssc_invoice_app/features/invoice/data/models/invoice_isar.dart';
import 'package:ssc_invoice_app/features/invoice/domain/entities/invoice.dart';
import 'package:ssc_invoice_app/features/invoice/domain/repositories/invoice_local_data_source.dart';

@LazySingleton(as: InvoiceLocalDataSource)
class InvoiceLocalDataSourceImpl implements InvoiceLocalDataSource {
  final IsarService isarService;

  InvoiceLocalDataSourceImpl(this.isarService);

  Isar get _isar => isarService.instance;

  @override
  Future<List<Invoice>> getAllInvoices() async {
    final invoices = await _isar.invoiceIsars.where().findAll();
    return invoices.map((e) => e.toDomain()).toList();
  }

  @override
  Future<Invoice?> getInvoice(String id) async {
    final invoice = await _isar.invoiceIsars.where().idEqualTo(id).findFirst();
    return invoice?.toDomain();
  }

  @override
  Future<void> saveInvoice(Invoice invoice) async {
    final isarInvoice = InvoiceIsar()
      ..id = invoice.id
      ..invoiceNumber = invoice.invoiceNumber
      ..contractor = invoice.contractor
      ..netAmount = invoice.netAmount
      ..vatRate = invoice.vatRate
      ..grossAmount = invoice.grossAmount
      ..attachmentPath = invoice.attachmentPath
      ..attachmentName = invoice.attachmentName;

    if (invoice.id.isNotEmpty) {
      final existing =
          await _isar.invoiceIsars.where().idEqualTo(invoice.id).findFirst();
      if (existing != null) {
        isarInvoice.isarId = existing.isarId;
      }
    }

    await _isar.writeTxn(() async {
      await _isar.invoiceIsars.put(isarInvoice);
    });
  }

  @override
  Future<void> deleteInvoice(String id) async {
    await _isar.writeTxn(() async {
      await _isar.invoiceIsars.where().idEqualTo(id).deleteFirst();
    });
  }
}
