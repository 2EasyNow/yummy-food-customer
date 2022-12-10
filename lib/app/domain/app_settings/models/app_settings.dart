import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/converters/converters.dart';

part 'app_settings.g.dart';

@JsonSerializable(createFieldMap: true)
class AppSettings {
  AppSettings({
    this.foodTags = const [],
    this.searchInKM = 30,
    this.platformFee = 5,
    this.deliveryCost = const {
      'min': 40,
      'perKM': 15,
    },
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory AppSettings.fromJson(Map<String, Object?> json) => _$AppSettingsFromJson(json);

  final List<Map<String, String>> foodTags;
  final Map<String, int> deliveryCost;
  final int searchInKM;
  final int platformFee;

  @DateTimeToTimestampConverter()
  final DateTime updatedAt;
}

@Collection<AppSettings>('AppSettings')
final appSettingsRef = AppSettingsCollectionReference();
