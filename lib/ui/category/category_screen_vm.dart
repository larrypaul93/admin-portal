import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/category/category_actions.dart';
import 'package:invoiceninja_flutter/redux/category/category_selectors.dart';
import 'package:redux/redux.dart';

import 'category_screen.dart';

class CategoryScreenBuilder extends StatelessWidget {
  const CategoryScreenBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoryScreenVM>(
      converter: CategoryScreenVM.fromStore,
      builder: (context, vm) {
        return CategoryScreen(
          viewModel: vm,
        );
      },
    );
  }
}

class CategoryScreenVM {
  CategoryScreenVM({
    @required this.isInMultiselect,
    @required this.categoryList,
    @required this.userCompany,
    @required this.onEntityAction,
    @required this.categoryMap,
  });

  final bool isInMultiselect;
  final UserCompanyEntity userCompany;
  final List<String> categoryList;
  final Function(BuildContext, List<BaseEntity>, EntityAction) onEntityAction;
  final BuiltMap<String, CategoryEntity> categoryMap;

  static CategoryScreenVM fromStore(Store<AppState> store) {
    final state = store.state;

    return CategoryScreenVM(
      categoryMap: state.categoryState.map,
      categoryList: memoizedFilteredCategoryList(
        state.getUISelection(EntityType.category),
        state.categoryState.map,
        state.categoryState.list,
        state.staticState,
        state.userState.map,
        state.categoryListState,
      ),
      userCompany: state.userCompany,
      isInMultiselect: state.categoryListState.isInMultiselect(),
      onEntityAction: (BuildContext context, List<BaseEntity> categories,
              EntityAction action) =>
          handleCategoryAction(context, categories, action),
    );
  }
}
