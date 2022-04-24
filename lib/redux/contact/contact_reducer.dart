import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/redux/client/client_actions.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/company/company_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/entity_ui_state.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_state.dart';
import 'package:invoiceninja_flutter/data/models/entities.dart';

EntityUIState contactUIReducer(ContactUIState state, dynamic action) {
  return state.rebuild((b) => b
    ..listUIState.replace(contactListReducer(state.listUIState, action))
    ..editing.replace(editingReducer(state.editing, action))
    ..selectedId = selectedIdReducer(state.selectedId, action)
    ..forceSelected = forceSelectedReducer(state.forceSelected, action)
    ..tabIndex = tabIndexReducer(state.tabIndex, action));
}

final forceSelectedReducer = combineReducers<bool>([
  TypedReducer<bool, ViewContact>((completer, action) => true),
  TypedReducer<bool, ViewContactList>((completer, action) => false),
  TypedReducer<bool, FilterContactsByState>((completer, action) => false),
  TypedReducer<bool, FilterContacts>((completer, action) => false),
  TypedReducer<bool, FilterContactsByCustom1>((completer, action) => false),
  TypedReducer<bool, FilterContactsByCustom2>((completer, action) => false),
  TypedReducer<bool, FilterContactsByCustom3>((completer, action) => false),
  TypedReducer<bool, FilterContactsByCustom4>((completer, action) => false),
]);

final tabIndexReducer = combineReducers<int>([
  TypedReducer<int, UpdateContactTab>((completer, action) {
    return action.tabIndex;
  }),
  TypedReducer<int, PreviewEntity>((completer, action) {
    return 0;
  }),
]);

Reducer<String> selectedIdReducer = combineReducers([
  TypedReducer<String, ArchiveContactsSuccess>((completer, action) => ''),
  TypedReducer<String, DeleteContactsSuccess>((completer, action) => ''),
  TypedReducer<String, PreviewEntity>((selectedId, action) =>
      action.entityType == EntityType.contact ? action.entityId : selectedId),
  TypedReducer<String, ViewContact>(
      (String selectedId, dynamic action) => action.contactId),
  TypedReducer<String, AddContactSuccess>(
      (String selectedId, dynamic action) => action.contact.id),
  TypedReducer<String, SelectCompany>(
      (selectedId, action) => action.clearSelection ? '' : selectedId),
  TypedReducer<String, ClearEntityFilter>((selectedId, action) => ''),
  TypedReducer<String, SortContacts>((selectedId, action) => ''),
  TypedReducer<String, FilterContacts>((selectedId, action) => ''),
  TypedReducer<String, FilterContactsByState>((selectedId, action) => ''),
  TypedReducer<String, FilterContactsByCustom1>((selectedId, action) => ''),
  TypedReducer<String, FilterContactsByCustom2>((selectedId, action) => ''),
  TypedReducer<String, FilterContactsByCustom3>((selectedId, action) => ''),
  TypedReducer<String, FilterContactsByCustom4>((selectedId, action) => ''),
  TypedReducer<String, FilterByEntity>(
      (selectedId, action) => action.clearSelection
          ? ''
          : action.entityType == EntityType.contact
              ? action.entityId
              : selectedId),
]);

final editingReducer = combineReducers<ContactEntity>([
  TypedReducer<ContactEntity, SaveContactSuccess>(_updateEditing),
  TypedReducer<ContactEntity, AddContactSuccess>(_updateEditing),
  TypedReducer<ContactEntity, RestoreContactsSuccess>((contacts, action) {
    return action.contacts[0];
  }),
  TypedReducer<ContactEntity, ArchiveContactsSuccess>((contacts, action) {
    return action.contacts[0];
  }),
  TypedReducer<ContactEntity, DeleteContactsSuccess>((contacts, action) {
    return action.contacts[0];
  }),
  TypedReducer<ContactEntity, EditContact>(_updateEditing),
  TypedReducer<ContactEntity, EditClient>((contact, action) {
    return action.contact ?? ContactEntity();
  }),
  TypedReducer<ContactEntity, UpdateContact>((contact, action) {
    return action.contact.rebuild((b) => b..isChanged = true);
  }),
  TypedReducer<ContactEntity, DiscardChanges>(_clearEditing),
]);

ContactEntity _clearEditing(ContactEntity contact, dynamic action) {
  return ContactEntity();
}

ContactEntity _updateEditing(ContactEntity contact, dynamic action) {
  return action.contact;
}

final contactListReducer = combineReducers<ListUIState>([
  TypedReducer<ListUIState, SortContacts>(_sortContacts),
  TypedReducer<ListUIState, FilterContactsByState>(_filterContactsByState),
  TypedReducer<ListUIState, FilterContacts>(_filterContacts),
  TypedReducer<ListUIState, FilterContactsByCustom1>(_filterContactsByCustom1),
  TypedReducer<ListUIState, FilterContactsByCustom2>(_filterContactsByCustom2),
  TypedReducer<ListUIState, StartContactMultiselect>(_startListMultiselect),
  TypedReducer<ListUIState, AddToContactMultiselect>(_addToListMultiselect),
  TypedReducer<ListUIState, RemoveFromContactMultiselect>(
      _removeFromListMultiselect),
  TypedReducer<ListUIState, ClearContactMultiselect>(_clearListMultiselect),
  TypedReducer<ListUIState, ViewContactList>(_viewContactList),
]);

ListUIState _viewContactList(
    ListUIState contactListState, ViewContactList action) {
  return contactListState.rebuild((b) => b
    ..selectedIds = null
    ..filter = null
    ..filterClearedAt = DateTime.now().millisecondsSinceEpoch);
}

ListUIState _filterContactsByCustom1(
    ListUIState contactListState, FilterContactsByCustom1 action) {
  if (contactListState.custom1Filters.contains(action.value)) {
    return contactListState
        .rebuild((b) => b..custom1Filters.remove(action.value));
  } else {
    return contactListState.rebuild((b) => b..custom1Filters.add(action.value));
  }
}

ListUIState _filterContactsByCustom2(
    ListUIState contactListState, FilterContactsByCustom2 action) {
  if (contactListState.custom2Filters.contains(action.value)) {
    return contactListState
        .rebuild((b) => b..custom2Filters.remove(action.value));
  } else {
    return contactListState.rebuild((b) => b..custom2Filters.add(action.value));
  }
}

ListUIState _filterContactsByState(
    ListUIState contactListState, FilterContactsByState action) {
  if (contactListState.stateFilters.contains(action.state)) {
    return contactListState
        .rebuild((b) => b..stateFilters.remove(action.state));
  } else {
    return contactListState.rebuild((b) => b..stateFilters.add(action.state));
  }
}

ListUIState _filterContacts(
    ListUIState contactListState, FilterContacts action) {
  return contactListState.rebuild((b) => b
    ..filter = action.filter
    ..filterClearedAt = action.filter == null
        ? DateTime.now().millisecondsSinceEpoch
        : contactListState.filterClearedAt);
}

ListUIState _sortContacts(ListUIState contactListState, SortContacts action) {
  return contactListState.rebuild((b) => b
    ..sortAscending = b.sortField != action.field || !b.sortAscending
    ..sortField = action.field);
}

ListUIState _startListMultiselect(
    ListUIState productListState, StartContactMultiselect action) {
  return productListState.rebuild((b) => b..selectedIds = ListBuilder());
}

ListUIState _addToListMultiselect(
    ListUIState productListState, AddToContactMultiselect action) {
  return productListState.rebuild((b) => b..selectedIds.add(action.entity.id));
}

ListUIState _removeFromListMultiselect(
    ListUIState productListState, RemoveFromContactMultiselect action) {
  return productListState
      .rebuild((b) => b..selectedIds.remove(action.entity.id));
}

ListUIState _clearListMultiselect(
    ListUIState productListState, ClearContactMultiselect action) {
  return productListState.rebuild((b) => b..selectedIds = null);
}

final contactsReducer = combineReducers<ContactState>([
  TypedReducer<ContactState, SaveContactSuccess>(_updateContact),
  TypedReducer<ContactState, AddContactSuccess>(_addContact),
  TypedReducer<ContactState, LoadContactsSuccess>(_setLoadedContacts),
  TypedReducer<ContactState, LoadContactSuccess>(_setLoadedContact),
  TypedReducer<ContactState, LoadCompanySuccess>(_setLoadedCompany),
  TypedReducer<ContactState, ArchiveContactsSuccess>(_archiveContactSuccess),
  TypedReducer<ContactState, DeleteContactsSuccess>(_deleteContactSuccess),
  TypedReducer<ContactState, RestoreContactsSuccess>(_restoreContactSuccess),
]);

ContactState _archiveContactSuccess(
    ContactState contactState, ArchiveContactsSuccess action) {
  return contactState.rebuild((b) {
    for (final contact in action.contacts) {
      b.map[contact.id] = contact;
    }
  });
}

ContactState _deleteContactSuccess(
    ContactState contactState, DeleteContactsSuccess action) {
  return contactState.rebuild((b) {
    for (final contact in action.contacts) {
      b.map[contact.id] = contact;
    }
  });
}

ContactState _restoreContactSuccess(
    ContactState contactState, RestoreContactsSuccess action) {
  return contactState.rebuild((b) {
    for (final contact in action.contacts) {
      b.map[contact.id] = contact;
    }
  });
}

ContactState _addContact(ContactState contactState, AddContactSuccess action) {
  return contactState.rebuild((b) => b
    ..map[action.contact.id] = action.contact
    ..list.add(action.contact.id));
}

ContactState _updateContact(
    ContactState contactState, SaveContactSuccess action) {
  return contactState
      .rebuild((b) => b..map[action.contact.id] = action.contact);
}

ContactState _setLoadedContact(
    ContactState contactState, LoadContactSuccess action) {
  return contactState
      .rebuild((b) => b..map[action.contact.id] = action.contact);
}

ContactState _setLoadedContacts(
        ContactState contactState, LoadContactsSuccess action) =>
    contactState.loadContacts(action.contacts);

ContactState _setLoadedCompany(
    ContactState contactState, LoadCompanySuccess action) {
  final company = action.userCompany.company;
  return contactState.loadContacts(company.contacts);
}
