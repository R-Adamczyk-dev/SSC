import 'package:dartz/dartz.dart';
import 'package:ssc_invoice_app/core/error/failures.dart';
import '../entities/invoice.dart';

abstract class InvoiceRepository {
  Future<Either<Failure, List<Invoice>>> getAllInvoices();
  Future<Either<Failure, Invoice?>> getInvoice(String id);
  Future<Either<Failure, Unit>> saveInvoice(Invoice invoice);
  Future<Either<Failure, Unit>> deleteInvoice(String id);
}
