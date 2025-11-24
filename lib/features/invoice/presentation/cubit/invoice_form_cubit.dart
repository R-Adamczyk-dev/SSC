// lib/features/invoice/presentation/cubit/invoice_form_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ssc_invoice_app/core/di/injection.dart';
import 'package:uuid/uuid.dart';
import 'package:isar/isar.dart';
import '../../data/models/invoice_isar.dart';
import 'invoice_form_state.dart';
import '../../domain/entities/vat_rate.dart';

class InvoiceFormCubit extends Cubit<InvoiceFormState> {
  final Isar _isar = getIt<Isar>();
  final String? editId;

  InvoiceFormCubit(this.editId) : super(InvoiceFormState.initial()) {
    if (editId != null) _loadForEdit();
  }

  Future<void> _loadForEdit() async {
    if (editId == null) return;

    final invoice =
        await _isar.invoiceIsars.where().idEqualTo(editId!).findFirst();

    if (invoice != null) {
      emit(state.copyWith(
        invoiceNumber: invoice.invoiceNumber,
        contractor: invoice.contractor,
        netAmount: invoice.netAmount.toStringAsFixed(2),
        vatRate: invoice.vatRate,
        grossAmount: invoice.grossAmount.toStringAsFixed(2),
        attachmentName: invoice.attachmentName,
        invoiceNumberController:
            TextEditingController(text: invoice.invoiceNumber),
        contractorController: TextEditingController(text: invoice.contractor),
        netAmountController:
            TextEditingController(text: invoice.netAmount.toStringAsFixed(2)),
      ));
    }
  }

  void updateInvoiceNumber(String value) {
    emit(state.copyWith(
      invoiceNumber: value,
      invoiceNumberController: state.invoiceNumberController..text = value,
    ));
  }

  void updateContractor(String value) {
    emit(state.copyWith(
      contractor: value,
      contractorController: state.contractorController..text = value,
    ));
  }

  void updateNetAmount(String value) {
    emit(state.copyWith(
      netAmount: value,
      netAmountController: state.netAmountController..text = value,
    ));
    _recalculateGross();
  }

  void updateVatRate(VatRate rate) {
    emit(state.copyWith(vatRate: rate));
    _recalculateGross();
  }

  void _recalculateGross() {
    final net = double.tryParse(state.netAmount.replaceAll(',', '.')) ?? 0.0;
    final gross = net * (1 + state.vatRate.rate);
    emit(state.copyWith(grossAmount: gross.toStringAsFixed(2)));
  }

  Future<void> pickAttachment() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result?.files.isNotEmpty ?? false) {
      emit(state.copyWith(
        attachment: result!.files.first,
        attachmentName: result.files.first.name,
      ));
    }
  }

  void removeAttachment() {
    emit(state.copyWith(attachment: null, attachmentName: null));
  }

  Future<bool> save() async {
    final net = double.tryParse(state.netAmount.replaceAll(',', '.')) ?? 0;

    if (state.invoiceNumber.isEmpty || state.contractor.isEmpty || net <= 0) {
      emit(state.copyWith(showErrors: true));
      return false;
    }

    InvoiceIsar invoice;

    if (editId != null) {
      final existing =
          await _isar.invoiceIsars.where().idEqualTo(editId!).findFirst();

      if (existing == null) return false;

      existing.invoiceNumber = state.invoiceNumber;
      existing.contractor = state.contractor;
      existing.netAmount = net;
      existing.vatRate = state.vatRate;
      existing.grossAmount =
          double.parse(state.grossAmount.replaceAll(',', '.'));
      existing.attachmentPath = state.attachment?.path;
      existing.attachmentName = state.attachmentName;
      invoice = existing;
    } else {
      invoice = InvoiceIsar()
        ..id = const Uuid().v4()
        ..invoiceNumber = state.invoiceNumber
        ..contractor = state.contractor
        ..netAmount = net
        ..vatRate = state.vatRate
        ..grossAmount = double.parse(state.grossAmount.replaceAll(',', '.'))
        ..attachmentPath = state.attachment?.path
        ..attachmentName = state.attachmentName;
    }

    await _isar.writeTxn(() => _isar.invoiceIsars.put(invoice));
    return true;
  }
}
