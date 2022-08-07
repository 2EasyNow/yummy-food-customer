import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable(createFieldMap: true)
class Customer {
  Customer({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.active = true,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory Customer.fromJson(Map<String, Object?> json) => _$CustomerFromJson(json);
  toMap() => _$CustomerToJson(this);

  final String name;
  final String email;
  final String phone;
  final String address;
  // final List<String> userNameSearch;
  // final String role;
  final bool active;
  // final bool isVisibilityPublic;
  // final List<String> groups;
  // define the converter
  @TimestampConverter()
  final DateTime? createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
}

@Collection<Customer>('Customer')
final customerRef = CustomerCollectionReference();

// @Collection<User>('Users')
// // @Collection<Comment>('Users/*/comments', name: 'comments')
// final moviesRef = MovieCollectionReference();

// @JsonSerializable()
// class Comment {
//   Comment({
//     required this.authorName,
//     required this.message,
//   });

//   final String authorName;
//   final String message;
// }

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}