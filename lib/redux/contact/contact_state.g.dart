// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactState> _$contactStateSerializer =
    new _$ContactStateSerializer();
Serializer<ContactUIState> _$contactUIStateSerializer =
    new _$ContactUIStateSerializer();

class _$ContactStateSerializer implements StructuredSerializer<ContactState> {
  @override
  final Iterable<Type> types = const [ContactState, _$ContactState];
  @override
  final String wireName = 'ContactState';

  @override
  Iterable<Object> serialize(Serializers serializers, ContactState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'map',
      serializers.serialize(object.map,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(ContactEntity)])),
      'list',
      serializers.serialize(object.list,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  ContactState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactStateBuilder();

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
                const FullType(ContactEntity)
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

class _$ContactUIStateSerializer
    implements StructuredSerializer<ContactUIState> {
  @override
  final Iterable<Type> types = const [ContactUIState, _$ContactUIState];
  @override
  final String wireName = 'ContactUIState';

  @override
  Iterable<Object> serialize(Serializers serializers, ContactUIState object,
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
            specifiedType: const FullType(ContactEntity)));
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
  ContactUIState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactUIStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'editing':
          result.editing.replace(serializers.deserialize(value,
              specifiedType: const FullType(ContactEntity)) as ContactEntity);
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

class _$ContactState extends ContactState {
  @override
  final BuiltMap<String, ContactEntity> map;
  @override
  final BuiltList<String> list;

  factory _$ContactState([void Function(ContactStateBuilder) updates]) =>
      (new ContactStateBuilder()..update(updates))._build();

  _$ContactState._({this.map, this.list}) : super._() {
    BuiltValueNullFieldError.checkNotNull(map, r'ContactState', 'map');
    BuiltValueNullFieldError.checkNotNull(list, r'ContactState', 'list');
  }

  @override
  ContactState rebuild(void Function(ContactStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactStateBuilder toBuilder() => new ContactStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactState && map == other.map && list == other.list;
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
    return (newBuiltValueToStringHelper(r'ContactState')
          ..add('map', map)
          ..add('list', list))
        .toString();
  }
}

class ContactStateBuilder
    implements Builder<ContactState, ContactStateBuilder> {
  _$ContactState _$v;

  MapBuilder<String, ContactEntity> _map;
  MapBuilder<String, ContactEntity> get map =>
      _$this._map ??= new MapBuilder<String, ContactEntity>();
  set map(MapBuilder<String, ContactEntity> map) => _$this._map = map;

  ListBuilder<String> _list;
  ListBuilder<String> get list => _$this._list ??= new ListBuilder<String>();
  set list(ListBuilder<String> list) => _$this._list = list;

  ContactStateBuilder();

  ContactStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _map = $v.map.toBuilder();
      _list = $v.list.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactState;
  }

  @override
  void update(void Function(ContactStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactState build() => _build();

  _$ContactState _build() {
    _$ContactState _$result;
    try {
      _$result =
          _$v ?? new _$ContactState._(map: map.build(), list: list.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
        _$failedField = 'list';
        list.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ContactState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ContactUIState extends ContactUIState {
  @override
  final ContactEntity editing;
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

  factory _$ContactUIState([void Function(ContactUIStateBuilder) updates]) =>
      (new ContactUIStateBuilder()..update(updates))._build();

  _$ContactUIState._(
      {this.editing,
      this.listUIState,
      this.selectedId,
      this.forceSelected,
      this.tabIndex,
      this.saveCompleter,
      this.cancelCompleter})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        listUIState, r'ContactUIState', 'listUIState');
    BuiltValueNullFieldError.checkNotNull(
        tabIndex, r'ContactUIState', 'tabIndex');
  }

  @override
  ContactUIState rebuild(void Function(ContactUIStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactUIStateBuilder toBuilder() =>
      new ContactUIStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactUIState &&
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
    return (newBuiltValueToStringHelper(r'ContactUIState')
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

class ContactUIStateBuilder
    implements Builder<ContactUIState, ContactUIStateBuilder> {
  _$ContactUIState _$v;

  ContactEntityBuilder _editing;
  ContactEntityBuilder get editing =>
      _$this._editing ??= new ContactEntityBuilder();
  set editing(ContactEntityBuilder editing) => _$this._editing = editing;

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

  ContactUIStateBuilder();

  ContactUIStateBuilder get _$this {
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
  void replace(ContactUIState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactUIState;
  }

  @override
  void update(void Function(ContactUIStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactUIState build() => _build();

  _$ContactUIState _build() {
    _$ContactUIState _$result;
    try {
      _$result = _$v ??
          new _$ContactUIState._(
              editing: _editing?.build(),
              listUIState: listUIState.build(),
              selectedId: selectedId,
              forceSelected: forceSelected,
              tabIndex: BuiltValueNullFieldError.checkNotNull(
                  tabIndex, r'ContactUIState', 'tabIndex'),
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
            r'ContactUIState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint