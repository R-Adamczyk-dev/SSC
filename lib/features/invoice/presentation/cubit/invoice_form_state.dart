import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ssc_invoice_app/features/invoice/domain/entities/vat_rate.dart';

class InvoiceFormState {
  final String invoiceNumber;
  final String contractor;
  final String netAmount;
  final VatRate vatRate;
  final String grossAmount;
  final PlatformFile? attachment;
  final String? attachmentName;
  final bool showErrors;

  final TextEditingController invoiceNumberController;
  final TextEditingController contractorController;
  final TextEditingController netAmountController;

  const InvoiceFormState({
    required this.invoiceNumber,
    required this.contractor,
    required this.netAmount,
    required this.vatRate,
    required this.grossAmount,
    this.attachment,
    this.attachmentName,
    required this.showErrors,
    required this.invoiceNumberController,
    required this.contractorController,
    required this.netAmountController,
  });

  factory InvoiceFormState.initial() => InvoiceFormState(
        invoiceNumber: '',
        contractor: '',
        netAmount: '',
        vatRate: VatRate.twentyThree,
        grossAmount: '0.00',
        showErrors: false,
        invoiceNumberController: TextEditingController(),
        contractorController: TextEditingController(),
        netAmountController: TextEditingController(),
      );

  InvoiceFormState copyWith({
    String? invoiceNumber,
    String? contractor,
    String? netAmount,
    VatRate? vatRate,
    String? grossAmount,
    PlatformFile? attachment,
    String? attachmentName,
    bool? showErrors,
    TextEditingController? invoiceNumberController,
    TextEditingController? contractorController,
    TextEditingController? netAmountController,
  }) {
    return InvoiceFormState(
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      contractor: contractor ?? this.contractor,
      netAmount: netAmount ?? this.netAmount,
      vatRate: vatRate ?? this.vatRate,
      grossAmount: grossAmount ?? this.grossAmount,
      attachment: attachment ?? this.attachment,
      attachmentName: attachmentName ?? this.attachmentName,
      showErrors: showErrors ?? this.showErrors,
      invoiceNumberController:
          invoiceNumberController ?? this.invoiceNumberController,
      contractorController: contractorController ?? this.contractorController,
      netAmountController: netAmountController ?? this.netAmountController,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other);
  @override
  int get hashCode => runtimeType.hashCode;
}
