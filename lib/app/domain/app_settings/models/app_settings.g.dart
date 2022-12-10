// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

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
abstract class AppSettingsCollectionReference
    implements
        AppSettingsQuery,
        FirestoreCollectionReference<AppSettings, AppSettingsQuerySnapshot> {
  factory AppSettingsCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AppSettingsCollectionReference;

  static AppSettings fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return AppSettings.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    AppSettings value,
    SetOptions? options,
  ) {
    return _$AppSettingsToJson(value);
  }

  @override
  CollectionReference<AppSettings> get reference;

  @override
  AppSettingsDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AppSettingsDocumentReference> add(AppSettings value);
}

class _$AppSettingsCollectionReference extends _$AppSettingsQuery
    implements AppSettingsCollectionReference {
  factory _$AppSettingsCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AppSettingsCollectionReference._(
      firestore.collection('AppSettings').withConverter(
            fromFirestore: AppSettingsCollectionReference.fromFirestore,
            toFirestore: AppSettingsCollectionReference.toFirestore,
          ),
    );
  }

  _$AppSettingsCollectionReference._(
    CollectionReference<AppSettings> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<AppSettings> get reference =>
      super.reference as CollectionReference<AppSettings>;

  @override
  AppSettingsDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return AppSettingsDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AppSettingsDocumentReference> add(AppSettings value) {
    return reference
        .add(value)
        .then((ref) => AppSettingsDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppSettingsCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AppSettingsDocumentReference extends FirestoreDocumentReference<
    AppSettings, AppSettingsDocumentSnapshot> {
  factory AppSettingsDocumentReference(
          DocumentReference<AppSettings> reference) =
      _$AppSettingsDocumentReference;

  DocumentReference<AppSettings> get reference;

  /// A reference to the [AppSettingsCollectionReference] containing this document.
  AppSettingsCollectionReference get parent {
    return _$AppSettingsCollectionReference(reference.firestore);
  }

  @override
  Stream<AppSettingsDocumentSnapshot> snapshots();

  @override
  Future<AppSettingsDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    int searchInKM,
    FieldValue searchInKMFieldValue,
    int platformFee,
    FieldValue platformFeeFieldValue,
    DateTime updatedAt,
    FieldValue updatedAtFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    int searchInKM,
    FieldValue searchInKMFieldValue,
    int platformFee,
    FieldValue platformFeeFieldValue,
    DateTime updatedAt,
    FieldValue updatedAtFieldValue,
  });
}

class _$AppSettingsDocumentReference
    extends FirestoreDocumentReference<AppSettings, AppSettingsDocumentSnapshot>
    implements AppSettingsDocumentReference {
  _$AppSettingsDocumentReference(this.reference);

  @override
  final DocumentReference<AppSettings> reference;

  /// A reference to the [AppSettingsCollectionReference] containing this document.
  AppSettingsCollectionReference get parent {
    return _$AppSettingsCollectionReference(reference.firestore);
  }

  @override
  Stream<AppSettingsDocumentSnapshot> snapshots() {
    return reference.snapshots().map(AppSettingsDocumentSnapshot._);
  }

  @override
  Future<AppSettingsDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(AppSettingsDocumentSnapshot._);
  }

  @override
  Future<AppSettingsDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(AppSettingsDocumentSnapshot._);
  }

  Future<void> update({
    Object? searchInKM = _sentinel,
    FieldValue? searchInKMFieldValue,
    Object? platformFee = _sentinel,
    FieldValue? platformFeeFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
  }) async {
    assert(
      searchInKM == _sentinel || searchInKMFieldValue == null,
      "Cannot specify both searchInKM and searchInKMFieldValue",
    );
    assert(
      platformFee == _sentinel || platformFeeFieldValue == null,
      "Cannot specify both platformFee and platformFeeFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    final json = {
      if (searchInKM != _sentinel) 'searchInKM': searchInKM as int,
      if (searchInKMFieldValue != null) 'searchInKM': searchInKMFieldValue,
      if (platformFee != _sentinel) 'platformFee': platformFee as int,
      if (platformFeeFieldValue != null) 'platformFee': platformFeeFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? searchInKM = _sentinel,
    FieldValue? searchInKMFieldValue,
    Object? platformFee = _sentinel,
    FieldValue? platformFeeFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
  }) {
    assert(
      searchInKM == _sentinel || searchInKMFieldValue == null,
      "Cannot specify both searchInKM and searchInKMFieldValue",
    );
    assert(
      platformFee == _sentinel || platformFeeFieldValue == null,
      "Cannot specify both platformFee and platformFeeFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    final json = {
      if (searchInKM != _sentinel) 'searchInKM': searchInKM as int,
      if (searchInKMFieldValue != null) 'searchInKM': searchInKMFieldValue,
      if (platformFee != _sentinel) 'platformFee': platformFee as int,
      if (platformFeeFieldValue != null) 'platformFee': platformFeeFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is AppSettingsDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class AppSettingsQuery
    implements QueryReference<AppSettings, AppSettingsQuerySnapshot> {
  @override
  AppSettingsQuery limit(int limit);

  @override
  AppSettingsQuery limitToLast(int limit);

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
  AppSettingsQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
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
  AppSettingsQuery whereFieldPath(
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

  AppSettingsQuery whereDocumentId({
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
  AppSettingsQuery whereSearchInKM({
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
  AppSettingsQuery wherePlatformFee({
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
  AppSettingsQuery whereUpdatedAt({
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

  AppSettingsQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  });

  AppSettingsQuery orderBySearchInKM({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  });

  AppSettingsQuery orderByPlatformFee({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  });

  AppSettingsQuery orderByUpdatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  });
}

class _$AppSettingsQuery
    extends QueryReference<AppSettings, AppSettingsQuerySnapshot>
    implements AppSettingsQuery {
  _$AppSettingsQuery(
    this._collection, {
    required Query<AppSettings> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<AppSettingsQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(AppSettingsQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<AppSettingsQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(AppSettingsQuerySnapshot._fromQuerySnapshot);
  }

  @override
  AppSettingsQuery limit(int limit) {
    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AppSettingsQuery limitToLast(int limit) {
    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  AppSettingsQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
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
    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  AppSettingsQuery whereFieldPath(
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
    return _$AppSettingsQuery(
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

  AppSettingsQuery whereDocumentId({
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
    return _$AppSettingsQuery(
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

  AppSettingsQuery whereSearchInKM({
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
    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppSettingsFieldMap['searchInKM']!,
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

  AppSettingsQuery wherePlatformFee({
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
    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppSettingsFieldMap['platformFee']!,
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

  AppSettingsQuery whereUpdatedAt({
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
    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppSettingsFieldMap['updatedAt']!,
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

  AppSettingsQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
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

    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  AppSettingsQuery orderBySearchInKM({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AppSettingsFieldMap['searchInKM']!, descending: descending);
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

    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  AppSettingsQuery orderByPlatformFee({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AppSettingsFieldMap['platformFee']!, descending: descending);
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

    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  AppSettingsQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AppSettingsFieldMap['updatedAt']!, descending: descending);
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

    return _$AppSettingsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppSettingsQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AppSettingsDocumentSnapshot
    extends FirestoreDocumentSnapshot<AppSettings> {
  AppSettingsDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<AppSettings> snapshot;

  @override
  AppSettingsDocumentReference get reference {
    return AppSettingsDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AppSettings? data;
}

class AppSettingsQuerySnapshot extends FirestoreQuerySnapshot<AppSettings,
    AppSettingsQueryDocumentSnapshot> {
  AppSettingsQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory AppSettingsQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<AppSettings> snapshot,
  ) {
    final docs = snapshot.docs.map(AppSettingsQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        AppSettingsDocumentSnapshot._,
      );
    }).toList();

    return AppSettingsQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<AppSettingsDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    AppSettingsDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<AppSettingsDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<AppSettings> snapshot;

  @override
  final List<AppSettingsQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AppSettingsDocumentSnapshot>> docChanges;
}

class AppSettingsQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<AppSettings>
    implements AppSettingsDocumentSnapshot {
  AppSettingsQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<AppSettings> snapshot;

  @override
  final AppSettings data;

  @override
  AppSettingsDocumentReference get reference {
    return AppSettingsDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => AppSettings(
      foodTags: (json['foodTags'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      searchInKM: json['searchInKM'] as int? ?? 30,
      platformFee: json['platformFee'] as int? ?? 5,
      deliveryCost: (json['deliveryCost'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as int),
          ) ??
          const {'min': 40, 'perKM': 15},
      updatedAt: const DateTimeToTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

const _$AppSettingsFieldMap = <String, String>{
  'foodTags': 'foodTags',
  'deliveryCost': 'deliveryCost',
  'searchInKM': 'searchInKM',
  'platformFee': 'platformFee',
  'updatedAt': 'updatedAt',
};

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'foodTags': instance.foodTags,
      'deliveryCost': instance.deliveryCost,
      'searchInKM': instance.searchInKM,
      'platformFee': instance.platformFee,
      'updatedAt':
          const DateTimeToTimestampConverter().toJson(instance.updatedAt),
    };
