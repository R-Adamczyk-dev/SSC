import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ssc_invoice_app/core/error/failures.dart';
import '../entities/invoice.dart';
import '../repositories/invoice_repository.dart';

@injectable
class GetInvoice {
  final InvoiceRepository repository;
  GetInvoice(this.repository);

  Future<Either<Failure, Invoice?>> call(String id) {
    return repository.getInvoice(id);
  }
}
