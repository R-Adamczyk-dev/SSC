import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ssc_invoice_app/features/invoice/domain/usecases/delete_invoice.dart';
import 'package:ssc_invoice_app/features/invoice/domain/usecases/get_all_invoices.dart';
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_list/invoice_list_state.dart';

@injectable
class InvoiceListCubit extends Cubit<InvoiceListState> {
  final GetAllInvoices getAllInvoices;
  final DeleteInvoice deleteInvoice;

  InvoiceListCubit(this.getAllInvoices, this.deleteInvoice)
      : super(InvoiceListState.initial()) {
    loadInvoices();
  }

  Future<void> loadInvoices() async {
    emit(state.copyWith(isLoading: true));
    final result = await getAllInvoices();
    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (invoices) => emit(state.copyWith(
          invoices: invoices, filteredInvoices: invoices, isLoading: false)),
    );
  }

  void search(String query) {
    final filtered = state.invoices
        .where((inv) =>
            inv.invoiceNumber.toLowerCase().contains(query.toLowerCase()) ||
            inv.contractor.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(state.copyWith(filteredInvoices: filtered));
  }

  Future<void> deleteInvoiceMethod(String invoiceId) async {
    final result = await deleteInvoice(invoiceId);
    result.fold(
      (failure) => null,
      (_) => loadInvoices(),
    );
  }
}
