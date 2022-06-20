import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:invoiceninja_flutter/ui/app/entities/entity_actions_dialog.dart';

class ViewContactList implements PersistUI {
  ViewContactList({this.force = false});

  final bool force;
}

class ViewContact implements PersistUI, PersistPrefs {
  ViewContact({
    @required this.contactId,
    this.force = false,
  });

  final String contactId;
  final bool force;
}

class EditContact implements PersistUI, PersistPrefs {
  EditContact(
      {@required this.contact,
      this.completer,
      this.cancelCompleter,
      this.force = false});

  final ContactEntity contact;
  final Completer completer;
  final Completer cancelCompleter;
  final bool force;
}

class UpdateContact implements PersistUI {
  UpdateContact(this.contact);

  final ContactEntity contact;
}

class LoadContact {
  LoadContact({this.completer, this.contactId});

  final Completer completer;
  final String contactId;
}

class LoadContactActivity {
  LoadContactActivity({this.completer, this.contactId});

  final Completer completer;
  final String contactId;
}

class LoadContacts {
  LoadContacts({this.completer, this.page = 1});

  final Completer completer;
  final int page;
}

class LoadContactRequest implements StartLoading {}

class LoadContactFailure implements StopLoading {
  LoadContactFailure(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'LoadContactFailure{error: $error}';
  }
}

class LoadContactSuccess implements StopLoading, PersistData {
  LoadContactSuccess(this.contact);

  final ContactEntity contact;

  @override
  String toString() {
    return 'LoadContactSuccess{contact: $contact}';
  }
}

class LoadContactsRequest implements StartLoading {}

class LoadContactsFailure implements StopLoading {
  LoadContactsFailure(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'LoadContactsFailure{error: $error}';
  }
}

class LoadContactsSuccess implements StopLoading {
  LoadContactsSuccess(this.contacts);

  final BuiltList<ContactEntity> contacts;

  @override
  String toString() {
    return 'LoadContactsSuccess{contacts: $contacts}';
  }
}

class SaveContactRequest implements StartSaving {
  SaveContactRequest({this.completer, this.contact});

  final Completer completer;
  final ContactEntity contact;
}

class SaveContactSuccess implements StopSaving, PersistData, PersistUI {
  SaveContactSuccess(this.contact);

  final ContactEntity contact;
}

class AddContactSuccess implements StopSaving, PersistData, PersistUI {
  AddContactSuccess(this.contact);

  final ContactEntity contact;
}

class SaveContactFailure implements StopSaving {
  SaveContactFailure(this.error);

  final Object error;
}

class ArchiveContactsRequest implements StartSaving {
  ArchiveContactsRequest(this.completer, this.contactIds);

  final Completer completer;
  final List<String> contactIds;
}

class ArchiveContactsSuccess implements StopSaving, PersistData {
  ArchiveContactsSuccess(this.contacts);

  final List<ContactEntity> contacts;
}

class ArchiveContactsFailure implements StopSaving {
  ArchiveContactsFailure(this.contacts);

  final List<ContactEntity> contacts;
}

class DeleteContactsRequest implements StartSaving {
  DeleteContactsRequest(this.completer, this.contactIds);

  final Completer completer;
  final List<String> contactIds;
}

class DeleteContactsSuccess implements StopSaving, PersistData {
  DeleteContactsSuccess(this.contacts);

  final List<ContactEntity> contacts;
}

class DeleteContactsFailure implements StopSaving {
  DeleteContactsFailure(this.contacts);

  final List<ContactEntity> contacts;
}

class RestoreContactsRequest implements StartSaving {
  RestoreContactsRequest(this.completer, this.contactIds);

  final Completer completer;
  final List<String> contactIds;
}

class RestoreContactsSuccess implements StopSaving, PersistData {
  RestoreContactsSuccess(this.contacts);

  final List<ContactEntity> contacts;
}

class RestoreContactsFailure implements StopSaving {
  RestoreContactsFailure(this.contacts);

  final List<ContactEntity> contacts;
}

class FilterContacts implements PersistUI {
  FilterContacts(this.filter);

  final String filter;
}

class SortContacts implements PersistUI, PersistPrefs {
  SortContacts(this.field);

  final String field;
}

class FilterContactsByState implements PersistUI {
  FilterContactsByState(this.state);

  final EntityState state;
}

class FilterContactsByCustom1 implements PersistUI {
  FilterContactsByCustom1(this.value);

  final String value;
}

class FilterContactsByCustom2 implements PersistUI {
  FilterContactsByCustom2(this.value);

  final String value;
}

class FilterContactsByCustom3 implements PersistUI {
  FilterContactsByCustom3(this.value);

  final String value;
}

class FilterContactsByCustom4 implements PersistUI {
  FilterContactsByCustom4(this.value);

  final String value;
}

class StartContactMultiselect {
  StartContactMultiselect();
}

class AddToContactMultiselect {
  AddToContactMultiselect({@required this.entity});

  final BaseEntity entity;
}

class RemoveFromContactMultiselect {
  RemoveFromContactMultiselect({@required this.entity});

  final BaseEntity entity;
}

class ClearContactMultiselect {
  ClearContactMultiselect();
}

class UpdateContactTab implements PersistUI {
  UpdateContactTab({this.tabIndex});

  final int tabIndex;
}

void handleContactAction(
    BuildContext context, List<BaseEntity> contacts, EntityAction action) {
  if (contacts.isEmpty) {
    return;
  }

  final store = StoreProvider.of<AppState>(context);
  final state = store.state;
  final localization = AppLocalization.of(context);
  final contact = contacts.first as ContactEntity;
  final contactIds = contacts.map((contact) => contact.id).toList();

  switch (action) {
    case EntityAction.edit:
      editEntity(/* context: context, */ entity: contact);
      break;
    case EntityAction.restore:
      store.dispatch(RestoreContactsRequest(
          snackBarCompleter<Null>(context, localization.restoredContact),
          contactIds));
      break;
    case EntityAction.archive:
      store.dispatch(ArchiveContactsRequest(
          snackBarCompleter<Null>(context, localization.archivedContact),
          contactIds));
      break;
    case EntityAction.delete:
      store.dispatch(DeleteContactsRequest(
          snackBarCompleter<Null>(context, localization.deletedContact),
          contactIds));
      break;
    case EntityAction.toggleMultiselect:
      if (!store.state.contactListState.isInMultiselect()) {
        store.dispatch(StartContactMultiselect());
      }

      if (contacts.isEmpty) {
        break;
      }

      for (final contact in contacts) {
        if (!store.state.contactListState.isSelected(contact.id)) {
          store.dispatch(AddToContactMultiselect(entity: contact));
        } else {
          store.dispatch(RemoveFromContactMultiselect(entity: contact));
        }
      }
      break;
    case EntityAction.more:
      showEntityActionsDialog(
        entities: [contact],
      );
      break;
    default:
      print('## ERROR: unhandled action $action in contact_actions');
      break;
  }
}
