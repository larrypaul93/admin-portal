import 'dart:async';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/ui/app/entities/entity_actions_dialog.dart';
import 'package:invoiceninja_flutter/ui/app/tables/entity_list.dart';
import 'package:invoiceninja_flutter/ui/category/category_list_item.dart';
import 'package:invoiceninja_flutter/ui/category/category_presenter.dart';
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
import 'package:invoiceninja_flutter/redux/category/category_selectors.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/category/category_actions.dart';

class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoryListVM>(
      converter: CategoryListVM.fromStore,
      builder: (context, viewModel) {
        return EntityList(
            entityType: EntityType.category,
            presenter: CategoryPresenter(),
            state: viewModel.state,
            entityList: viewModel.categoryList,
            tableColumns: viewModel.tableColumns,
            onRefreshed: viewModel.onRefreshed,
            onSortColumn: viewModel.onSortColumn,
            onClearMultiselect: viewModel.onClearMultielsect,
            itemBuilder: (BuildContext context, index) {
              final state = viewModel.state;
              final categoryId = viewModel.categoryList[index];
              final category = viewModel.categoryMap[categoryId];
              final listState = state.getListState(EntityType.category);
              final isInMultiselect = listState.isInMultiselect();

              return CategoryListItem(
                user: viewModel.state.user,
                filter: viewModel.filter,
                category: category,
                isChecked: isInMultiselect && listState.isSelected(category.id),
              );
            });
      },
    );
  }
}

class CategoryListVM {
  CategoryListVM({
    @required this.state,
    @required this.userCompany,
    @required this.categoryList,
    @required this.categoryMap,
    @required this.filter,
    @required this.isLoading,
    @required this.listState,
    @required this.onRefreshed,
    @required this.onEntityAction,
    @required this.tableColumns,
    @required this.onSortColumn,
    @required this.onClearMultielsect,
  });

  static CategoryListVM fromStore(Store<AppState> store) {
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

    return CategoryListVM(
      state: state,
      userCompany: state.userCompany,
      listState: state.categoryListState,
      categoryList: memoizedFilteredCategoryList(
          state.getUISelection(EntityType.category),
          state.categoryState.map,
          state.categoryState.list,
          state.staticState,
          state.userState.map,
          state.categoryListState),
      categoryMap: state.categoryState.map,
      isLoading: state.isLoading,
      filter: state.categoryUIState.listUIState.filter,
      onEntityAction: (BuildContext context, List<BaseEntity> categories,
              EntityAction action) =>
          handleCategoryAction(context, categories, action),
      onRefreshed: (context) => _handleRefresh(context),
      tableColumns:
          state.userCompany.settings?.getTableColumns(EntityType.category) ??
              CategoryPresenter.getDefaultTableFields(state.userCompany),
      onSortColumn: (field) => store.dispatch(SortCategories(field)),
      onClearMultielsect: () => store.dispatch(ClearCategoryMultiselect()),
    );
  }

  final AppState state;
  final UserCompanyEntity userCompany;
  final List<String> categoryList;
  final BuiltMap<String, CategoryEntity> categoryMap;
  final ListUIState listState;
  final String filter;
  final bool isLoading;
  final Function(BuildContext) onRefreshed;
  final Function(BuildContext, List<BaseEntity>, EntityAction) onEntityAction;
  final List<String> tableColumns;
  final Function(String) onSortColumn;
  final Function onClearMultielsect;
}
