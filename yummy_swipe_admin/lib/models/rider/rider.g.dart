// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rider.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RiderCollectionReference
    implements
        RiderQuery,
        FirestoreCollectionReference<Rider, RiderQuerySnapshot> {
  factory RiderCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RiderCollectionReference;

  static Rider fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Rider.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Rider value,
    SetOptions? options,
  ) {
    return _$RiderToJson(value);
  }

  @override
  CollectionReference<Rider> get reference;

  @override
  RiderDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RiderDocumentReference> add(Rider value);
}

class _$RiderCollectionReference extends _$RiderQuery
    implements RiderCollectionReference {
  factory _$RiderCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RiderCollectionReference._(
      firestore.collection('Rider').withConverter(
            fromFirestore: RiderCollectionReference.fromFirestore,
            toFirestore: RiderCollectionReference.toFirestore,
          ),
    );
  }

  _$RiderCollectionReference._(
    CollectionReference<Rider> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Rider> get reference =>
      super.reference as CollectionReference<Rider>;

  @override
  RiderDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return RiderDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RiderDocumentReference> add(Rider value) {
    return reference.add(value).then((ref) => RiderDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RiderCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RiderDocumentReference
    extends FirestoreDocumentReference<Rider, RiderDocumentSnapshot> {
  factory RiderDocumentReference(DocumentReference<Rider> reference) =
      _$RiderDocumentReference;

  DocumentReference<Rider> get reference;

  /// A reference to the [RiderCollectionReference] containing this document.
  RiderCollectionReference get parent {
    return _$RiderCollectionReference(reference.firestore);
  }

  @override
  Stream<RiderDocumentSnapshot> snapshots();

  @override
  Future<RiderDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    String phone,
    FieldValue phoneFieldValue,
    String city,
    FieldValue cityFieldValue,
    String vehicleType,
    FieldValue vehicleTypeFieldValue,
    bool isAvailable,
    FieldValue isAvailableFieldValue,
    String currentOrderId,
    FieldValue currentOrderIdFieldValue,
    bool active,
    FieldValue activeFieldValue,
    List<String> fcmTokens,
    FieldValue fcmTokensFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime updatedAt,
    FieldValue updatedAtFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    String phone,
    FieldValue phoneFieldValue,
    String city,
    FieldValue cityFieldValue,
    String vehicleType,
    FieldValue vehicleTypeFieldValue,
    bool isAvailable,
    FieldValue isAvailableFieldValue,
    String currentOrderId,
    FieldValue currentOrderIdFieldValue,
    bool active,
    FieldValue activeFieldValue,
    List<String> fcmTokens,
    FieldValue fcmTokensFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime updatedAt,
    FieldValue updatedAtFieldValue,
  });
}

class _$RiderDocumentReference
    extends FirestoreDocumentReference<Rider, RiderDocumentSnapshot>
    implements RiderDocumentReference {
  _$RiderDocumentReference(this.reference);

  @override
  final DocumentReference<Rider> reference;

  /// A reference to the [RiderCollectionReference] containing this document.
  RiderCollectionReference get parent {
    return _$RiderCollectionReference(reference.firestore);
  }

  @override
  Stream<RiderDocumentSnapshot> snapshots() {
    return reference.snapshots().map(RiderDocumentSnapshot._);
  }

  @override
  Future<RiderDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RiderDocumentSnapshot._);
  }

  @override
  Future<RiderDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(RiderDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? phone = _sentinel,
    FieldValue? phoneFieldValue,
    Object? city = _sentinel,
    FieldValue? cityFieldValue,
    Object? vehicleType = _sentinel,
    FieldValue? vehicleTypeFieldValue,
    Object? isAvailable = _sentinel,
    FieldValue? isAvailableFieldValue,
    Object? currentOrderId = _sentinel,
    FieldValue? currentOrderIdFieldValue,
    Object? active = _sentinel,
    FieldValue? activeFieldValue,
    Object? fcmTokens = _sentinel,
    FieldValue? fcmTokensFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      phone == _sentinel || phoneFieldValue == null,
      "Cannot specify both phone and phoneFieldValue",
    );
    assert(
      city == _sentinel || cityFieldValue == null,
      "Cannot specify both city and cityFieldValue",
    );
    assert(
      vehicleType == _sentinel || vehicleTypeFieldValue == null,
      "Cannot specify both vehicleType and vehicleTypeFieldValue",
    );
    assert(
      isAvailable == _sentinel || isAvailableFieldValue == null,
      "Cannot specify both isAvailable and isAvailableFieldValue",
    );
    assert(
      currentOrderId == _sentinel || currentOrderIdFieldValue == null,
      "Cannot specify both currentOrderId and currentOrderIdFieldValue",
    );
    assert(
      active == _sentinel || activeFieldValue == null,
      "Cannot specify both active and activeFieldValue",
    );
    assert(
      fcmTokens == _sentinel || fcmTokensFieldValue == null,
      "Cannot specify both fcmTokens and fcmTokensFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    final json = {
      if (name != _sentinel) 'name': name as String,
      if (nameFieldValue != null) 'name': nameFieldValue,
      if (phone != _sentinel) 'phone': phone as String,
      if (phoneFieldValue != null) 'phone': phoneFieldValue,
      if (city != _sentinel) 'city': city as String,
      if (cityFieldValue != null) 'city': cityFieldValue,
      if (vehicleType != _sentinel) 'vehicleType': vehicleType as String,
      if (vehicleTypeFieldValue != null) 'vehicleType': vehicleTypeFieldValue,
      if (isAvailable != _sentinel) 'isAvailable': isAvailable as bool,
      if (isAvailableFieldValue != null) 'isAvailable': isAvailableFieldValue,
      if (currentOrderId != _sentinel)
        'currentOrderId': currentOrderId as String,
      if (currentOrderIdFieldValue != null)
        'currentOrderId': currentOrderIdFieldValue,
      if (active != _sentinel) 'active': active as bool,
      if (activeFieldValue != null) 'active': activeFieldValue,
      if (fcmTokens != _sentinel) 'fcmTokens': fcmTokens as List<String>,
      if (fcmTokensFieldValue != null) 'fcmTokens': fcmTokensFieldValue,
      if (createdAt != _sentinel) 'createdAt': createdAt as DateTime?,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? phone = _sentinel,
    FieldValue? phoneFieldValue,
    Object? city = _sentinel,
    FieldValue? cityFieldValue,
    Object? vehicleType = _sentinel,
    FieldValue? vehicleTypeFieldValue,
    Object? isAvailable = _sentinel,
    FieldValue? isAvailableFieldValue,
    Object? currentOrderId = _sentinel,
    FieldValue? currentOrderIdFieldValue,
    Object? active = _sentinel,
    FieldValue? activeFieldValue,
    Object? fcmTokens = _sentinel,
    FieldValue? fcmTokensFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      phone == _sentinel || phoneFieldValue == null,
      "Cannot specify both phone and phoneFieldValue",
    );
    assert(
      city == _sentinel || cityFieldValue == null,
      "Cannot specify both city and cityFieldValue",
    );
    assert(
      vehicleType == _sentinel || vehicleTypeFieldValue == null,
      "Cannot specify both vehicleType and vehicleTypeFieldValue",
    );
    assert(
      isAvailable == _sentinel || isAvailableFieldValue == null,
      "Cannot specify both isAvailable and isAvailableFieldValue",
    );
    assert(
      currentOrderId == _sentinel || currentOrderIdFieldValue == null,
      "Cannot specify both currentOrderId and currentOrderIdFieldValue",
    );
    assert(
      active == _sentinel || activeFieldValue == null,
      "Cannot specify both active and activeFieldValue",
    );
    assert(
      fcmTokens == _sentinel || fcmTokensFieldValue == null,
      "Cannot specify both fcmTokens and fcmTokensFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    final json = {
      if (name != _sentinel) 'name': name as String,
      if (nameFieldValue != null) 'name': nameFieldValue,
      if (phone != _sentinel) 'phone': phone as String,
      if (phoneFieldValue != null) 'phone': phoneFieldValue,
      if (city != _sentinel) 'city': city as String,
      if (cityFieldValue != null) 'city': cityFieldValue,
      if (vehicleType != _sentinel) 'vehicleType': vehicleType as String,
      if (vehicleTypeFieldValue != null) 'vehicleType': vehicleTypeFieldValue,
      if (isAvailable != _sentinel) 'isAvailable': isAvailable as bool,
      if (isAvailableFieldValue != null) 'isAvailable': isAvailableFieldValue,
      if (currentOrderId != _sentinel)
        'currentOrderId': currentOrderId as String,
      if (currentOrderIdFieldValue != null)
        'currentOrderId': currentOrderIdFieldValue,
      if (active != _sentinel) 'active': active as bool,
      if (activeFieldValue != null) 'active': activeFieldValue,
      if (fcmTokens != _sentinel) 'fcmTokens': fcmTokens as List<String>,
      if (fcmTokensFieldValue != null) 'fcmTokens': fcmTokensFieldValue,
      if (createdAt != _sentinel) 'createdAt': createdAt as DateTime?,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is RiderDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class RiderQuery implements QueryReference<Rider, RiderQuerySnapshot> {
  @override
  RiderQuery limit(int limit);

  @override
  RiderQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  RiderQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  RiderQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  RiderQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RiderQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RiderQuery wherePhone({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RiderQuery whereCity({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RiderQuery whereVehicleType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RiderQuery whereIsAvailable({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  RiderQuery whereCurrentOrderId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RiderQuery whereActive({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  RiderQuery whereFcmTokens({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });
  RiderQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  RiderQuery whereUpdatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });

  RiderQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByPhone({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByCity({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByVehicleType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByIsAvailable({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByCurrentOrderId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByActive({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByFcmTokens({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });

  RiderQuery orderByUpdatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  });
}

class _$RiderQuery extends QueryReference<Rider, RiderQuerySnapshot>
    implements RiderQuery {
  _$RiderQuery(
    this._collection, {
    required Query<Rider> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<RiderQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(RiderQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<RiderQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RiderQuerySnapshot._fromQuerySnapshot);
  }

  @override
  RiderQuery limit(int limit) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RiderQuery limitToLast(int limit) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery wherePhone({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['phone']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereCity({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['city']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereVehicleType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['vehicleType']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereIsAvailable({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['isAvailable']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereCurrentOrderId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['currentOrderId']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereActive({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['active']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereFcmTokens({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['fcmTokens']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['createdAt']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery whereUpdatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RiderFieldMap['updatedAt']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  RiderQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RiderFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByPhone({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RiderFieldMap['phone']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByCity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RiderFieldMap['city']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByVehicleType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RiderFieldMap['vehicleType']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByIsAvailable({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RiderFieldMap['isAvailable']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByCurrentOrderId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RiderFieldMap['currentOrderId']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByActive({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RiderFieldMap['active']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByFcmTokens({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RiderFieldMap['fcmTokens']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RiderFieldMap['createdAt']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RiderQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RiderDocumentSnapshot? startAtDocument,
    RiderDocumentSnapshot? endAtDocument,
    RiderDocumentSnapshot? endBeforeDocument,
    RiderDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RiderFieldMap['updatedAt']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RiderQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$RiderQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RiderDocumentSnapshot extends FirestoreDocumentSnapshot<Rider> {
  RiderDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Rider> snapshot;

  @override
  RiderDocumentReference get reference {
    return RiderDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Rider? data;
}

class RiderQuerySnapshot
    extends FirestoreQuerySnapshot<Rider, RiderQueryDocumentSnapshot> {
  RiderQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory RiderQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Rider> snapshot,
  ) {
    final docs = snapshot.docs.map(RiderQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        RiderDocumentSnapshot._,
      );
    }).toList();

    return RiderQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<RiderDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    RiderDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<RiderDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Rider> snapshot;

  @override
  final List<RiderQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RiderDocumentSnapshot>> docChanges;
}

class RiderQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Rider>
    implements RiderDocumentSnapshot {
  RiderQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Rider> snapshot;

  @override
  final Rider data;

  @override
  RiderDocumentReference get reference {
    return RiderDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rider _$RiderFromJson(Map<String, dynamic> json) => Rider(
      name: json['name'] as String,
      phone: json['phone'] as String,
      city: json['city'] as String,
      vehicleType: json['vehicleType'] as String,
      age: json['age'] as String,
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      currentOrderId: json['currentOrderId'] as String? ?? '',
      isAvailable: json['isAvailable'] as bool? ?? true,
      active: json['active'] as bool? ?? true,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      location: const LatLngConverter().fromJson(json['location']),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

const _$RiderFieldMap = <String, String>{
  'name': 'name',
  'phone': 'phone',
  'city': 'city',
  'vehicleType': 'vehicleType',
  'age': 'age',
  'isAvailable': 'isAvailable',
  'currentOrderId': 'currentOrderId',
  'active': 'active',
  'fcmTokens': 'fcmTokens',
  'location': 'location',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
};

Map<String, dynamic> _$RiderToJson(Rider instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'city': instance.city,
      'vehicleType': instance.vehicleType,
      'age': _$RiderAgeCategoryEnumMap[instance.age]!,
      'isAvailable': instance.isAvailable,
      'currentOrderId': instance.currentOrderId,
      'active': instance.active,
      'fcmTokens': instance.fcmTokens,
      'location': const LatLngConverter().toJson(instance.location),
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$RiderAgeCategoryEnumMap = {
  RiderAgeCategory.minor: 'minor',
  RiderAgeCategory.adult: 'adult',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
