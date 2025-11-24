// lib/features/invoice/data/models/invoice_isar.dart
import 'package:isar/isar.dart';
import '../../domain/entities/invoice.dart';
import '../../domain/entities/vat_rate.dart';

part 'invoice_isar.g.dart'; // tylko Isar generator

@Collection()
class InvoiceIsar {
  Id isarId = Isar.autoIncrement;

  @Index()
  String id = '';
  String invoiceNumber = '';
  String contractor = '';
  double netAmount = 0.0;

  @enumerated
  VatRate vatRate = VatRate.twentyThree;

  double grossAmount = 0.0;
  DateTime createdAt = DateTime.now();
  String? attachmentPath;
  String? attachmentName;

  InvoiceIsar();

  InvoiceIsar.create({
    required String id,
    required String invoiceNumber,
    required String contractor,
    required double netAmount,
    required VatRate vatRate,
    required double grossAmount,
    required DateTime createdAt,
    this.attachmentPath,
    this.attachmentName,
  }) {
    this.id = id;
    this.invoiceNumber = invoiceNumber;
    this.contractor = contractor;
    this.netAmount = netAmount;
    this.vatRate = vatRate;
    this.grossAmount = grossAmount;
    this.createdAt = createdAt;
  }

  InvoiceIsar.fromDomain(Invoice invoice) {
    id = invoice.id;
    invoiceNumber = invoice.invoiceNumber;
    contractor = invoice.contractor;
    netAmount = invoice.netAmount;
    vatRate = invoice.vatRate;
    grossAmount = invoice.grossAmount;
    createdAt = invoice.createdAt;
    attachmentPath = invoice.attachmentPath;
    attachmentName = invoice.attachmentName;
  }

  Invoice toDomain() => Invoice(
        id: id,
        invoiceNumber: invoiceNumber,
        contractor: contractor,
        netAmount: netAmount,
        vatRate: vatRate,
        grossAmount: grossAmount,
        createdAt: createdAt,
        attachmentPath: attachmentPath,
        attachmentName: attachmentName,
      );
}
