// import 'package:hive/hive.dart';
// import '../../domain/entities/vat_rate.dart';

// class VatRateAdapter extends TypeAdapter<VatRate> {
//   @override
//   final int typeId = 1;

//   @override
//   VatRate read(BinaryReader reader) {
//     final index = reader.readByte();
//     return VatRate.values[index];
//   }

//   @override
//   void write(BinaryWriter writer, VatRate obj) {
//     writer.writeByte(obj.index);
//   }
// }