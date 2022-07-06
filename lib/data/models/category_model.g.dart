// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryListResponse> _$categoryListResponseSerializer =
    new _$CategoryListResponseSerializer();
Serializer<CategoryItemResponse> _$categoryItemResponseSerializer =
    new _$CategoryItemResponseSerializer();
Serializer<CategoryEntity> _$categoryEntitySerializer =
    new _$CategoryEntitySerializer();

class _$CategoryListResponseSerializer
    implements StructuredSerializer<CategoryListResponse> {
  @override
  final Iterable<Type> types = const [
    CategoryListResponse,
    _$CategoryListResponse
  ];
  @override
  final String wireName = 'CategoryListResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CategoryListResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CategoryEntity)])),
    ];

    return result;
  }

  @override
  CategoryListResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryListResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CategoryEntity)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryItemResponseSerializer
    implements StructuredSerializer<CategoryItemResponse> {
  @override
  final Iterable<Type> types = const [
    CategoryItemResponse,
    _$CategoryItemResponse
  ];
  @override
  final String wireName = 'CategoryItemResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CategoryItemResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(CategoryEntity)),
    ];

    return result;
  }

  @override
  CategoryItemResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryItemResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(CategoryEntity)) as CategoryEntity);
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryEntitySerializer
    implements StructuredSerializer<CategoryEntity> {
  @override
  final Iterable<Type> types = const [CategoryEntity, _$CategoryEntity];
  @override
  final String wireName = 'CategoryEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoryEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'sku_prefix',
      serializers.serialize(object.skuPrefix,
          specifiedType: const FullType(String)),
      'next_number',
      serializers.serialize(object.nextNumber,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(int)),
      'archived_at',
      serializers.serialize(object.archivedAt,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object value;
    value = object.categoryId;
    if (value != null) {
      result
        ..add('category_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CategoryEntity)));
    }
    value = object.isChanged;
    if (value != null) {
      result
        ..add('isChanged')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isDeleted;
    if (value != null) {
      result
        ..add('is_deleted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdUserId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.assignedUserId;
    if (value != null) {
      result
        ..add('assigned_user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CategoryEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category_id':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sku_prefix':
          result.skuPrefix = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'next_number':
          result.nextNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category.replace(serializers.deserialize(value,
              specifiedType: const FullType(CategoryEntity)) as CategoryEntity);
          break;
        case 'isChanged':
          result.isChanged = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'archived_at':
          result.archivedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'is_deleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'user_id':
          result.createdUserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assigned_user_id':
          result.assignedUserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryListResponse extends CategoryListResponse {
  @override
  final BuiltList<CategoryEntity> data;

  factory _$CategoryListResponse(
          [void Function(CategoryListResponseBuilder) updates]) =>
      (new CategoryListResponseBuilder()..update(updates))._build();

  _$CategoryListResponse._({this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'CategoryListResponse', 'data');
  }

  @override
  CategoryListResponse rebuild(
          void Function(CategoryListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryListResponseBuilder toBuilder() =>
      new CategoryListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryListResponse && data == other.data;
  }

  int __hashCode;
  @override
  int get hashCode {
    return __hashCode ??= $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryListResponse')
          ..add('data', data))
        .toString();
  }
}

class CategoryListResponseBuilder
    implements Builder<CategoryListResponse, CategoryListResponseBuilder> {
  _$CategoryListResponse _$v;

  ListBuilder<CategoryEntity> _data;
  ListBuilder<CategoryEntity> get data =>
      _$this._data ??= new ListBuilder<CategoryEntity>();
  set data(ListBuilder<CategoryEntity> data) => _$this._data = data;

  CategoryListResponseBuilder();

  CategoryListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryListResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryListResponse;
  }

  @override
  void update(void Function(CategoryListResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryListResponse build() => _build();

  _$CategoryListResponse _build() {
    _$CategoryListResponse _$result;
    try {
      _$result = _$v ?? new _$CategoryListResponse._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategoryListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CategoryItemResponse extends CategoryItemResponse {
  @override
  final CategoryEntity data;

  factory _$CategoryItemResponse(
          [void Function(CategoryItemResponseBuilder) updates]) =>
      (new CategoryItemResponseBuilder()..update(updates))._build();

  _$CategoryItemResponse._({this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'CategoryItemResponse', 'data');
  }

  @override
  CategoryItemResponse rebuild(
          void Function(CategoryItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryItemResponseBuilder toBuilder() =>
      new CategoryItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryItemResponse && data == other.data;
  }

  int __hashCode;
  @override
  int get hashCode {
    return __hashCode ??= $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryItemResponse')
          ..add('data', data))
        .toString();
  }
}

class CategoryItemResponseBuilder
    implements Builder<CategoryItemResponse, CategoryItemResponseBuilder> {
  _$CategoryItemResponse _$v;

  CategoryEntityBuilder _data;
  CategoryEntityBuilder get data =>
      _$this._data ??= new CategoryEntityBuilder();
  set data(CategoryEntityBuilder data) => _$this._data = data;

  CategoryItemResponseBuilder();

  CategoryItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryItemResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryItemResponse;
  }

  @override
  void update(void Function(CategoryItemResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryItemResponse build() => _build();

  _$CategoryItemResponse _build() {
    _$CategoryItemResponse _$result;
    try {
      _$result = _$v ?? new _$CategoryItemResponse._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategoryItemResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CategoryEntity extends CategoryEntity {
  @override
  final String name;
  @override
  final String description;
  @override
  final String categoryId;
  @override
  final String skuPrefix;
  @override
  final String nextNumber;
  @override
  final CategoryEntity category;
  @override
  final bool isChanged;
  @override
  final int createdAt;
  @override
  final int updatedAt;
  @override
  final int archivedAt;
  @override
  final bool isDeleted;
  @override
  final String createdUserId;
  @override
  final String assignedUserId;
  @override
  final String id;

  factory _$CategoryEntity([void Function(CategoryEntityBuilder) updates]) =>
      (new CategoryEntityBuilder()..update(updates))._build();

  _$CategoryEntity._(
      {this.name,
      this.description,
      this.categoryId,
      this.skuPrefix,
      this.nextNumber,
      this.category,
      this.isChanged,
      this.createdAt,
      this.updatedAt,
      this.archivedAt,
      this.isDeleted,
      this.createdUserId,
      this.assignedUserId,
      this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'CategoryEntity', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, r'CategoryEntity', 'description');
    BuiltValueNullFieldError.checkNotNull(
        skuPrefix, r'CategoryEntity', 'skuPrefix');
    BuiltValueNullFieldError.checkNotNull(
        nextNumber, r'CategoryEntity', 'nextNumber');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'CategoryEntity', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'CategoryEntity', 'updatedAt');
    BuiltValueNullFieldError.checkNotNull(
        archivedAt, r'CategoryEntity', 'archivedAt');
    BuiltValueNullFieldError.checkNotNull(id, r'CategoryEntity', 'id');
  }

  @override
  CategoryEntity rebuild(void Function(CategoryEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryEntityBuilder toBuilder() =>
      new CategoryEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryEntity &&
        name == other.name &&
        description == other.description &&
        categoryId == other.categoryId &&
        skuPrefix == other.skuPrefix &&
        nextNumber == other.nextNumber &&
        category == other.category &&
        isChanged == other.isChanged &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        archivedAt == other.archivedAt &&
        isDeleted == other.isDeleted &&
        createdUserId == other.createdUserId &&
        assignedUserId == other.assignedUserId &&
        id == other.id;
  }

  int __hashCode;
  @override
  int get hashCode {
    return __hashCode ??= $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, name.hashCode),
                                                        description.hashCode),
                                                    categoryId.hashCode),
                                                skuPrefix.hashCode),
                                            nextNumber.hashCode),
                                        category.hashCode),
                                    isChanged.hashCode),
                                createdAt.hashCode),
                            updatedAt.hashCode),
                        archivedAt.hashCode),
                    isDeleted.hashCode),
                createdUserId.hashCode),
            assignedUserId.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryEntity')
          ..add('name', name)
          ..add('description', description)
          ..add('categoryId', categoryId)
          ..add('skuPrefix', skuPrefix)
          ..add('nextNumber', nextNumber)
          ..add('category', category)
          ..add('isChanged', isChanged)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('archivedAt', archivedAt)
          ..add('isDeleted', isDeleted)
          ..add('createdUserId', createdUserId)
          ..add('assignedUserId', assignedUserId)
          ..add('id', id))
        .toString();
  }
}

class CategoryEntityBuilder
    implements Builder<CategoryEntity, CategoryEntityBuilder> {
  _$CategoryEntity _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _categoryId;
  String get categoryId => _$this._categoryId;
  set categoryId(String categoryId) => _$this._categoryId = categoryId;

  String _skuPrefix;
  String get skuPrefix => _$this._skuPrefix;
  set skuPrefix(String skuPrefix) => _$this._skuPrefix = skuPrefix;

  String _nextNumber;
  String get nextNumber => _$this._nextNumber;
  set nextNumber(String nextNumber) => _$this._nextNumber = nextNumber;

  CategoryEntityBuilder _category;
  CategoryEntityBuilder get category =>
      _$this._category ??= new CategoryEntityBuilder();
  set category(CategoryEntityBuilder category) => _$this._category = category;

  bool _isChanged;
  bool get isChanged => _$this._isChanged;
  set isChanged(bool isChanged) => _$this._isChanged = isChanged;

  int _createdAt;
  int get createdAt => _$this._createdAt;
  set createdAt(int createdAt) => _$this._createdAt = createdAt;

  int _updatedAt;
  int get updatedAt => _$this._updatedAt;
  set updatedAt(int updatedAt) => _$this._updatedAt = updatedAt;

  int _archivedAt;
  int get archivedAt => _$this._archivedAt;
  set archivedAt(int archivedAt) => _$this._archivedAt = archivedAt;

  bool _isDeleted;
  bool get isDeleted => _$this._isDeleted;
  set isDeleted(bool isDeleted) => _$this._isDeleted = isDeleted;

  String _createdUserId;
  String get createdUserId => _$this._createdUserId;
  set createdUserId(String createdUserId) =>
      _$this._createdUserId = createdUserId;

  String _assignedUserId;
  String get assignedUserId => _$this._assignedUserId;
  set assignedUserId(String assignedUserId) =>
      _$this._assignedUserId = assignedUserId;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  CategoryEntityBuilder();

  CategoryEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _categoryId = $v.categoryId;
      _skuPrefix = $v.skuPrefix;
      _nextNumber = $v.nextNumber;
      _category = $v.category?.toBuilder();
      _isChanged = $v.isChanged;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _archivedAt = $v.archivedAt;
      _isDeleted = $v.isDeleted;
      _createdUserId = $v.createdUserId;
      _assignedUserId = $v.assignedUserId;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryEntity;
  }

  @override
  void update(void Function(CategoryEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryEntity build() => _build();

  _$CategoryEntity _build() {
    _$CategoryEntity _$result;
    try {
      _$result = _$v ??
          new _$CategoryEntity._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'CategoryEntity', 'name'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'CategoryEntity', 'description'),
              categoryId: categoryId,
              skuPrefix: BuiltValueNullFieldError.checkNotNull(
                  skuPrefix, r'CategoryEntity', 'skuPrefix'),
              nextNumber: BuiltValueNullFieldError.checkNotNull(
                  nextNumber, r'CategoryEntity', 'nextNumber'),
              category: _category?.build(),
              isChanged: isChanged,
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'CategoryEntity', 'createdAt'),
              updatedAt: BuiltValueNullFieldError.checkNotNull(
                  updatedAt, r'CategoryEntity', 'updatedAt'),
              archivedAt: BuiltValueNullFieldError.checkNotNull(
                  archivedAt, r'CategoryEntity', 'archivedAt'),
              isDeleted: isDeleted,
              createdUserId: createdUserId,
              assignedUserId: assignedUserId,
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'CategoryEntity', 'id'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategoryEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
