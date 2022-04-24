import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/redux/static/static_state.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:memoize/memoize.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';

var memoizedDropdownContactList = memo5(
    (BuiltMap<String, ContactEntity> contactMap,
            BuiltList<String> contactList,
            StaticState staticState,
            BuiltMap<String, UserEntity> userMap,
            String clientId) =>
        dropdownContactsSelector(
            contactMap, contactList, staticState, userMap, clientId));

List<String> dropdownContactsSelector(
    BuiltMap<String, ContactEntity> contactMap,
    BuiltList<String> contactList,
    StaticState staticState,
    BuiltMap<String, UserEntity> userMap,
    String clientId) {
  final list = contactList.where((contactId) {
    final contact = contactMap[contactId];
    /*
    if (clientId != null && clientId > 0 && contact.clientId != clientId) {
      return false;
    }
    */
    return contact.isActive;
  }).toList();

  list.sort((contactAId, contactBId) {
    final contactA = contactMap[contactAId];
    final contactB = contactMap[contactBId];
    return contactA.compareTo(contactB, ContactFields.fullName, true);
  });

  return list;
}

var memoizedFilteredContactList = memo6((SelectionState selectionState,
        BuiltMap<String, ContactEntity> contactMap,
        BuiltList<String> contactList,
        StaticState staticState,
        BuiltMap<String, UserEntity> userMap,
        ListUIState contactListState) =>
    filteredContactsSelector(selectionState, contactMap, contactList,
        staticState, userMap, contactListState));

List<String> filteredContactsSelector(
    SelectionState selectionState,
    BuiltMap<String, ContactEntity> contactMap,
    BuiltList<String> contactList,
    StaticState staticState,
    BuiltMap<String, UserEntity> userMap,
    ListUIState contactListState) {
  final filterEntityId = selectionState.filterEntityId;
  final filterEntityType = selectionState.filterEntityType;

  final list = contactList.where((contactId) {
    final contact = contactMap[contactId];
    if (filterEntityId != null && contact.id != filterEntityId) {
      return false;
    } else {}

    if (!contact.matchesStates(contactListState.stateFilters)) {
      return false;
    }
    if (contactListState.custom1Filters.isNotEmpty &&
        !contactListState.custom1Filters.contains(contact.customValue1)) {
      return false;
    } else if (contactListState.custom2Filters.isNotEmpty &&
        !contactListState.custom2Filters.contains(contact.customValue2)) {
      return false;
    } else if (contactListState.custom3Filters.isNotEmpty &&
        !contactListState.custom3Filters.contains(contact.customValue3)) {
      return false;
    } else if (contactListState.custom4Filters.isNotEmpty &&
        !contactListState.custom4Filters.contains(contact.customValue4)) {
      return false;
    }

    return contact.matchesFilter(contactListState.filter);
  }).toList();

  list.sort((contactAId, contactBId) {
    final contactA = contactMap[contactAId];
    final contactB = contactMap[contactBId];
    return contactA.compareTo(
        contactB, contactListState.sortField, contactListState.sortAscending);
  });

  return list;
}

bool hasContactChanges(
        ContactEntity contact, BuiltMap<String, ContactEntity> contactMap) =>
    contact.isNew ? contact.isChanged : contact != contactMap[contact.id];
