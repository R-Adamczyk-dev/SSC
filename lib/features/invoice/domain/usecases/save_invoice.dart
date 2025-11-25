import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ssc_invoice_app/core/error/failures.dart';
import '../entities/invoice.dart';
import '../repositories/invoice_repository.dart';

@injectable
class SaveInvoice {
  final InvoiceRepository repository;
  SaveInvoice(this.repository);

  Future<Either<Failure, Unit>> call(Invoice invoice) {
    return repository.saveInvoice(invoice);
  }
}
