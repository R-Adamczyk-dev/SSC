import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/vat_rate.dart';

class InvoiceFormState extends Equatable {
  final bool isEdit;
  final String? invoiceId;
  final String invoiceNumber;
  final String contractor;
  final String netAmount;
  final VatRate vatRate;
  final String grossAmount;
  final String? attachmentPath;
  final String? attachmentName;
  final bool showErrors;
  final bool saved;
  final String? error;
  final TextEditingController invoiceNumberController;
  final TextEditingController contractorController;
  final TextEditingController netAmountController;

  const InvoiceFormState({
    required this.isEdit,
    this.invoiceId,
    required this.invoiceNumber,
    required this.contractor,
    required this.netAmount,
    required this.vatRate,
    required this.grossAmount,
    this.attachmentPath,
    this.attachmentName,
    required this.showErrors,
    required this.saved,
    this.error,
    required this.invoiceNumberController,
    required this.contractorController,
    required this.netAmountController,
  });

  factory InvoiceFormState.initial() => InvoiceFormState(
        isEdit: false,
        invoiceNumber: '',
        contractor: '',
        netAmount: '',
        vatRate: VatRate.twentyThree,
        grossAmount: '0.00',
        showErrors: false,
        saved: false,
        invoiceNumberController: TextEditingController(),
        contractorController: TextEditingController(),
        netAmountController: TextEditingController(),
      );

  InvoiceFormState copyWith({
    bool? isEdit,
    String? invoiceId,
    String? invoiceNumber,
    String? contractor,
    String? netAmount,
    VatRate? vatRate,
    String? grossAmount,
    String? attachmentPath,
    String? attachmentName,
    bool? showErrors,
    bool? saved,
    String? error,
    TextEditingController? invoiceNumberController,
    TextEditingController? contractorController,
    TextEditingController? netAmountController,
  }) {
    return InvoiceFormState(
      isEdit: isEdit ?? this.isEdit,
      invoiceId: invoiceId ?? this.invoiceId,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      contractor: contractor ?? this.contractor,
      netAmount: netAmount ?? this.netAmount,
      vatRate: vatRate ?? this.vatRate,
      grossAmount: grossAmount ?? this.grossAmount,
      attachmentPath: attachmentPath ?? this.attachmentPath,
      attachmentName: attachmentName ?? this.attachmentName,
      showErrors: showErrors ?? this.showErrors,
      saved: saved ?? this.saved,
      error: error ?? this.error,
      invoiceNumberController:
          invoiceNumberController ?? this.invoiceNumberController,
      contractorController: contractorController ?? this.contractorController,
      netAmountController: netAmountController ?? this.netAmountController,
    );
  }

  @override
  List<Object?> get props => [
        isEdit,
        invoiceId,
        invoiceNumber,
        contractor,
        netAmount,
        vatRate,
        grossAmount,
        attachmentPath,
        attachmentName,
        showErrors,
        saved,
        error,
        invoiceNumberController,
        contractorController,
        netAmountController,
      ];
}
