// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillReading _$BillReadingFromJson(Map<String, dynamic> json) => BillReading(
  id: json['id'] as String,
  consumerNo: json['consumerNo'] as String,
  meterNo: json['meterNo'] as String,
  reading: (json['reading'] as num).toDouble(),
  readingDate: DateTime.parse(json['readingDate'] as String),
  photoPath: json['photoPath'] as String?,
  remarks: json['remarks'] as String?,
  synced: json['synced'] == null
      ? false
      : BillReading._fromJson(json['synced']),
);

Map<String, dynamic> _$BillReadingToJson(BillReading instance) =>
    <String, dynamic>{
      'id': instance.id,
      'consumerNo': instance.consumerNo,
      'meterNo': instance.meterNo,
      'reading': instance.reading,
      'readingDate': instance.readingDate.toIso8601String(),
      'photoPath': instance.photoPath,
      'remarks': instance.remarks,
      'synced': BillReading._toJson(instance.synced),
    };
