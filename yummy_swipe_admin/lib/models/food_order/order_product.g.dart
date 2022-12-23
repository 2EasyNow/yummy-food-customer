// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product.dart';

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
abstract class OrderProductCollectionReference
    implements
        OrderProductQuery,
        FirestoreCollectionReference<OrderProduct, OrderProductQuerySnapshot> {
  factory OrderProductCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$OrderProductCollectionReference;

  static OrderProduct fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return OrderProduct.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    OrderProduct value,
    SetOptions? options,
  ) {
    return {..._$OrderProductToJson(value)}..remove('id');
  }

  @override
  CollectionReference<OrderProduct> get reference;

  @override
  OrderProductDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<OrderProductDocumentReference> add(OrderProduct value);
}

class _$OrderProductCollectionReference extends _$OrderProductQuery
    implements OrderProductCollectionReference {
  factory _$OrderProductCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$OrderProductCollectionReference._(
      firestore.collection('OrderProducts').withConverter(
            fromFirestore: OrderProductCollectionReference.fromFirestore,
            toFirestore: OrderProductCollectionReference.toFirestore,
          ),
    );
  }

  _$OrderProductCollectionReference._(
    CollectionReference<OrderProduct> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<OrderProduct> get reference =>
      super.reference as CollectionReference<OrderProduct>;

  @override
  OrderProductDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return OrderProductDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<OrderProductDocumentReference> add(OrderProduct value) {
    return reference
        .add(value)
        .then((ref) => OrderProductDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$OrderProductCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class OrderProductDocumentReference extends FirestoreDocumentReference<
    OrderProduct, OrderProductDocumentSnapshot> {
  factory OrderProductDocumentReference(
          DocumentReference<OrderProduct> reference) =
      _$OrderProductDocumentReference;

  DocumentReference<OrderProduct> get reference;

  /// A reference to the [OrderProductCollectionReference] containing this document.
  OrderProductCollectionReference get parent {
    return _$OrderProductCollectionReference(reference.firestore);
  }

  @override
  Stream<OrderProductDocumentSnapshot> snapshots();

  @override
  Future<OrderProductDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String orderId,
    FieldValue orderIdFieldValue,
    String customerId,
    FieldValue customerIdFieldValue,
    String restaurantId,
    FieldValue restaurantIdFieldValue,
    String productId,
    FieldValue productIdFieldValue,
    String productName,
    FieldValue productNameFieldValue,
    String imageName,
    FieldValue imageNameFieldValue,
    int price,
    FieldValue priceFieldValue,
    int quantity,
    FieldValue quantityFieldValue,
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
    String orderId,
    FieldValue orderIdFieldValue,
    String customerId,
    FieldValue customerIdFieldValue,
    String restaurantId,
    FieldValue restaurantIdFieldValue,
    String productId,
    FieldValue productIdFieldValue,
    String productName,
    FieldValue productNameFieldValue,
    String imageName,
    FieldValue imageNameFieldValue,
    int price,
    FieldValue priceFieldValue,
    int quantity,
    FieldValue quantityFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime updatedAt,
    FieldValue updatedAtFieldValue,
  });
}

class _$OrderProductDocumentReference extends FirestoreDocumentReference<
    OrderProduct,
    OrderProductDocumentSnapshot> implements OrderProductDocumentReference {
  _$OrderProductDocumentReference(this.reference);

  @override
  final DocumentReference<OrderProduct> reference;

  /// A reference to the [OrderProductCollectionReference] containing this document.
  OrderProductCollectionReference get parent {
    return _$OrderProductCollectionReference(reference.firestore);
  }

  @override
  Stream<OrderProductDocumentSnapshot> snapshots() {
    return reference.snapshots().map(OrderProductDocumentSnapshot._);
  }

  @override
  Future<OrderProductDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(OrderProductDocumentSnapshot._);
  }

  @override
  Future<OrderProductDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(OrderProductDocumentSnapshot._);
  }

  Future<void> update({
    Object? orderId = _sentinel,
    FieldValue? orderIdFieldValue,
    Object? customerId = _sentinel,
    FieldValue? customerIdFieldValue,
    Object? restaurantId = _sentinel,
    FieldValue? restaurantIdFieldValue,
    Object? productId = _sentinel,
    FieldValue? productIdFieldValue,
    Object? productName = _sentinel,
    FieldValue? productNameFieldValue,
    Object? imageName = _sentinel,
    FieldValue? imageNameFieldValue,
    Object? price = _sentinel,
    FieldValue? priceFieldValue,
    Object? quantity = _sentinel,
    FieldValue? quantityFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
  }) async {
    assert(
      orderId == _sentinel || orderIdFieldValue == null,
      "Cannot specify both orderId and orderIdFieldValue",
    );
    assert(
      customerId == _sentinel || customerIdFieldValue == null,
      "Cannot specify both customerId and customerIdFieldValue",
    );
    assert(
      restaurantId == _sentinel || restaurantIdFieldValue == null,
      "Cannot specify both restaurantId and restaurantIdFieldValue",
    );
    assert(
      productId == _sentinel || productIdFieldValue == null,
      "Cannot specify both productId and productIdFieldValue",
    );
    assert(
      productName == _sentinel || productNameFieldValue == null,
      "Cannot specify both productName and productNameFieldValue",
    );
    assert(
      imageName == _sentinel || imageNameFieldValue == null,
      "Cannot specify both imageName and imageNameFieldValue",
    );
    assert(
      price == _sentinel || priceFieldValue == null,
      "Cannot specify both price and priceFieldValue",
    );
    assert(
      quantity == _sentinel || quantityFieldValue == null,
      "Cannot specify both quantity and quantityFieldValue",
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
      if (orderId != _sentinel) 'orderId': orderId as String,
      if (orderIdFieldValue != null) 'orderId': orderIdFieldValue,
      if (customerId != _sentinel) 'customerId': customerId as String,
      if (customerIdFieldValue != null) 'customerId': customerIdFieldValue,
      if (restaurantId != _sentinel) 'restaurantId': restaurantId as String,
      if (restaurantIdFieldValue != null)
        'restaurantId': restaurantIdFieldValue,
      if (productId != _sentinel) 'productId': productId as String,
      if (productIdFieldValue != null) 'productId': productIdFieldValue,
      if (productName != _sentinel) 'productName': productName as String,
      if (productNameFieldValue != null) 'productName': productNameFieldValue,
      if (imageName != _sentinel) 'imageName': imageName as String,
      if (imageNameFieldValue != null) 'imageName': imageNameFieldValue,
      if (price != _sentinel) 'price': price as int,
      if (priceFieldValue != null) 'price': priceFieldValue,
      if (quantity != _sentinel) 'quantity': quantity as int,
      if (quantityFieldValue != null) 'quantity': quantityFieldValue,
      if (createdAt != _sentinel) 'createdAt': createdAt as DateTime?,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? orderId = _sentinel,
    FieldValue? orderIdFieldValue,
    Object? customerId = _sentinel,
    FieldValue? customerIdFieldValue,
    Object? restaurantId = _sentinel,
    FieldValue? restaurantIdFieldValue,
    Object? productId = _sentinel,
    FieldValue? productIdFieldValue,
    Object? productName = _sentinel,
    FieldValue? productNameFieldValue,
    Object? imageName = _sentinel,
    FieldValue? imageNameFieldValue,
    Object? price = _sentinel,
    FieldValue? priceFieldValue,
    Object? quantity = _sentinel,
    FieldValue? quantityFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
  }) {
    assert(
      orderId == _sentinel || orderIdFieldValue == null,
      "Cannot specify both orderId and orderIdFieldValue",
    );
    assert(
      customerId == _sentinel || customerIdFieldValue == null,
      "Cannot specify both customerId and customerIdFieldValue",
    );
    assert(
      restaurantId == _sentinel || restaurantIdFieldValue == null,
      "Cannot specify both restaurantId and restaurantIdFieldValue",
    );
    assert(
      productId == _sentinel || productIdFieldValue == null,
      "Cannot specify both productId and productIdFieldValue",
    );
    assert(
      productName == _sentinel || productNameFieldValue == null,
      "Cannot specify both productName and productNameFieldValue",
    );
    assert(
      imageName == _sentinel || imageNameFieldValue == null,
      "Cannot specify both imageName and imageNameFieldValue",
    );
    assert(
      price == _sentinel || priceFieldValue == null,
      "Cannot specify both price and priceFieldValue",
    );
    assert(
      quantity == _sentinel || quantityFieldValue == null,
      "Cannot specify both quantity and quantityFieldValue",
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
      if (orderId != _sentinel) 'orderId': orderId as String,
      if (orderIdFieldValue != null) 'orderId': orderIdFieldValue,
      if (customerId != _sentinel) 'customerId': customerId as String,
      if (customerIdFieldValue != null) 'customerId': customerIdFieldValue,
      if (restaurantId != _sentinel) 'restaurantId': restaurantId as String,
      if (restaurantIdFieldValue != null)
        'restaurantId': restaurantIdFieldValue,
      if (productId != _sentinel) 'productId': productId as String,
      if (productIdFieldValue != null) 'productId': productIdFieldValue,
      if (productName != _sentinel) 'productName': productName as String,
      if (productNameFieldValue != null) 'productName': productNameFieldValue,
      if (imageName != _sentinel) 'imageName': imageName as String,
      if (imageNameFieldValue != null) 'imageName': imageNameFieldValue,
      if (price != _sentinel) 'price': price as int,
      if (priceFieldValue != null) 'price': priceFieldValue,
      if (quantity != _sentinel) 'quantity': quantity as int,
      if (quantityFieldValue != null) 'quantity': quantityFieldValue,
      if (createdAt != _sentinel) 'createdAt': createdAt as DateTime?,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderProductDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class OrderProductQuery
    implements QueryReference<OrderProduct, OrderProductQuerySnapshot> {
  @override
  OrderProductQuery limit(int limit);

  @override
  OrderProductQuery limitToLast(int limit);

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
  OrderProductQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
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
  OrderProductQuery whereFieldPath(
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

  OrderProductQuery whereDocumentId({
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
  OrderProductQuery whereOrderId({
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
  OrderProductQuery whereCustomerId({
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
  OrderProductQuery whereRestaurantId({
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
  OrderProductQuery whereProductId({
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
  OrderProductQuery whereProductName({
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
  OrderProductQuery whereImageName({
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
  OrderProductQuery wherePrice({
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
  OrderProductQuery whereQuantity({
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
  OrderProductQuery whereCreatedAt({
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
  OrderProductQuery whereUpdatedAt({
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

  OrderProductQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByOrderId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByCustomerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByRestaurantId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByProductId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByProductName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByImageName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByPrice({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByQuantity({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });

  OrderProductQuery orderByUpdatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  });
}

class _$OrderProductQuery
    extends QueryReference<OrderProduct, OrderProductQuerySnapshot>
    implements OrderProductQuery {
  _$OrderProductQuery(
    this._collection, {
    required Query<OrderProduct> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<OrderProductQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(OrderProductQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<OrderProductQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(OrderProductQuerySnapshot._fromQuerySnapshot);
  }

  @override
  OrderProductQuery limit(int limit) {
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  OrderProductQuery limitToLast(int limit) {
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  OrderProductQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery whereFieldPath(
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
    return _$OrderProductQuery(
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

  OrderProductQuery whereDocumentId({
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
    return _$OrderProductQuery(
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

  OrderProductQuery whereOrderId({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['orderId']!,
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

  OrderProductQuery whereCustomerId({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['customerId']!,
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

  OrderProductQuery whereRestaurantId({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['restaurantId']!,
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

  OrderProductQuery whereProductId({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['productId']!,
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

  OrderProductQuery whereProductName({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['productName']!,
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

  OrderProductQuery whereImageName({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['imageName']!,
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

  OrderProductQuery wherePrice({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['price']!,
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

  OrderProductQuery whereQuantity({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['quantity']!,
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

  OrderProductQuery whereCreatedAt({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['createdAt']!,
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

  OrderProductQuery whereUpdatedAt({
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
    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$OrderProductFieldMap['updatedAt']!,
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

  OrderProductQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByOrderId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$OrderProductFieldMap['orderId']!, descending: descending);
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByCustomerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$OrderProductFieldMap['customerId']!, descending: descending);
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByRestaurantId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$OrderProductFieldMap['restaurantId']!,
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByProductId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$OrderProductFieldMap['productId']!, descending: descending);
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByProductName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$OrderProductFieldMap['productName']!,
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByImageName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$OrderProductFieldMap['imageName']!, descending: descending);
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$OrderProductFieldMap['price']!, descending: descending);
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByQuantity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$OrderProductFieldMap['quantity']!, descending: descending);
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$OrderProductFieldMap['createdAt']!, descending: descending);
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  OrderProductQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderProductDocumentSnapshot? startAtDocument,
    OrderProductDocumentSnapshot? endAtDocument,
    OrderProductDocumentSnapshot? endBeforeDocument,
    OrderProductDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$OrderProductFieldMap['updatedAt']!, descending: descending);
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

    return _$OrderProductQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$OrderProductQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class OrderProductDocumentSnapshot
    extends FirestoreDocumentSnapshot<OrderProduct> {
  OrderProductDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<OrderProduct> snapshot;

  @override
  OrderProductDocumentReference get reference {
    return OrderProductDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final OrderProduct? data;
}

class OrderProductQuerySnapshot extends FirestoreQuerySnapshot<OrderProduct,
    OrderProductQueryDocumentSnapshot> {
  OrderProductQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory OrderProductQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<OrderProduct> snapshot,
  ) {
    final docs =
        snapshot.docs.map(OrderProductQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        OrderProductDocumentSnapshot._,
      );
    }).toList();

    return OrderProductQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<OrderProductDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    OrderProductDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<OrderProductDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<OrderProduct> snapshot;

  @override
  final List<OrderProductQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<OrderProductDocumentSnapshot>> docChanges;
}

class OrderProductQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<OrderProduct>
    implements OrderProductDocumentSnapshot {
  OrderProductQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<OrderProduct> snapshot;

  @override
  final OrderProduct data;

  @override
  OrderProductDocumentReference get reference {
    return OrderProductDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) => OrderProduct(
      id: json['id'] as String? ?? '',
      orderId: json['orderId'] as String,
      restaurantId: json['restaurantId'] as String,
      customerId: json['customerId'] as String,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      imageName: json['imageName'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeToTimestampConverter().fromJson),
      updatedAt: const DateTimeToTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

const _$OrderProductFieldMap = <String, String>{
  'id': 'id',
  'orderId': 'orderId',
  'customerId': 'customerId',
  'restaurantId': 'restaurantId',
  'productId': 'productId',
  'productName': 'productName',
  'imageName': 'imageName',
  'price': 'price',
  'quantity': 'quantity',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
};

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'customerId': instance.customerId,
      'restaurantId': instance.restaurantId,
      'productId': instance.productId,
      'productName': instance.productName,
      'imageName': instance.imageName,
      'price': instance.price,
      'quantity': instance.quantity,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeToTimestampConverter().toJson),
      'updatedAt':
          const DateTimeToTimestampConverter().toJson(instance.updatedAt),
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
