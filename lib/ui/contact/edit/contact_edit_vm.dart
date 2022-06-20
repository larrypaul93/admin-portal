// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:redux/redux.dart';

// Project imports:
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/main_app.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_actions.dart';
import 'package:invoiceninja_flutter/redux/static/static_state.dart';
import 'package:invoiceninja_flutter/redux/ui/ui_actions.dart';
import 'package:invoiceninja_flutter/ui/app/dialogs/error_dialog.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit.dart';
import 'package:invoiceninja_flutter/ui/contact/view/contact_view_vm.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';

class ContactEditScreen extends StatelessWidget {
  const ContactEditScreen({Key key}) : super(key: key);

  static const String route = '/contact/edit';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContactEditVM>(
      converter: (Store<AppState> store) {
        return ContactEditVM.fromStore(store);
      },
      builder: (context, vm) {
        return ContactEdit(
          viewModel: vm,
        );
      },
    );
  }
}

class ClientContactEditVM {
  ClientContactEditVM(
      {@required this.state,
      @required this.company,
      @required this.contact,
      @required this.onChanged,
      @required this.onSavePressed,
      @required this.onCancelPressed,
      @required this.staticState});

  final AppState state;
  final CompanyEntity company;
  ContactEntity contact;
  final Function(ContactEntity) onChanged;
  final Function(BuildContext) onSavePressed;
  final Function(BuildContext) onCancelPressed;
  final StaticState staticState;
}

class ContactEditVM extends ClientContactEditVM {
  ContactEditVM({
    @required AppState state,
    @required CompanyEntity company,
    @required ContactEntity contact,
    @required this.origContact,
    @required Function(ContactEntity) onChanged,
    @required Function(BuildContext) onSavePressed,
    @required Function(BuildContext) onCancelPressed,
    @required StaticState staticState,
    @required this.isSaving,
  }) : super(
            state: state,
            company: company,
            contact: contact,
            onChanged: onChanged,
            onSavePressed: onSavePressed,
            onCancelPressed: onCancelPressed,
            staticState: staticState);

  factory ContactEditVM.fromStore(Store<AppState> store) {
    final state = store.state;
    final contact = state.contactUIState.editing;

    return ContactEditVM(
        state: state,
        company: state.company,
        contact: contact,
        origContact: state.contactState.map[contact.id],
        staticState: state.staticState,
        isSaving: state.isSaving,
        onChanged: (ContactEntity contact) =>
            store.dispatch(UpdateContact(contact)),
        onCancelPressed: (BuildContext context) {
          createEntity(context: context, entity: ContactEntity(), force: true);
          if (state.contactUIState.cancelCompleter != null) {
            state.contactUIState.cancelCompleter.complete();
          } else {
            store.dispatch(UpdateCurrentRoute(state.uiState.previousRoute));
          }
        },
        onSavePressed: (BuildContext context) {
          Debouncer.runOnComplete(() {
            final contact = store.state.contactUIState.editing;

            final Completer<ContactEntity> completer =
                Completer<ContactEntity>();
            final localization = navigatorKey.localization;
            final navigator = navigatorKey.currentState;
            store.dispatch(
                SaveContactRequest(completer: completer, contact: contact));
            return completer.future.then((savedContact) {
              showToast(contact.isNew
                  ? localization.createdContact
                  : localization.updatedContact);
              if (state.prefState.isMobile) {
                store.dispatch(UpdateCurrentRoute(ContactViewScreen.route));
                if (contact.isNew &&
                    state.contactUIState.saveCompleter == null) {
                  navigator.pushReplacementNamed(ContactViewScreen.route);
                } else {
                  navigator.pop(savedContact);
                }
              } else {
                if (!state.prefState.isPreviewVisible) {
                  store.dispatch(TogglePreviewSidebar());
                }
                viewEntity(entity: savedContact, force: true);
              }
            }).catchError((Object error) {
              showDialog<ErrorDialog>(
                  context: navigatorKey.currentContext,
                  builder: (BuildContext context) {
                    return ErrorDialog(error);
                  });
            });
          });
        });
  }

  final bool isSaving;
  final ContactEntity origContact;
}
