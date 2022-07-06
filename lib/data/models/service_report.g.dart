// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_report.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServiceReportListResponse> _$serviceReportListResponseSerializer =
    new _$ServiceReportListResponseSerializer();
Serializer<ServiceReportItemResponse> _$serviceReportItemResponseSerializer =
    new _$ServiceReportItemResponseSerializer();
Serializer<ServiceReportEntity> _$serviceReportEntitySerializer =
    new _$ServiceReportEntitySerializer();

class _$ServiceReportListResponseSerializer
    implements StructuredSerializer<ServiceReportListResponse> {
  @override
  final Iterable<Type> types = const [
    ServiceReportListResponse,
    _$ServiceReportListResponse
  ];
  @override
  final String wireName = 'ServiceReportListResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ServiceReportListResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ServiceReportEntity)])),
    ];

    return result;
  }

  @override
  ServiceReportListResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceReportListResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ServiceReportEntity)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ServiceReportItemResponseSerializer
    implements StructuredSerializer<ServiceReportItemResponse> {
  @override
  final Iterable<Type> types = const [
    ServiceReportItemResponse,
    _$ServiceReportItemResponse
  ];
  @override
  final String wireName = 'ServiceReportItemResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ServiceReportItemResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(ServiceReportEntity)),
    ];

    return result;
  }

  @override
  ServiceReportItemResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceReportItemResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ServiceReportEntity))
              as ServiceReportEntity);
          break;
      }
    }

    return result.build();
  }
}

class _$ServiceReportEntitySerializer
    implements StructuredSerializer<ServiceReportEntity> {
  @override
  final Iterable<Type> types = const [
    ServiceReportEntity,
    _$ServiceReportEntity
  ];
  @override
  final String wireName = 'ServiceReportEntity';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ServiceReportEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'report_no',
      serializers.serialize(object.reportNo,
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
    value = object.clientId;
    if (value != null) {
      result
        ..add('client_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  ServiceReportEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceReportEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'client_id':
          result.clientId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'report_no':
          result.reportNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$ServiceReportListResponse extends ServiceReportListResponse {
  @override
  final BuiltList<ServiceReportEntity> data;

  factory _$ServiceReportListResponse(
          [void Function(ServiceReportListResponseBuilder) updates]) =>
      (new ServiceReportListResponseBuilder()..update(updates))._build();

  _$ServiceReportListResponse._({this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'ServiceReportListResponse', 'data');
  }

  @override
  ServiceReportListResponse rebuild(
          void Function(ServiceReportListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceReportListResponseBuilder toBuilder() =>
      new ServiceReportListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceReportListResponse && data == other.data;
  }

  int __hashCode;
  @override
  int get hashCode {
    return __hashCode ??= $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceReportListResponse')
          ..add('data', data))
        .toString();
  }
}

class ServiceReportListResponseBuilder
    implements
        Builder<ServiceReportListResponse, ServiceReportListResponseBuilder> {
  _$ServiceReportListResponse _$v;

  ListBuilder<ServiceReportEntity> _data;
  ListBuilder<ServiceReportEntity> get data =>
      _$this._data ??= new ListBuilder<ServiceReportEntity>();
  set data(ListBuilder<ServiceReportEntity> data) => _$this._data = data;

  ServiceReportListResponseBuilder();

  ServiceReportListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceReportListResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceReportListResponse;
  }

  @override
  void update(void Function(ServiceReportListResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceReportListResponse build() => _build();

  _$ServiceReportListResponse _build() {
    _$ServiceReportListResponse _$result;
    try {
      _$result = _$v ?? new _$ServiceReportListResponse._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceReportListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceReportItemResponse extends ServiceReportItemResponse {
  @override
  final ServiceReportEntity data;

  factory _$ServiceReportItemResponse(
          [void Function(ServiceReportItemResponseBuilder) updates]) =>
      (new ServiceReportItemResponseBuilder()..update(updates))._build();

  _$ServiceReportItemResponse._({this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'ServiceReportItemResponse', 'data');
  }

  @override
  ServiceReportItemResponse rebuild(
          void Function(ServiceReportItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceReportItemResponseBuilder toBuilder() =>
      new ServiceReportItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceReportItemResponse && data == other.data;
  }

  int __hashCode;
  @override
  int get hashCode {
    return __hashCode ??= $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceReportItemResponse')
          ..add('data', data))
        .toString();
  }
}

class ServiceReportItemResponseBuilder
    implements
        Builder<ServiceReportItemResponse, ServiceReportItemResponseBuilder> {
  _$ServiceReportItemResponse _$v;

  ServiceReportEntityBuilder _data;
  ServiceReportEntityBuilder get data =>
      _$this._data ??= new ServiceReportEntityBuilder();
  set data(ServiceReportEntityBuilder data) => _$this._data = data;

  ServiceReportItemResponseBuilder();

  ServiceReportItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceReportItemResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceReportItemResponse;
  }

  @override
  void update(void Function(ServiceReportItemResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceReportItemResponse build() => _build();

  _$ServiceReportItemResponse _build() {
    _$ServiceReportItemResponse _$result;
    try {
      _$result = _$v ?? new _$ServiceReportItemResponse._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceReportItemResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceReportEntity extends ServiceReportEntity {
  @override
  final String type;
  @override
  final String clientId;
  @override
  final String reportNo;
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

  factory _$ServiceReportEntity(
          [void Function(ServiceReportEntityBuilder) updates]) =>
      (new ServiceReportEntityBuilder()..update(updates))._build();

  _$ServiceReportEntity._(
      {this.type,
      this.clientId,
      this.reportNo,
      this.isChanged,
      this.createdAt,
      this.updatedAt,
      this.archivedAt,
      this.isDeleted,
      this.createdUserId,
      this.assignedUserId,
      this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'ServiceReportEntity', 'type');
    BuiltValueNullFieldError.checkNotNull(
        reportNo, r'ServiceReportEntity', 'reportNo');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'ServiceReportEntity', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'ServiceReportEntity', 'updatedAt');
    BuiltValueNullFieldError.checkNotNull(
        archivedAt, r'ServiceReportEntity', 'archivedAt');
    BuiltValueNullFieldError.checkNotNull(id, r'ServiceReportEntity', 'id');
  }

  @override
  ServiceReportEntity rebuild(
          void Function(ServiceReportEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceReportEntityBuilder toBuilder() =>
      new ServiceReportEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceReportEntity &&
        type == other.type &&
        clientId == other.clientId &&
        reportNo == other.reportNo &&
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
                                        $jc($jc(0, type.hashCode),
                                            clientId.hashCode),
                                        reportNo.hashCode),
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
    return (newBuiltValueToStringHelper(r'ServiceReportEntity')
          ..add('type', type)
          ..add('clientId', clientId)
          ..add('reportNo', reportNo)
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

class ServiceReportEntityBuilder
    implements Builder<ServiceReportEntity, ServiceReportEntityBuilder> {
  _$ServiceReportEntity _$v;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _clientId;
  String get clientId => _$this._clientId;
  set clientId(String clientId) => _$this._clientId = clientId;

  String _reportNo;
  String get reportNo => _$this._reportNo;
  set reportNo(String reportNo) => _$this._reportNo = reportNo;

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

  ServiceReportEntityBuilder();

  ServiceReportEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _clientId = $v.clientId;
      _reportNo = $v.reportNo;
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
  void replace(ServiceReportEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceReportEntity;
  }

  @override
  void update(void Function(ServiceReportEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceReportEntity build() => _build();

  _$ServiceReportEntity _build() {
    final _$result = _$v ??
        new _$ServiceReportEntity._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ServiceReportEntity', 'type'),
            clientId: clientId,
            reportNo: BuiltValueNullFieldError.checkNotNull(
                reportNo, r'ServiceReportEntity', 'reportNo'),
            isChanged: isChanged,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ServiceReportEntity', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'ServiceReportEntity', 'updatedAt'),
            archivedAt: BuiltValueNullFieldError.checkNotNull(
                archivedAt, r'ServiceReportEntity', 'archivedAt'),
            isDeleted: isDeleted,
            createdUserId: createdUserId,
            assignedUserId: assignedUserId,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ServiceReportEntity', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
