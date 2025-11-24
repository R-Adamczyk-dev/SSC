// lib/features/invoice/presentation/cubit/invoice_list_cubit.dart
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:ssc_invoice_app/core/di/injection.dart';
import '../../data/models/invoice_isar.dart';

class InvoiceListState {
  final List<InvoiceIsar> invoices;
  final String searchQuery;

  const InvoiceListState({
    required this.invoices,
    this.searchQuery = '',
  });

  InvoiceListState copyWith({
    List<InvoiceIsar>? invoices,
    String? searchQuery,
  }) {
    return InvoiceListState(
      invoices: invoices ?? this.invoices,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class InvoiceListCubit extends Cubit<InvoiceListState> {
  final Isar _isar = getIt<Isar>();
  late final StreamSubscription _subscription;

  InvoiceListCubit() : super(const InvoiceListState(invoices: [])) {
    _watchInvoices();
  }

  void _watchInvoices() {
    final query = _isar.invoiceIsars.where().sortByCreatedAtDesc();

    _subscription = query.watch().listen((invoices) {
      emit(state.copyWith(invoices: _filterInvoices(invoices)));
    });

    // Pierwsze załadowanie
    query.findAll().then((invoices) {
      emit(state.copyWith(invoices: _filterInvoices(invoices)));
    });
  }

  List<InvoiceIsar> _filterInvoices(List<InvoiceIsar> all) {
    if (state.searchQuery.isEmpty) return all;

    final query = state.searchQuery.toLowerCase();
    return all.where((inv) {
      return inv.invoiceNumber.toLowerCase().contains(query) ||
          inv.contractor.toLowerCase().contains(query) ||
          inv.netAmount.toString().contains(query) ||
          inv.grossAmount.toString().contains(query);
    }).toList();
  }

  void updateSearch(String query) {
    emit(state.copyWith(searchQuery: query));
    // Re-emit z filtrowaniem
    _isar.invoiceIsars.where().findAll().then((all) {
      emit(state.copyWith(invoices: _filterInvoices(all)));
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
