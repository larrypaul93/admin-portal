// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/redux/static/static_state.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_desktop.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_vm.dart';
import 'package:redux/redux.dart';

// Project imports:
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/client/client_actions.dart';
import 'package:invoiceninja_flutter/ui/client/edit/client_edit_contacts.dart';
import 'package:invoiceninja_flutter/ui/client/edit/client_edit_vm.dart';

class ClientEditContactsScreen extends StatelessWidget {
  const ClientEditContactsScreen({Key key, @required this.viewModel})
      : super(key: key);

  final ClientEditVM viewModel;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ClientEditContactsVM>(
      converter: (Store<AppState> store) {
        return ClientEditContactsVM.fromStore(store);
      },
      builder: (context, vm) {
        return ClientEditContacts(
          viewModel: vm,
          clientViewModel: viewModel,
        );
      },
    );
  }
}

class ClientEditContactsVM {
  ClientEditContactsVM({
    @required this.company,
    @required this.client,
    @required this.contact,
    @required this.onAddContactPressed,
    @required this.onRemoveContactPressed,
    @required this.onDoneContactPressed,
    @required this.onChangedContact,
  });

  factory ClientEditContactsVM.fromStore(Store<AppState> store) {
    final AppState state = store.state;
    final client = state.clientUIState.editing;

    return ClientEditContactsVM(
        company: state.company,
        client: client,
        contact: state.clientUIState.editingContact,
        onAddContactPressed: () {
          final contact = ContactEntity();
          store.dispatch(AddContact(contact));
          // store.dispatch(EditContact(contact: contact));
        },
        onRemoveContactPressed: (index) => store.dispatch(DeleteContact(index)),
        onDoneContactPressed: (_) {
          // store.dispatch(EditContact());
        },
        onChangedContact: (contact, index) {
          store.dispatch(UpdateClientContact(contact: contact, index: index));
        });
  }

  final CompanyEntity company;
  final ClientEntity client;
  final ContactEntity contact;
  final Function() onAddContactPressed;
  final Function(int) onRemoveContactPressed;
  final Function(BuildContext) onDoneContactPressed;
  final Function(ContactEntity, int) onChangedContact;
}

class ClientEditContactScreen extends StatelessWidget {
  const ClientEditContactScreen(
      {Key key,
      @required this.viewModel,
      @required this.contactState,
      @required this.contact})
      : super(key: key);

  final ClientEditContactsVM viewModel;
  final ContactEditDetailsState contactState;
  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ClientEditContactVM>(
      converter: (Store<AppState> store) {
        return ClientEditContactVM.fromStore(store, contactState, contact);
      },
      builder: (context, vm) {
        return ContactEditDesktop(
          viewModel: vm,
        );
      },
    );
  }
}

class ClientEditContactVM extends ContactEditVM {
  ClientEditContactVM(
      {@required CompanyEntity company,
      @required ContactEntity contact,
      @required ContactEntity orgContact,
      @required Function(ContactEntity) onChanged,
      @required Function(BuildContext) onSavePressed,
      @required Function(BuildContext) onCancelPressed,
      @required StaticState staticState,
      @required AppState state,
      @required bool isSaving})
      : super(
            company: company,
            contact: contact,
            origContact: orgContact,
            onCancelPressed: onCancelPressed,
            onChanged: onChanged,
            onSavePressed: onSavePressed,
            state: state,
            isSaving: isSaving,
            staticState: staticState);

  factory ClientEditContactVM.fromStore(Store<AppState> store,
      ContactEditDetailsState contactState, ContactEntity contact) {
    final AppState state = store.state;
    final client = state.clientUIState.editing;
    ContactEntity _contact = contact;
    return ClientEditContactVM(
      state: state,
      staticState: state.staticState,
      company: state.company,
      orgContact: contact,
      contact: _contact,
      isSaving: state.isSaving,
      onChanged: (contact) {
        // store.dispatch(UpdateContact(contact));
        // if(contact.isNew)
        _contact = contact;
        contactState.updateContact(contact);
        final int index = client.contacts
            .indexOf(client.contacts.firstWhere((c) => c.id == contact.id));
        store.dispatch(UpdateClientContact(contact: contact, index: index));

        //
      },
      onCancelPressed: (context) {
        // UpdateCurrentRoute(store.state.uiState.previousRoute);
        // Navigator.pop(context);
      },
      onSavePressed: (context) {},
    );
  }
}
