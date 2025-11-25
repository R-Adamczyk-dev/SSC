import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

import 'package:ssc_invoice_app/features/invoice/domain/entities/invoice.dart';
import 'package:ssc_invoice_app/features/invoice/domain/usecases/delete_invoice.dart';
import 'package:ssc_invoice_app/features/invoice/domain/usecases/get_invoice.dart';
import 'package:ssc_invoice_app/features/invoice/domain/usecases/save_invoice.dart';
import 'package:uuid/uuid.dart';

import 'invoice_form_state.dart';
import '../../../domain/entities/vat_rate.dart';

@injectable
class InvoiceFormCubit extends Cubit<InvoiceFormState> {
  final SaveInvoice saveInvoice;
  final GetInvoice getInvoice;
  final DeleteInvoice deleteInvoice;

  InvoiceFormCubit(
    this.saveInvoice,
    this.getInvoice,
    this.deleteInvoice,
  ) : super(InvoiceFormState.initial());

  Future<void> loadInvoice(String? id) async {
    if (id == null) return;

    final result = await getInvoice(id);
    result.fold((failure) => emit(state.copyWith(error: failure.message)),
        (invoice) {
      if (invoice == null) {
        emit(state.copyWith(error: 'Faktura nie istnieje'));
        return;
      }

      state.invoiceNumberController.text = invoice.invoiceNumber;
      state.contractorController.text = invoice.contractor;
      state.netAmountController.text = invoice.netAmount.toStringAsFixed(2);

      emit(state.copyWith(
        isEdit: true,
        invoiceId: invoice.id,
        invoiceNumber: invoice.invoiceNumber,
        contractor: invoice.contractor,
        netAmount: invoice.netAmount.toString(),
        vatRate: invoice.vatRate,
        grossAmount: invoice.grossAmount.toStringAsFixed(2),
        attachmentPath: invoice.attachmentPath,
        attachmentName: invoice.attachmentName,
      ));
    });
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
        attachmentPath: result!.files.first.path,
        attachmentName: result.files.first.name,
      ));
    }
  }

  void setAttachment(String path, String name) {
    emit(state.copyWith(
      attachmentPath: path,
      attachmentName: name,
    ));
  }

  void removeAttachment() {
    emit(state.copyWith(attachmentPath: null, attachmentName: null));
  }

  Future<void> save() async {
    if (!_validate()) return;

    final invoice = Invoice(
      id: state.isEdit ? state.invoiceId ?? '' : Uuid().v4(),
      invoiceNumber: state.invoiceNumber,
      contractor: state.contractor,
      netAmount: double.parse(state.netAmount.replaceAll(',', '.')),
      vatRate: state.vatRate,
      grossAmount: double.parse(state.grossAmount),
      attachmentPath: state.attachmentPath,
      attachmentName: state.attachmentName,
    );

    final result = await saveInvoice(invoice);
    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (_) => emit(state.copyWith(saved: true)),
    );
  }

  bool _validate() {
    final hasError = state.invoiceNumber.isEmpty ||
        state.contractor.isEmpty ||
        state.netAmount.isEmpty;
    emit(state.copyWith(showErrors: true));
    return !hasError;
  }
}
