// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

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
abstract class RestaurantCollectionReference
    implements
        RestaurantQuery,
        FirestoreCollectionReference<Restaurant, RestaurantQuerySnapshot> {
  factory RestaurantCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RestaurantCollectionReference;

  static Restaurant fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Restaurant.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Restaurant value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Restaurant> get reference;

  @override
  RestaurantDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RestaurantDocumentReference> add(Restaurant value);
}

class _$RestaurantCollectionReference extends _$RestaurantQuery
    implements RestaurantCollectionReference {
  factory _$RestaurantCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RestaurantCollectionReference._(
      firestore.collection('Restaurant').withConverter(
            fromFirestore: RestaurantCollectionReference.fromFirestore,
            toFirestore: RestaurantCollectionReference.toFirestore,
          ),
    );
  }

  _$RestaurantCollectionReference._(
    CollectionReference<Restaurant> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Restaurant> get reference =>
      super.reference as CollectionReference<Restaurant>;

  @override
  RestaurantDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return RestaurantDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RestaurantDocumentReference> add(Restaurant value) {
    return reference.add(value).then((ref) => RestaurantDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RestaurantCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RestaurantDocumentReference
    extends FirestoreDocumentReference<Restaurant, RestaurantDocumentSnapshot> {
  factory RestaurantDocumentReference(DocumentReference<Restaurant> reference) =
      _$RestaurantDocumentReference;

  DocumentReference<Restaurant> get reference;

  /// A reference to the [RestaurantCollectionReference] containing this document.
  RestaurantCollectionReference get parent {
    return _$RestaurantCollectionReference(reference.firestore);
  }

  @override
  Stream<RestaurantDocumentSnapshot> snapshots();

  @override
  Future<RestaurantDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    String ownerName,
    FieldValue ownerNameFieldValue,
    String phone,
    FieldValue phoneFieldValue,
    String address,
    FieldValue addressFieldValue,
    String bannerImagePath,
    FieldValue bannerImagePathFieldValue,
    List<String> foodOfferingTypes,
    FieldValue foodOfferingTypesFieldValue,
    List<String> fcmTokens,
    FieldValue fcmTokensFieldValue,
    int averageTimeToCompleteOrder,
    FieldValue averageTimeToCompleteOrderFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime updatedAt,
    FieldValue updatedAtFieldValue,
    bool active,
    FieldValue activeFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    String ownerName,
    FieldValue ownerNameFieldValue,
    String phone,
    FieldValue phoneFieldValue,
    String address,
    FieldValue addressFieldValue,
    String bannerImagePath,
    FieldValue bannerImagePathFieldValue,
    List<String> foodOfferingTypes,
    FieldValue foodOfferingTypesFieldValue,
    List<String> fcmTokens,
    FieldValue fcmTokensFieldValue,
    int averageTimeToCompleteOrder,
    FieldValue averageTimeToCompleteOrderFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime updatedAt,
    FieldValue updatedAtFieldValue,
    bool active,
    FieldValue activeFieldValue,
  });
}

class _$RestaurantDocumentReference
    extends FirestoreDocumentReference<Restaurant, RestaurantDocumentSnapshot>
    implements RestaurantDocumentReference {
  _$RestaurantDocumentReference(this.reference);

  @override
  final DocumentReference<Restaurant> reference;

  /// A reference to the [RestaurantCollectionReference] containing this document.
  RestaurantCollectionReference get parent {
    return _$RestaurantCollectionReference(reference.firestore);
  }

  @override
  Stream<RestaurantDocumentSnapshot> snapshots() {
    return reference.snapshots().map(RestaurantDocumentSnapshot._);
  }

  @override
  Future<RestaurantDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RestaurantDocumentSnapshot._);
  }

  @override
  Future<RestaurantDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(RestaurantDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? ownerName = _sentinel,
    FieldValue? ownerNameFieldValue,
    Object? phone = _sentinel,
    FieldValue? phoneFieldValue,
    Object? address = _sentinel,
    FieldValue? addressFieldValue,
    Object? bannerImagePath = _sentinel,
    FieldValue? bannerImagePathFieldValue,
    Object? foodOfferingTypes = _sentinel,
    FieldValue? foodOfferingTypesFieldValue,
    Object? fcmTokens = _sentinel,
    FieldValue? fcmTokensFieldValue,
    Object? averageTimeToCompleteOrder = _sentinel,
    FieldValue? averageTimeToCompleteOrderFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
    Object? active = _sentinel,
    FieldValue? activeFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      ownerName == _sentinel || ownerNameFieldValue == null,
      "Cannot specify both ownerName and ownerNameFieldValue",
    );
    assert(
      phone == _sentinel || phoneFieldValue == null,
      "Cannot specify both phone and phoneFieldValue",
    );
    assert(
      address == _sentinel || addressFieldValue == null,
      "Cannot specify both address and addressFieldValue",
    );
    assert(
      bannerImagePath == _sentinel || bannerImagePathFieldValue == null,
      "Cannot specify both bannerImagePath and bannerImagePathFieldValue",
    );
    assert(
      foodOfferingTypes == _sentinel || foodOfferingTypesFieldValue == null,
      "Cannot specify both foodOfferingTypes and foodOfferingTypesFieldValue",
    );
    assert(
      fcmTokens == _sentinel || fcmTokensFieldValue == null,
      "Cannot specify both fcmTokens and fcmTokensFieldValue",
    );
    assert(
      averageTimeToCompleteOrder == _sentinel ||
          averageTimeToCompleteOrderFieldValue == null,
      "Cannot specify both averageTimeToCompleteOrder and averageTimeToCompleteOrderFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    assert(
      active == _sentinel || activeFieldValue == null,
      "Cannot specify both active and activeFieldValue",
    );
    final json = {
      if (name != _sentinel) 'name': name as String,
      if (nameFieldValue != null) 'name': nameFieldValue,
      if (ownerName != _sentinel) 'ownerName': ownerName as String,
      if (ownerNameFieldValue != null) 'ownerName': ownerNameFieldValue,
      if (phone != _sentinel) 'phone': phone as String,
      if (phoneFieldValue != null) 'phone': phoneFieldValue,
      if (address != _sentinel) 'address': address as String,
      if (addressFieldValue != null) 'address': addressFieldValue,
      if (bannerImagePath != _sentinel)
        'bannerImagePath': bannerImagePath as String,
      if (bannerImagePathFieldValue != null)
        'bannerImagePath': bannerImagePathFieldValue,
      if (foodOfferingTypes != _sentinel)
        'foodOfferingTypes': foodOfferingTypes as List<String>,
      if (foodOfferingTypesFieldValue != null)
        'foodOfferingTypes': foodOfferingTypesFieldValue,
      if (fcmTokens != _sentinel) 'fcmTokens': fcmTokens as List<String>,
      if (fcmTokensFieldValue != null) 'fcmTokens': fcmTokensFieldValue,
      if (averageTimeToCompleteOrder != _sentinel)
        'averageTimeToCompleteOrder': averageTimeToCompleteOrder as int,
      if (averageTimeToCompleteOrderFieldValue != null)
        'averageTimeToCompleteOrder': averageTimeToCompleteOrderFieldValue,
      if (createdAt != _sentinel) 'createdAt': createdAt as DateTime?,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
      if (active != _sentinel) 'active': active as bool,
      if (activeFieldValue != null) 'active': activeFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? ownerName = _sentinel,
    FieldValue? ownerNameFieldValue,
    Object? phone = _sentinel,
    FieldValue? phoneFieldValue,
    Object? address = _sentinel,
    FieldValue? addressFieldValue,
    Object? bannerImagePath = _sentinel,
    FieldValue? bannerImagePathFieldValue,
    Object? foodOfferingTypes = _sentinel,
    FieldValue? foodOfferingTypesFieldValue,
    Object? fcmTokens = _sentinel,
    FieldValue? fcmTokensFieldValue,
    Object? averageTimeToCompleteOrder = _sentinel,
    FieldValue? averageTimeToCompleteOrderFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
    Object? active = _sentinel,
    FieldValue? activeFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      ownerName == _sentinel || ownerNameFieldValue == null,
      "Cannot specify both ownerName and ownerNameFieldValue",
    );
    assert(
      phone == _sentinel || phoneFieldValue == null,
      "Cannot specify both phone and phoneFieldValue",
    );
    assert(
      address == _sentinel || addressFieldValue == null,
      "Cannot specify both address and addressFieldValue",
    );
    assert(
      bannerImagePath == _sentinel || bannerImagePathFieldValue == null,
      "Cannot specify both bannerImagePath and bannerImagePathFieldValue",
    );
    assert(
      foodOfferingTypes == _sentinel || foodOfferingTypesFieldValue == null,
      "Cannot specify both foodOfferingTypes and foodOfferingTypesFieldValue",
    );
    assert(
      fcmTokens == _sentinel || fcmTokensFieldValue == null,
      "Cannot specify both fcmTokens and fcmTokensFieldValue",
    );
    assert(
      averageTimeToCompleteOrder == _sentinel ||
          averageTimeToCompleteOrderFieldValue == null,
      "Cannot specify both averageTimeToCompleteOrder and averageTimeToCompleteOrderFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    assert(
      active == _sentinel || activeFieldValue == null,
      "Cannot specify both active and activeFieldValue",
    );
    final json = {
      if (name != _sentinel) 'name': name as String,
      if (nameFieldValue != null) 'name': nameFieldValue,
      if (ownerName != _sentinel) 'ownerName': ownerName as String,
      if (ownerNameFieldValue != null) 'ownerName': ownerNameFieldValue,
      if (phone != _sentinel) 'phone': phone as String,
      if (phoneFieldValue != null) 'phone': phoneFieldValue,
      if (address != _sentinel) 'address': address as String,
      if (addressFieldValue != null) 'address': addressFieldValue,
      if (bannerImagePath != _sentinel)
        'bannerImagePath': bannerImagePath as String,
      if (bannerImagePathFieldValue != null)
        'bannerImagePath': bannerImagePathFieldValue,
      if (foodOfferingTypes != _sentinel)
        'foodOfferingTypes': foodOfferingTypes as List<String>,
      if (foodOfferingTypesFieldValue != null)
        'foodOfferingTypes': foodOfferingTypesFieldValue,
      if (fcmTokens != _sentinel) 'fcmTokens': fcmTokens as List<String>,
      if (fcmTokensFieldValue != null) 'fcmTokens': fcmTokensFieldValue,
      if (averageTimeToCompleteOrder != _sentinel)
        'averageTimeToCompleteOrder': averageTimeToCompleteOrder as int,
      if (averageTimeToCompleteOrderFieldValue != null)
        'averageTimeToCompleteOrder': averageTimeToCompleteOrderFieldValue,
      if (createdAt != _sentinel) 'createdAt': createdAt as DateTime?,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
      if (active != _sentinel) 'active': active as bool,
      if (activeFieldValue != null) 'active': activeFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is RestaurantDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class RestaurantQuery
    implements QueryReference<Restaurant, RestaurantQuerySnapshot> {
  @override
  RestaurantQuery limit(int limit);

  @override
  RestaurantQuery limitToLast(int limit);

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
  RestaurantQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
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
  RestaurantQuery whereFieldPath(
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

  RestaurantQuery whereDocumentId({
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
  RestaurantQuery whereName({
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
  RestaurantQuery whereOwnerName({
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
  RestaurantQuery wherePhone({
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
  RestaurantQuery whereAddress({
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
  RestaurantQuery whereBannerImagePath({
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
  RestaurantQuery whereFoodOfferingTypes({
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
  RestaurantQuery whereFcmTokens({
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
  RestaurantQuery whereAverageTimeToCompleteOrder({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  RestaurantQuery whereCreatedAt({
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
  RestaurantQuery whereUpdatedAt({
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
  RestaurantQuery whereActive({
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

  RestaurantQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByOwnerName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByPhone({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByAddress({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByBannerImagePath({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByFoodOfferingTypes({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByFcmTokens({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByAverageTimeToCompleteOrder({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByUpdatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });

  RestaurantQuery orderByActive({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  });
}

class _$RestaurantQuery
    extends QueryReference<Restaurant, RestaurantQuerySnapshot>
    implements RestaurantQuery {
  _$RestaurantQuery(
    this._collection, {
    required Query<Restaurant> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<RestaurantQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(RestaurantQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<RestaurantQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(RestaurantQuerySnapshot._fromQuerySnapshot);
  }

  @override
  RestaurantQuery limit(int limit) {
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RestaurantQuery limitToLast(int limit) {
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  RestaurantQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery whereFieldPath(
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
    return _$RestaurantQuery(
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

  RestaurantQuery whereDocumentId({
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
    return _$RestaurantQuery(
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

  RestaurantQuery whereName({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['name']!,
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

  RestaurantQuery whereOwnerName({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['ownerName']!,
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

  RestaurantQuery wherePhone({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['phone']!,
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

  RestaurantQuery whereAddress({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['address']!,
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

  RestaurantQuery whereBannerImagePath({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['bannerImagePath']!,
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

  RestaurantQuery whereFoodOfferingTypes({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['foodOfferingTypes']!,
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

  RestaurantQuery whereFcmTokens({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['fcmTokens']!,
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

  RestaurantQuery whereAverageTimeToCompleteOrder({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['averageTimeToCompleteOrder']!,
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

  RestaurantQuery whereCreatedAt({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['createdAt']!,
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

  RestaurantQuery whereUpdatedAt({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['updatedAt']!,
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

  RestaurantQuery whereActive({
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
    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RestaurantFieldMap['active']!,
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

  RestaurantQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RestaurantFieldMap['name']!,
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByOwnerName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RestaurantFieldMap['ownerName']!, descending: descending);
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByPhone({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RestaurantFieldMap['phone']!, descending: descending);
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByAddress({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RestaurantFieldMap['address']!, descending: descending);
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByBannerImagePath({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$RestaurantFieldMap['bannerImagePath']!,
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByFoodOfferingTypes({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$RestaurantFieldMap['foodOfferingTypes']!,
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByFcmTokens({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RestaurantFieldMap['fcmTokens']!, descending: descending);
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByAverageTimeToCompleteOrder({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$RestaurantFieldMap['averageTimeToCompleteOrder']!,
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RestaurantFieldMap['createdAt']!, descending: descending);
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RestaurantFieldMap['updatedAt']!, descending: descending);
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RestaurantQuery orderByActive({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RestaurantDocumentSnapshot? startAtDocument,
    RestaurantDocumentSnapshot? endAtDocument,
    RestaurantDocumentSnapshot? endBeforeDocument,
    RestaurantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RestaurantFieldMap['active']!, descending: descending);
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

    return _$RestaurantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$RestaurantQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RestaurantDocumentSnapshot extends FirestoreDocumentSnapshot<Restaurant> {
  RestaurantDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Restaurant> snapshot;

  @override
  RestaurantDocumentReference get reference {
    return RestaurantDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Restaurant? data;
}

class RestaurantQuerySnapshot extends FirestoreQuerySnapshot<Restaurant,
    RestaurantQueryDocumentSnapshot> {
  RestaurantQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory RestaurantQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Restaurant> snapshot,
  ) {
    final docs = snapshot.docs.map(RestaurantQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        RestaurantDocumentSnapshot._,
      );
    }).toList();

    return RestaurantQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<RestaurantDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    RestaurantDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<RestaurantDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Restaurant> snapshot;

  @override
  final List<RestaurantQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RestaurantDocumentSnapshot>> docChanges;
}

class RestaurantQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Restaurant>
    implements RestaurantDocumentSnapshot {
  RestaurantQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Restaurant> snapshot;

  @override
  final Restaurant data;

  @override
  RestaurantDocumentReference get reference {
    return RestaurantDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      id: json['id'] as String? ?? '',
      name: json['name'] as String,
      ownerName: json['ownerName'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      coordinates:
          const LatLngConverter().fromJson(json['coordinates'] as Object),
      openingTime: const TimeOfDayToTimestampConverter()
          .fromJson(json['openingTime'] as Timestamp),
      closingTime: const TimeOfDayToTimestampConverter()
          .fromJson(json['closingTime'] as Timestamp),
      averageTimeToCompleteOrder: json['averageTimeToCompleteOrder'] as int,
      foodOfferingTypes: (json['foodOfferingTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      bannerImagePath: json['bannerImagePath'] as String? ?? '',
      active: json['active'] as bool? ?? true,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeToTimestampConverter().fromJson),
      updatedAt: const DateTimeToTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

const _$RestaurantFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'ownerName': 'ownerName',
  'phone': 'phone',
  'address': 'address',
  'bannerImagePath': 'bannerImagePath',
  'foodOfferingTypes': 'foodOfferingTypes',
  'fcmTokens': 'fcmTokens',
  'averageTimeToCompleteOrder': 'averageTimeToCompleteOrder',
  'openingTime': 'openingTime',
  'closingTime': 'closingTime',
  'coordinates': 'coordinates',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
  'active': 'active',
};

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerName': instance.ownerName,
      'phone': instance.phone,
      'address': instance.address,
      'bannerImagePath': instance.bannerImagePath,
      'foodOfferingTypes': instance.foodOfferingTypes,
      'fcmTokens': instance.fcmTokens,
      'averageTimeToCompleteOrder': instance.averageTimeToCompleteOrder,
      'openingTime':
          const TimeOfDayToTimestampConverter().toJson(instance.openingTime),
      'closingTime':
          const TimeOfDayToTimestampConverter().toJson(instance.closingTime),
      'coordinates': const LatLngConverter().toJson(instance.coordinates),
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeToTimestampConverter().toJson),
      'updatedAt':
          const DateTimeToTimestampConverter().toJson(instance.updatedAt),
      'active': instance.active,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
