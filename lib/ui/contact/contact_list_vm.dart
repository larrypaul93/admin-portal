import 'dart:async';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/ui/app/entities/entity_actions_dialog.dart';
import 'package:invoiceninja_flutter/ui/app/tables/entity_list.dart';
import 'package:invoiceninja_flutter/ui/contact/contact_list_item.dart';
import 'package:invoiceninja_flutter/ui/contact/contact_presenter.dart';
import 'package:redux/redux.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_selectors.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_actions.dart';

class ContactListBuilder extends StatelessWidget {
  const ContactListBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContactListVM>(
      converter: ContactListVM.fromStore,
      builder: (context, viewModel) {
        return EntityList(
            entityType: EntityType.contact,
            presenter: ContactPresenter(),
            state: viewModel.state,
            entityList: viewModel.contactList,
            tableColumns: viewModel.tableColumns,
            onRefreshed: viewModel.onRefreshed,
            onSortColumn: viewModel.onSortColumn,
            onClearMultiselect: viewModel.onClearMultielsect,
            itemBuilder: (BuildContext context, index) {
              final state = viewModel.state;
              final contactId = viewModel.contactList[index];
              final contact = viewModel.contactMap[contactId];
              final listState = state.getListState(EntityType.contact);
              final isInMultiselect = listState.isInMultiselect();

              return ContactListItem(
                user: viewModel.state.user,
                filter: viewModel.filter,
                contact: contact,
                isChecked: isInMultiselect && listState.isSelected(contact.id),
              );
            });
      },
    );
  }
}

class ContactListVM {
  ContactListVM({
    @required this.state,
    @required this.userCompany,
    @required this.contactList,
    @required this.contactMap,
    @required this.filter,
    @required this.isLoading,
    @required this.listState,
    @required this.onRefreshed,
    @required this.onEntityAction,
    @required this.tableColumns,
    @required this.onSortColumn,
    @required this.onClearMultielsect,
  });

  static ContactListVM fromStore(Store<AppState> store) {
    Future<Null> _handleRefresh(BuildContext context) {
      if (store.state.isLoading) {
        return Future<Null>(null);
      }
      final completer = snackBarCompleter<Null>(
          context, AppLocalization.of(context).refreshComplete);
      store.dispatch(RefreshData(completer: completer));
      return completer.future;
    }

    final state = store.state;

    return ContactListVM(
      state: state,
      userCompany: state.userCompany,
      listState: state.contactListState,
      contactList: memoizedFilteredContactList(
        state.getUISelection(EntityType.contact),
        state.contactState.map,
        state.contactState.list,
        state.staticState,
        state.userState.map,
        state.contactListState,
      ),
      contactMap: state.contactState.map,
      isLoading: state.isLoading,
      filter: state.contactUIState.listUIState.filter,
      onEntityAction: (BuildContext context, List<BaseEntity> contacts,
              EntityAction action) =>
          handleContactAction(context, contacts, action),
      onRefreshed: (context) => _handleRefresh(context),
      tableColumns:
          state.userCompany.settings?.getTableColumns(EntityType.contact) ??
              ContactPresenter.getDefaultTableFields(state.userCompany),
      onSortColumn: (field) => store.dispatch(SortContacts(field)),
      onClearMultielsect: () => store.dispatch(ClearContactMultiselect()),
    );
  }

  final AppState state;
  final UserCompanyEntity userCompany;
  final List<String> contactList;
  final BuiltMap<String, ContactEntity> contactMap;
  final ListUIState listState;
  final String filter;
  final bool isLoading;
  final Function(BuildContext) onRefreshed;
  final Function(BuildContext, List<BaseEntity>, EntityAction) onEntityAction;
  final List<String> tableColumns;
  final Function(String) onSortColumn;
  final Function onClearMultielsect;
}
