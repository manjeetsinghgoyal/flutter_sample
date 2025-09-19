import 'package:json_annotation/json_annotation.dart';

part 'bill_reading.g.dart';

@JsonSerializable()
class BillReading {
  final String id;
  final String consumerNo;
  final String meterNo;
  final double reading;
  final DateTime readingDate;
  final String? photoPath;
  final String? remarks;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final bool synced;

  BillReading({
    required this.id,
    required this.consumerNo,
    required this.meterNo,
    required this.reading,
    required this.readingDate,
    this.photoPath,
    this.remarks,
    this.synced = false,
  });

  factory BillReading.fromJson(Map<String, dynamic> json) =>
      _$BillReadingFromJson(json);

  Map<String, dynamic> toJson() => _$BillReadingToJson(this);

  // Helpers to map int <-> bool
  static bool _fromJson(dynamic value) {
    if (value is bool) return value;
    if (value is int) return value == 1;
    return false;
  }

  static int _toJson(bool value) => value ? 1 : 0;
}
