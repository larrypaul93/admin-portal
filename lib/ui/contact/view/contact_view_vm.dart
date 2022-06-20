import 'dart:async';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_actions.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/ui/contact/view/contact_view.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';

class ContactViewScreen extends StatelessWidget {
  const ContactViewScreen({
    Key key,
    this.isFilter = false,
  }) : super(key: key);
  static const String route = '/contact/view';
  final bool isFilter;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContactViewVM>(
      converter: (Store<AppState> store) {
        return ContactViewVM.fromStore(store);
      },
      builder: (context, vm) {
        return ContactView(
          viewModel: vm,
          isFilter: isFilter,
        );
      },
    );
  }
}

class ContactViewVM {
  ContactViewVM({
    @required this.state,
    @required this.contact,
    @required this.company,
    @required this.onEntityAction,
    @required this.onRefreshed,
    @required this.isSaving,
    @required this.isLoading,
    @required this.isDirty,
  });

  factory ContactViewVM.fromStore(Store<AppState> store) {
    final state = store.state;
    final contact = state.contactState.map[state.contactUIState.selectedId] ??
        ContactEntity(id: state.contactUIState.selectedId);

    Future<Null> _handleRefresh(BuildContext context) {
      final completer = snackBarCompleter<Null>(
          context, AppLocalization.of(context).refreshComplete);
      store.dispatch(LoadContact(completer: completer, contactId: contact.id));
      return completer.future;
    }

    return ContactViewVM(
      state: state,
      company: state.company,
      isSaving: state.isSaving,
      isLoading: state.isLoading,
      isDirty: contact.isNew,
      contact: contact,
      onRefreshed: (context) => _handleRefresh(context),
      onEntityAction: (BuildContext context, EntityAction action) =>
          handleEntitiesActions([contact], action, autoPop: true),
    );
  }

  final AppState state;
  final ContactEntity contact;
  final CompanyEntity company;
  final Function(BuildContext, EntityAction) onEntityAction;
  final Function(BuildContext) onRefreshed;
  final bool isSaving;
  final bool isLoading;
  final bool isDirty;
}
