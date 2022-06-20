import 'dart:async';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/redux/category/category_actions.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/ui/category/view/category_view.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';

class CategoryViewScreen extends StatelessWidget {
  const CategoryViewScreen({
    Key key,
    this.isFilter = false,
  }) : super(key: key);
  static const String route = '/category/view';
  final bool isFilter;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoryViewVM>(
      converter: (Store<AppState> store) {
        return CategoryViewVM.fromStore(store);
      },
      builder: (context, vm) {
        return CategoryView(
          viewModel: vm,
          isFilter: isFilter,
        );
      },
    );
  }
}

class CategoryViewVM {
  CategoryViewVM({
    @required this.state,
    @required this.category,
    @required this.company,
    @required this.onEntityAction,
    @required this.onRefreshed,
    @required this.isSaving,
    @required this.isLoading,
    @required this.isDirty,
  });

  factory CategoryViewVM.fromStore(Store<AppState> store) {
    final state = store.state;
    final category =
        state.categoryState.map[state.categoryUIState.selectedId] ??
            CategoryEntity(id: state.categoryUIState.selectedId);

    Future<Null> _handleRefresh(BuildContext context) {
      final completer = snackBarCompleter<Null>(
          context, AppLocalization.of(context).refreshComplete);
      store.dispatch(
          LoadCategory(completer: completer, categoryId: category.id));
      return completer.future;
    }

    return CategoryViewVM(
      state: state,
      company: state.company,
      isSaving: state.isSaving,
      isLoading: state.isLoading,
      isDirty: category.isNew,
      category: category,
      onRefreshed: (context) => _handleRefresh(context),
      onEntityAction: (BuildContext context, EntityAction action) =>
          handleEntitiesActions([category], action, autoPop: true),
    );
  }

  final AppState state;
  final CategoryEntity category;
  final CompanyEntity company;
  final Function(BuildContext, EntityAction) onEntityAction;
  final Function(BuildContext) onRefreshed;
  final bool isSaving;
  final bool isLoading;
  final bool isDirty;
}
