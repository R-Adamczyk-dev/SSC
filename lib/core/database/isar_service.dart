import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/invoice/data/models/invoice_isar.dart';
import 'package:injectable/injectable.dart';

@singleton
class IsarService {
  late final Isar isar;

  @lazySingleton
  @preResolve
  Future<IsarService> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [InvoiceIsarSchema],
      directory: dir.path,
    );
    return this;
  }

  Isar get instance => isar;
}
