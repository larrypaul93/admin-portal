// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryState> _$categoryStateSerializer =
    new _$CategoryStateSerializer();
Serializer<CategoryUIState> _$categoryUIStateSerializer =
    new _$CategoryUIStateSerializer();

class _$CategoryStateSerializer implements StructuredSerializer<CategoryState> {
  @override
  final Iterable<Type> types = const [CategoryState, _$CategoryState];
  @override
  final String wireName = 'CategoryState';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoryState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'map',
      serializers.serialize(object.map,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(CategoryEntity)])),
      'list',
      serializers.serialize(object.list,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  CategoryState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryStateBuilder();

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
                const FullType(CategoryEntity)
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

class _$CategoryUIStateSerializer
    implements StructuredSerializer<CategoryUIState> {
  @override
  final Iterable<Type> types = const [CategoryUIState, _$CategoryUIState];
  @override
  final String wireName = 'CategoryUIState';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoryUIState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'listUIState',
      serializers.serialize(object.listUIState,
          specifiedType: const FullType(ListUIState)),
      'tabIndex',
      serializers.serialize(object.tabIndex,
          specifiedType: const FullType(int)),
    ];
    Object value;
    value = object.editing;
    if (value != null) {
      result
        ..add('editing')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CategoryEntity)));
    }
    value = object.selectedId;
    if (value != null) {
      result
        ..add('selectedId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.forceSelected;
    if (value != null) {
      result
        ..add('forceSelected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  CategoryUIState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryUIStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'editing':
          result.editing.replace(serializers.deserialize(value,
              specifiedType: const FullType(CategoryEntity)) as CategoryEntity);
          break;
        case 'listUIState':
          result.listUIState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ListUIState)) as ListUIState);
          break;
        case 'selectedId':
          result.selectedId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'forceSelected':
          result.forceSelected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'tabIndex':
          result.tabIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryState extends CategoryState {
  @override
  final BuiltMap<String, CategoryEntity> map;
  @override
  final BuiltList<String> list;

  factory _$CategoryState([void Function(CategoryStateBuilder) updates]) =>
      (new CategoryStateBuilder()..update(updates))._build();

  _$CategoryState._({this.map, this.list}) : super._() {
    BuiltValueNullFieldError.checkNotNull(map, r'CategoryState', 'map');
    BuiltValueNullFieldError.checkNotNull(list, r'CategoryState', 'list');
  }

  @override
  CategoryState rebuild(void Function(CategoryStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryStateBuilder toBuilder() => new CategoryStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryState && map == other.map && list == other.list;
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
    return (newBuiltValueToStringHelper(r'CategoryState')
          ..add('map', map)
          ..add('list', list))
        .toString();
  }
}

class CategoryStateBuilder
    implements Builder<CategoryState, CategoryStateBuilder> {
  _$CategoryState _$v;

  MapBuilder<String, CategoryEntity> _map;
  MapBuilder<String, CategoryEntity> get map =>
      _$this._map ??= new MapBuilder<String, CategoryEntity>();
  set map(MapBuilder<String, CategoryEntity> map) => _$this._map = map;

  ListBuilder<String> _list;
  ListBuilder<String> get list => _$this._list ??= new ListBuilder<String>();
  set list(ListBuilder<String> list) => _$this._list = list;

  CategoryStateBuilder();

  CategoryStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _map = $v.map.toBuilder();
      _list = $v.list.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryState;
  }

  @override
  void update(void Function(CategoryStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryState build() => _build();

  _$CategoryState _build() {
    _$CategoryState _$result;
    try {
      _$result =
          _$v ?? new _$CategoryState._(map: map.build(), list: list.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
        _$failedField = 'list';
        list.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategoryState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CategoryUIState extends CategoryUIState {
  @override
  final CategoryEntity editing;
  @override
  final ListUIState listUIState;
  @override
  final String selectedId;
  @override
  final bool forceSelected;
  @override
  final int tabIndex;
  @override
  final Completer<SelectableEntity> saveCompleter;
  @override
  final Completer<Null> cancelCompleter;

  factory _$CategoryUIState([void Function(CategoryUIStateBuilder) updates]) =>
      (new CategoryUIStateBuilder()..update(updates))._build();

  _$CategoryUIState._(
      {this.editing,
      this.listUIState,
      this.selectedId,
      this.forceSelected,
      this.tabIndex,
      this.saveCompleter,
      this.cancelCompleter})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        listUIState, r'CategoryUIState', 'listUIState');
    BuiltValueNullFieldError.checkNotNull(
        tabIndex, r'CategoryUIState', 'tabIndex');
  }

  @override
  CategoryUIState rebuild(void Function(CategoryUIStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryUIStateBuilder toBuilder() =>
      new CategoryUIStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryUIState &&
        editing == other.editing &&
        listUIState == other.listUIState &&
        selectedId == other.selectedId &&
        forceSelected == other.forceSelected &&
        tabIndex == other.tabIndex &&
        saveCompleter == other.saveCompleter &&
        cancelCompleter == other.cancelCompleter;
  }

  int __hashCode;
  @override
  int get hashCode {
    if (__hashCode != null) return __hashCode;
    var _$hash = 0;
    _$hash = $jc(_$hash, editing.hashCode);
    _$hash = $jc(_$hash, listUIState.hashCode);
    _$hash = $jc(_$hash, selectedId.hashCode);
    _$hash = $jc(_$hash, forceSelected.hashCode);
    _$hash = $jc(_$hash, tabIndex.hashCode);
    _$hash = $jc(_$hash, saveCompleter.hashCode);
    _$hash = $jc(_$hash, cancelCompleter.hashCode);
    _$hash = $jf(_$hash);
    return __hashCode ??= _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryUIState')
          ..add('editing', editing)
          ..add('listUIState', listUIState)
          ..add('selectedId', selectedId)
          ..add('forceSelected', forceSelected)
          ..add('tabIndex', tabIndex)
          ..add('saveCompleter', saveCompleter)
          ..add('cancelCompleter', cancelCompleter))
        .toString();
  }
}

class CategoryUIStateBuilder
    implements Builder<CategoryUIState, CategoryUIStateBuilder> {
  _$CategoryUIState _$v;

  CategoryEntityBuilder _editing;
  CategoryEntityBuilder get editing =>
      _$this._editing ??= new CategoryEntityBuilder();
  set editing(CategoryEntityBuilder editing) => _$this._editing = editing;

  ListUIStateBuilder _listUIState;
  ListUIStateBuilder get listUIState =>
      _$this._listUIState ??= new ListUIStateBuilder();
  set listUIState(ListUIStateBuilder listUIState) =>
      _$this._listUIState = listUIState;

  String _selectedId;
  String get selectedId => _$this._selectedId;
  set selectedId(String selectedId) => _$this._selectedId = selectedId;

  bool _forceSelected;
  bool get forceSelected => _$this._forceSelected;
  set forceSelected(bool forceSelected) =>
      _$this._forceSelected = forceSelected;

  int _tabIndex;
  int get tabIndex => _$this._tabIndex;
  set tabIndex(int tabIndex) => _$this._tabIndex = tabIndex;

  Completer<SelectableEntity> _saveCompleter;
  Completer<SelectableEntity> get saveCompleter => _$this._saveCompleter;
  set saveCompleter(Completer<SelectableEntity> saveCompleter) =>
      _$this._saveCompleter = saveCompleter;

  Completer<Null> _cancelCompleter;
  Completer<Null> get cancelCompleter => _$this._cancelCompleter;
  set cancelCompleter(Completer<Null> cancelCompleter) =>
      _$this._cancelCompleter = cancelCompleter;

  CategoryUIStateBuilder();

  CategoryUIStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _editing = $v.editing?.toBuilder();
      _listUIState = $v.listUIState.toBuilder();
      _selectedId = $v.selectedId;
      _forceSelected = $v.forceSelected;
      _tabIndex = $v.tabIndex;
      _saveCompleter = $v.saveCompleter;
      _cancelCompleter = $v.cancelCompleter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryUIState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryUIState;
  }

  @override
  void update(void Function(CategoryUIStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryUIState build() => _build();

  _$CategoryUIState _build() {
    _$CategoryUIState _$result;
    try {
      _$result = _$v ??
          new _$CategoryUIState._(
              editing: _editing?.build(),
              listUIState: listUIState.build(),
              selectedId: selectedId,
              forceSelected: forceSelected,
              tabIndex: BuiltValueNullFieldError.checkNotNull(
                  tabIndex, r'CategoryUIState', 'tabIndex'),
              saveCompleter: saveCompleter,
              cancelCompleter: cancelCompleter);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'editing';
        _editing?.build();
        _$failedField = 'listUIState';
        listUIState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategoryUIState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
