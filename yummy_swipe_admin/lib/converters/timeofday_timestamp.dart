import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeOfDayToTimestampConverter implements JsonConverter<TimeOfDay, Timestamp> {
  const TimeOfDayToTimestampConverter();

  @override
  TimeOfDay fromJson(Timestamp json) {
    return TimeOfDay.fromDateTime(json.toDate());
  }

  @override
  Timestamp toJson(TimeOfDay time) {
    return Timestamp.fromDate(DateTime(2022, 1, 1, time.hour, time.minute));
  }
}
