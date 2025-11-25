import 'package:ssc_invoice_app/features/invoice/domain/entities/invoice.dart';

abstract class InvoiceLocalDataSource {
  Future<List<Invoice>> getAllInvoices();
  Future<Invoice?> getInvoice(String id);
  Future<void> saveInvoice(Invoice invoice);
  Future<void> deleteInvoice(String id);
}
