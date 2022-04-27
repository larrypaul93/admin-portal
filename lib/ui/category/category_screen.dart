import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/category/category_actions.dart';
import 'package:invoiceninja_flutter/ui/app/app_bottom_bar.dart';
import 'package:invoiceninja_flutter/ui/app/list_scaffold.dart';
import 'package:invoiceninja_flutter/ui/app/list_filter.dart';
import 'package:invoiceninja_flutter/ui/category/category_list_vm.dart';
import 'package:invoiceninja_flutter/ui/category/category_presenter.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

import 'category_screen_vm.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  static const String route = '/category';

  final CategoryScreenVM viewModel;

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final state = store.state;
    final company = state.company;
    final userCompany = state.userCompany;
    final localization = AppLocalization.of(context);

    return ListScaffold(
      entityType: EntityType.category,
      onHamburgerLongPress: () => store.dispatch(StartCategoryMultiselect()),
      appBarTitle: ListFilter(
        key: ValueKey('__filter_${state.categoryListState.filterClearedAt}__'),
        entityType: EntityType.category,
        entityIds: viewModel.categoryList,
        filter: state.categoryListState.filter,
        onFilterChanged: (value) {
          store.dispatch(FilterCategories(value));
        },
        onSelectedState: (EntityState state, value) {
          store.dispatch(FilterCategoriesByState(state));
        },
      ),
      onCheckboxPressed: () {
        if (store.state.categoryListState.isInMultiselect()) {
          store.dispatch(ClearCategoryMultiselect());
        } else {
          store.dispatch(StartCategoryMultiselect());
        }
      },
      body: CategoryListBuilder(),
      bottomNavigationBar: AppBottomBar(
        entityType: EntityType.category,
        tableColumns: CategoryPresenter.getAllTableFields(userCompany),
        defaultTableColumns:
            CategoryPresenter.getDefaultTableFields(userCompany),
        onSelectedSortField: (value) {
          store.dispatch(SortCategories(value));
        },
        sortFields: [
          CategoryFields.name,
          CategoryFields.updatedAt,
        ],
        onSelectedState: (EntityState state, value) {
          store.dispatch(FilterCategoriesByState(state));
        },
        onCheckboxPressed: () {
          if (store.state.categoryListState.isInMultiselect()) {
            store.dispatch(ClearCategoryMultiselect());
          } else {
            store.dispatch(StartCategoryMultiselect());
          }
        },
      ),
      floatingActionButton: state.prefState.isMenuFloated &&
              userCompany.canCreate(EntityType.category)
          ? FloatingActionButton(
              heroTag: 'category_fab',
              backgroundColor: Theme.of(context).primaryColorDark,
              onPressed: () {
                createEntityByType(
                    context: context, entityType: EntityType.category);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              tooltip: localization.newCategory,
            )
          : null,
    );
  }
}
