import 'package:equatable/equatable.dart';
import 'vat_rate.dart';

class Invoice extends Equatable {
  final String id;
  final String invoiceNumber;
  final String contractor;
  final double netAmount;
  final VatRate vatRate;
  final double grossAmount;
  final String? attachmentPath;
  final String? attachmentName;

  const Invoice({
    required this.id,
    required this.invoiceNumber,
    required this.contractor,
    required this.netAmount,
    required this.vatRate,
    required this.grossAmount,
    this.attachmentPath,
    this.attachmentName,
  });

  @override
  List<Object?> get props => [
        id,
        invoiceNumber,
        contractor,
        netAmount,
        vatRate,
        grossAmount,
        attachmentPath,
      ];
}
