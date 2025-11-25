import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ssc_invoice_app/core/error/failures.dart';
import 'package:ssc_invoice_app/features/invoice/domain/repositories/invoice_local_data_source.dart';
import '../../domain/entities/invoice.dart';
import '../../domain/repositories/invoice_repository.dart';

@LazySingleton(as: InvoiceRepository)
class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceLocalDataSource localDataSource;

  InvoiceRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Unit>> saveInvoice(Invoice invoice) async {
    try {
      await localDataSource.saveInvoice(invoice);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Invoice>>> getAllInvoices() async {
    try {
      final invoices = await localDataSource.getAllInvoices();
      return Right(invoices);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Invoice?>> getInvoice(String id) async {
    try {
      final invoice = await localDataSource.getInvoice(id);
      return Right(invoice);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteInvoice(String id) async {
    try {
      await localDataSource.deleteInvoice(id);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
