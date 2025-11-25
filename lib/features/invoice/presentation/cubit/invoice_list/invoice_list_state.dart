import 'package:equatable/equatable.dart';
import '../../../domain/entities/invoice.dart';

class InvoiceListState extends Equatable {
  final List<Invoice> invoices;
  final List<Invoice> filteredInvoices;
  final bool isLoading;
  final String? error;

  const InvoiceListState({
    required this.invoices,
    required this.filteredInvoices,
    required this.isLoading,
    this.error,
  });

  factory InvoiceListState.initial() => const InvoiceListState(
        invoices: [],
        filteredInvoices: [],
        isLoading: false,
      );

  InvoiceListState copyWith({
    List<Invoice>? invoices,
    List<Invoice>? filteredInvoices,
    bool? isLoading,
    String? error,
  }) {
    return InvoiceListState(
      invoices: invoices ?? this.invoices,
      filteredInvoices: filteredInvoices ?? this.filteredInvoices,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [invoices, filteredInvoices, isLoading, error];
}
