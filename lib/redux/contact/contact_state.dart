import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/redux/ui/entity_ui_state.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';

part 'contact_state.g.dart';

abstract class ContactState
    implements Built<ContactState, ContactStateBuilder> {
  factory ContactState() {
    return _$ContactState._(
      map: BuiltMap<String, ContactEntity>(),
      list: BuiltList<String>(),
    );
  }
  ContactState._();

  @override
  @memoized
  int get hashCode;

  BuiltMap<String, ContactEntity> get map;
  BuiltList<String> get list;

  ContactEntity get(String contactId) {
    if (map.containsKey(contactId)) {
      return map[contactId];
    } else {
      return ContactEntity(id: contactId);
    }
  }

  ContactState loadContacts(BuiltList<ContactEntity> clients) {
    final map = Map<String, ContactEntity>.fromIterable(
      clients,
      key: (dynamic item) => item.id,
      value: (dynamic item) => item,
    );

    return rebuild((b) => b
      ..map.addAll(map)
      ..list.replace((map.keys.toList() + list.toList()).toSet().toList()));
  }

  static Serializer<ContactState> get serializer => _$contactStateSerializer;
}

abstract class ContactUIState extends Object
    with EntityUIState
    implements Built<ContactUIState, ContactUIStateBuilder> {
  factory ContactUIState(PrefStateSortField sortField) {
    return _$ContactUIState._(
      listUIState: ListUIState(sortField?.field ?? ContactFields.fullName,
          sortAscending: sortField?.ascending),
      editing: ContactEntity(),
      selectedId: '',
      tabIndex: 0,
    );
  }
  ContactUIState._();

  @override
  @memoized
  int get hashCode;

  @nullable
  ContactEntity get editing;

  @override
  bool get isCreatingNew => editing.isNew;

  @override
  String get editingId => editing.id;

  static Serializer<ContactUIState> get serializer =>
      _$contactUIStateSerializer;
}
