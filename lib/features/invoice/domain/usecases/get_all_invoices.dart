import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ssc_invoice_app/core/error/failures.dart';
import '../entities/invoice.dart';
import '../repositories/invoice_repository.dart';

@injectable
class GetAllInvoices {
  final InvoiceRepository repository;
  GetAllInvoices(this.repository);

  Future<Either<Failure, List<Invoice>>> call() {
    return repository.getAllInvoices();
  }
}
