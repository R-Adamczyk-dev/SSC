import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ssc_invoice_app/core/error/failures.dart';
import '../repositories/invoice_repository.dart';

@injectable
class DeleteInvoice {
  final InvoiceRepository repository;
  DeleteInvoice(this.repository);

  Future<Either<Failure, Unit>> call(String id) {
    return repository.deleteInvoice(id);
  }
}
