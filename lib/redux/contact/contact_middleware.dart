import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/redux/product/product_actions.dart';
import 'package:redux/redux.dart';
import 'package:invoiceninja_flutter/main_app.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/utils/platforms.dart';
import 'package:invoiceninja_flutter/redux/app/app_middleware.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/ui/ui_actions.dart';
import 'package:invoiceninja_flutter/ui/contact/contact_screen.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_vm.dart';
import 'package:invoiceninja_flutter/ui/contact/view/contact_view_vm.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/data/repositories/contact_repository.dart';

List<Middleware<AppState>> createStoreContactsMiddleware([
  ContactRepository repository = const ContactRepository(),
]) {
  final viewContactList = _viewContactList();
  final viewContact = _viewContact();
  final editContact = _editContact();
  final loadContacts = _loadContacts(repository);
  final loadContact = _loadContact(repository);
  final saveContact = _saveContact(repository);
  final archiveContact = _archiveContact(repository);
  final deleteContact = _deleteContact(repository);
  final restoreContact = _restoreContact(repository);

  return [
    TypedMiddleware<AppState, ViewContactList>(viewContactList),
    TypedMiddleware<AppState, ViewContact>(viewContact),
    TypedMiddleware<AppState, EditContact>(editContact),
    TypedMiddleware<AppState, LoadContacts>(loadContacts),
    TypedMiddleware<AppState, LoadContact>(loadContact),
    TypedMiddleware<AppState, SaveContactRequest>(saveContact),
    TypedMiddleware<AppState, ArchiveContactsRequest>(archiveContact),
    TypedMiddleware<AppState, DeleteContactsRequest>(deleteContact),
    TypedMiddleware<AppState, RestoreContactsRequest>(restoreContact),
  ];
}

Middleware<AppState> _editContact() {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as EditContact;

    next(action);

    store.dispatch(UpdateCurrentRoute(ContactEditScreen.route));

    if (store.state.prefState.isMobile) {
      navigatorKey.currentState.pushNamed(ContactEditScreen.route);
    }
  };
}

Middleware<AppState> _viewContact() {
  return (Store<AppState> store, dynamic dynamicAction,
      NextDispatcher next) async {
    final action = dynamicAction as ViewContact;

    next(action);

    store.dispatch(UpdateCurrentRoute(ContactViewScreen.route));

    if (store.state.prefState.isMobile) {
      navigatorKey.currentState.pushNamed(ContactViewScreen.route);
    }
  };
}

Middleware<AppState> _viewContactList() {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as ViewContactList;

    next(action);

    if (store.state.staticState.isStale) {
      store.dispatch(RefreshData());
    }

    store.dispatch(UpdateCurrentRoute(ContactScreen.route));

    if (store.state.prefState.isMobile) {
      navigatorKey.currentState.pushNamedAndRemoveUntil(
          ContactScreen.route, (Route<dynamic> route) => false);
    }
  };
}

Middleware<AppState> _archiveContact(ContactRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as ArchiveContactsRequest;
    final prevContacts = action.contactIds
        .map((id) => store.state.contactState.map[id])
        .toList();
    repository
        .bulkAction(
            store.state.credentials, action.contactIds, EntityAction.archive)
        .then((List<ContactEntity> contacts) {
      store.dispatch(ArchiveContactsSuccess(contacts));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((Object error) {
      print(error);
      store.dispatch(ArchiveContactsFailure(prevContacts));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}

Middleware<AppState> _deleteContact(ContactRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as DeleteContactsRequest;
    final prevContacts = action.contactIds
        .map((id) => store.state.contactState.map[id])
        .toList();
    repository
        .bulkAction(
            store.state.credentials, action.contactIds, EntityAction.delete)
        .then((List<ContactEntity> contacts) {
      store.dispatch(DeleteContactsSuccess(contacts));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((Object error) {
      print(error);
      store.dispatch(DeleteContactsFailure(prevContacts));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}

Middleware<AppState> _restoreContact(ContactRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as RestoreContactsRequest;
    final prevContacts = action.contactIds
        .map((id) => store.state.contactState.map[id])
        .toList();
    repository
        .bulkAction(
            store.state.credentials, action.contactIds, EntityAction.restore)
        .then((List<ContactEntity> contacts) {
      store.dispatch(RestoreContactsSuccess(contacts));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((Object error) {
      print(error);
      store.dispatch(RestoreContactsFailure(prevContacts));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}

Middleware<AppState> _saveContact(ContactRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as SaveContactRequest;
    repository
        .saveData(store.state.credentials, action.contact)
        .then((ContactEntity contact) {
      if (action.contact.isNew) {
        store.dispatch(AddContactSuccess(contact));
      } else {
        store.dispatch(SaveContactSuccess(contact));
      }

      action.completer.complete(contact);
    }).catchError((Object error) {
      print(error);
      store.dispatch(SaveContactFailure(error));
      action.completer.completeError(error);
    });

    next(action);
  };
}

Middleware<AppState> _loadContact(ContactRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as LoadContact;
    final AppState state = store.state;

    store.dispatch(LoadContactRequest());
    repository.loadItem(state.credentials, action.contactId).then((contact) {
      store.dispatch(LoadContactSuccess(contact));

      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((Object error) {
      print(error);
      store.dispatch(LoadContactFailure(error));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}

Middleware<AppState> _loadContacts(ContactRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as LoadContacts;
    final AppState state = store.state;

    store.dispatch(LoadContactsRequest());
    repository.loadList(state.credentials, action.page).then((data) {
      store.dispatch(LoadContactsSuccess(data));

      if (data.length == kRecordsPerPage) {
        store.dispatch(LoadContacts(
          completer: action.completer,
          page: action.page + 1,
        ));
      } else {
        if (action.completer != null) {
          action.completer.complete(null);
        }
        // store.dispatch(LoadProducts());
        store.dispatch(LoadProducts());
      }
    }).catchError((Object error) {
      print(error);
      store.dispatch(LoadContactsFailure(error));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}
