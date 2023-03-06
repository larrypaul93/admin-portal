// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_reports_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServiceReportsState> _$serviceReportsStateSerializer =
    new _$ServiceReportsStateSerializer();

class _$ServiceReportsStateSerializer
    implements StructuredSerializer<ServiceReportsState> {
  @override
  final Iterable<Type> types = const [
    ServiceReportsState,
    _$ServiceReportsState
  ];
  @override
  final String wireName = 'ServiceReportsState';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ServiceReportsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'map',
      serializers.serialize(object.map,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(ServiceReportEntity)
          ])),
      'list',
      serializers.serialize(object.list,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  ServiceReportsState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceReportsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'map':
          result.map.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ServiceReportEntity)
              ])));
          break;
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ServiceReportsState extends ServiceReportsState {
  @override
  final BuiltMap<String, ServiceReportEntity> map;
  @override
  final BuiltList<String> list;

  factory _$ServiceReportsState(
          [void Function(ServiceReportsStateBuilder) updates]) =>
      (new ServiceReportsStateBuilder()..update(updates))._build();

  _$ServiceReportsState._({this.map, this.list}) : super._() {
    BuiltValueNullFieldError.checkNotNull(map, r'ServiceReportsState', 'map');
    BuiltValueNullFieldError.checkNotNull(list, r'ServiceReportsState', 'list');
  }

  @override
  ServiceReportsState rebuild(
          void Function(ServiceReportsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceReportsStateBuilder toBuilder() =>
      new ServiceReportsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceReportsState &&
        map == other.map &&
        list == other.list;
  }

  int __hashCode;
  @override
  int get hashCode {
    if (__hashCode != null) return __hashCode;
    var _$hash = 0;
    _$hash = $jc(_$hash, map.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jf(_$hash);
    return __hashCode ??= _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceReportsState')
          ..add('map', map)
          ..add('list', list))
        .toString();
  }
}

class ServiceReportsStateBuilder
    implements Builder<ServiceReportsState, ServiceReportsStateBuilder> {
  _$ServiceReportsState _$v;

  MapBuilder<String, ServiceReportEntity> _map;
  MapBuilder<String, ServiceReportEntity> get map =>
      _$this._map ??= new MapBuilder<String, ServiceReportEntity>();
  set map(MapBuilder<String, ServiceReportEntity> map) => _$this._map = map;

  ListBuilder<String> _list;
  ListBuilder<String> get list => _$this._list ??= new ListBuilder<String>();
  set list(ListBuilder<String> list) => _$this._list = list;

  ServiceReportsStateBuilder();

  ServiceReportsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _map = $v.map.toBuilder();
      _list = $v.list.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceReportsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceReportsState;
  }

  @override
  void update(void Function(ServiceReportsStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceReportsState build() => _build();

  _$ServiceReportsState _build() {
    _$ServiceReportsState _$result;
    try {
      _$result = _$v ??
          new _$ServiceReportsState._(map: map.build(), list: list.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
        _$failedField = 'list';
        list.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceReportsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
