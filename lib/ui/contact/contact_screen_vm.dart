import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_actions.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_selectors.dart';
import 'package:redux/redux.dart';

import 'contact_screen.dart';

class ContactScreenBuilder extends StatelessWidget {
  const ContactScreenBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContactScreenVM>(
      converter: ContactScreenVM.fromStore,
      builder: (context, vm) {
        return ContactScreen(
          viewModel: vm,
        );
      },
    );
  }
}

class ContactScreenVM {
  ContactScreenVM({
    @required this.isInMultiselect,
    @required this.contactList,
    @required this.userCompany,
    @required this.onEntityAction,
    @required this.contactMap,
  });

  final bool isInMultiselect;
  final UserCompanyEntity userCompany;
  final List<String> contactList;
  final Function(BuildContext, List<BaseEntity>, EntityAction) onEntityAction;
  final BuiltMap<String, ContactEntity> contactMap;

  static ContactScreenVM fromStore(Store<AppState> store) {
    final state = store.state;
    return ContactScreenVM(
      contactMap: state.contactState.map,
      contactList: memoizedFilteredContactList(
        state.getUISelection(EntityType.contact),
        state.contactState.map,
        state.contactState.list,
        state.staticState,
        state.userState.map,
        state.contactListState,
      ),
      userCompany: state.userCompany,
      isInMultiselect: state.contactListState.isInMultiselect(),
      onEntityAction: (BuildContext context, List<BaseEntity> contacts,
              EntityAction action) =>
          handleContactAction(context, contacts, action),
    );
  }
}
