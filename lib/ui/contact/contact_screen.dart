import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/contact/contact_actions.dart';
import 'package:invoiceninja_flutter/ui/app/app_bottom_bar.dart';
import 'package:invoiceninja_flutter/ui/app/list_scaffold.dart';
import 'package:invoiceninja_flutter/ui/app/list_filter.dart';
import 'package:invoiceninja_flutter/ui/contact/contact_list_vm.dart';
import 'package:invoiceninja_flutter/ui/contact/contact_presenter.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

import 'contact_screen_vm.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  static const String route = '/contact';

  final ContactScreenVM viewModel;

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final state = store.state;
    final company = state.company;
    final userCompany = state.userCompany;
    final localization = AppLocalization.of(context);

    return ListScaffold(
      entityType: EntityType.contact,
      onHamburgerLongPress: () => store.dispatch(StartContactMultiselect()),
      appBarTitle: ListFilter(
        key: ValueKey('__filter_${state.contactListState.filterClearedAt}__'),
        entityType: EntityType.contact,
        entityIds: viewModel.contactList,
        filter: state.contactListState.filter,
        onFilterChanged: (value) {
          store.dispatch(FilterContacts(value));
        },
        onSelectedState: (EntityState state, value) {
          store.dispatch(FilterContactsByState(state));
        },
      ),
      onCheckboxPressed: () {
        if (store.state.contactListState.isInMultiselect()) {
          store.dispatch(ClearContactMultiselect());
        } else {
          store.dispatch(StartContactMultiselect());
        }
      },
      body: ContactListBuilder(),
      bottomNavigationBar: AppBottomBar(
        entityType: EntityType.contact,
        tableColumns: ContactPresenter.getAllTableFields(userCompany),
        defaultTableColumns:
            ContactPresenter.getDefaultTableFields(userCompany),
        onSelectedSortField: (value) {
          store.dispatch(SortContacts(value));
        },
        sortFields: [
          ContactFields.fullName,
          // ContactFields.balance,
          ContactFields.phone,
        ],
        onSelectedState: (EntityState state, value) {
          store.dispatch(FilterContactsByState(state));
        },
        onCheckboxPressed: () {
          if (store.state.contactListState.isInMultiselect()) {
            store.dispatch(ClearContactMultiselect());
          } else {
            store.dispatch(StartContactMultiselect());
          }
        },
        customValues1: company.getCustomFieldValues(CustomFieldType.contact1,
            excludeBlank: true),
        customValues2: company.getCustomFieldValues(CustomFieldType.contact2,
            excludeBlank: true),
        customValues3: company.getCustomFieldValues(CustomFieldType.contact3,
            excludeBlank: true),
        customValues4: company.getCustomFieldValues(CustomFieldType.contact4,
            excludeBlank: true),
        onSelectedCustom1: (value) =>
            store.dispatch(FilterContactsByCustom1(value)),
        onSelectedCustom2: (value) =>
            store.dispatch(FilterContactsByCustom2(value)),
        onSelectedCustom3: (value) =>
            store.dispatch(FilterContactsByCustom3(value)),
        onSelectedCustom4: (value) =>
            store.dispatch(FilterContactsByCustom4(value)),
      ),
      floatingActionButton: state.prefState.isMenuFloated &&
              userCompany.canCreate(EntityType.contact)
          ? FloatingActionButton(
              heroTag: 'contact_fab',
              backgroundColor: Theme.of(context).primaryColorDark,
              onPressed: () {
                createEntityByType(
                    context: context, entityType: EntityType.contact);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              tooltip: localization.newContact,
            )
          : null,
    );
  }
}
