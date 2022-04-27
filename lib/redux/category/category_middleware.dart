import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:redux/redux.dart';
import 'package:invoiceninja_flutter/main_app.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/utils/platforms.dart';
import 'package:invoiceninja_flutter/redux/app/app_middleware.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/ui/ui_actions.dart';
import 'package:invoiceninja_flutter/ui/category/category_screen.dart';
import 'package:invoiceninja_flutter/ui/category/edit/category_edit_vm.dart';
import 'package:invoiceninja_flutter/ui/category/view/category_view_vm.dart';
import 'package:invoiceninja_flutter/redux/category/category_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/data/repositories/category_repository.dart';

List<Middleware<AppState>> createStoreCategoriesMiddleware([
  CategoryRepository repository = const CategoryRepository(),
]) {
  final viewCategoryList = _viewCategoryList();
  final viewCategory = _viewCategory();
  final editCategory = _editCategory();
  final loadCategories = _loadCategories(repository);
  final loadCategory = _loadCategory(repository);
  final saveCategory = _saveCategory(repository);
  final archiveCategory = _archiveCategory(repository);
  final deleteCategory = _deleteCategory(repository);
  final restoreCategory = _restoreCategory(repository);

  return [
    TypedMiddleware<AppState, ViewCategoryList>(viewCategoryList),
    TypedMiddleware<AppState, ViewCategory>(viewCategory),
    TypedMiddleware<AppState, EditCategory>(editCategory),
    TypedMiddleware<AppState, LoadCategories>(loadCategories),
    TypedMiddleware<AppState, LoadCategory>(loadCategory),
    TypedMiddleware<AppState, SaveCategoryRequest>(saveCategory),
    TypedMiddleware<AppState, ArchiveCategoriesRequest>(archiveCategory),
    TypedMiddleware<AppState, DeleteCategoriesRequest>(deleteCategory),
    TypedMiddleware<AppState, RestoreCategoriesRequest>(restoreCategory),
  ];
}

Middleware<AppState> _editCategory() {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as EditCategory;

    next(action);

    store.dispatch(UpdateCurrentRoute(CategoryEditScreen.route));

    if (store.state.prefState.isMobile) {
      navigatorKey.currentState.pushNamed(CategoryEditScreen.route);
    }
  };
}

Middleware<AppState> _viewCategory() {
  return (Store<AppState> store, dynamic dynamicAction,
      NextDispatcher next) async {
    final action = dynamicAction as ViewCategory;

    next(action);

    store.dispatch(UpdateCurrentRoute(CategoryViewScreen.route));

    if (store.state.prefState.isMobile) {
      navigatorKey.currentState.pushNamed(CategoryViewScreen.route);
    }
  };
}

Middleware<AppState> _viewCategoryList() {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as ViewCategoryList;

    next(action);

    if (store.state.staticState.isStale) {
      store.dispatch(RefreshData());
    }

    store.dispatch(UpdateCurrentRoute(CategoryScreen.route));

    if (store.state.prefState.isMobile) {
      navigatorKey.currentState.pushNamedAndRemoveUntil(
          CategoryScreen.route, (Route<dynamic> route) => false);
    }
  };
}

Middleware<AppState> _archiveCategory(CategoryRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as ArchiveCategoriesRequest;
    final prevCategories = action.categoryIds
        .map((id) => store.state.categoryState.map[id])
        .toList();
    repository
        .bulkAction(
            store.state.credentials, action.categoryIds, EntityAction.archive)
        .then((List<CategoryEntity> categories) {
      store.dispatch(ArchiveCategoriesSuccess(categories));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((Object error) {
      print(error);
      store.dispatch(ArchiveCategoriesFailure(prevCategories));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}

Middleware<AppState> _deleteCategory(CategoryRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as DeleteCategoriesRequest;
    final prevCategories = action.categoryIds
        .map((id) => store.state.categoryState.map[id])
        .toList();
    repository
        .bulkAction(
            store.state.credentials, action.categoryIds, EntityAction.delete)
        .then((List<CategoryEntity> categories) {
      store.dispatch(DeleteCategoriesSuccess(categories));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((Object error) {
      print(error);
      store.dispatch(DeleteCategoriesFailure(prevCategories));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}

Middleware<AppState> _restoreCategory(CategoryRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as RestoreCategoriesRequest;
    final prevCategories = action.categoryIds
        .map((id) => store.state.categoryState.map[id])
        .toList();
    repository
        .bulkAction(
            store.state.credentials, action.categoryIds, EntityAction.restore)
        .then((List<CategoryEntity> categories) {
      store.dispatch(RestoreCategoriesSuccess(categories));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((Object error) {
      print(error);
      store.dispatch(RestoreCategoriesFailure(prevCategories));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}

Middleware<AppState> _saveCategory(CategoryRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as SaveCategoryRequest;
    repository
        .saveData(store.state.credentials, action.category)
        .then((CategoryEntity category) {
      if (action.category.isNew) {
        store.dispatch(AddCategorySuccess(category));
      } else {
        store.dispatch(SaveCategorySuccess(category));
      }

      action.completer.complete(category);
    }).catchError((Object error) {
      print(error);
      store.dispatch(SaveCategoryFailure(error));
      action.completer.completeError(error);
    });

    next(action);
  };
}

Middleware<AppState> _loadCategory(CategoryRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as LoadCategory;
    final AppState state = store.state;

    store.dispatch(LoadCategoryRequest());
    repository.loadItem(state.credentials, action.categoryId).then((category) {
      store.dispatch(LoadCategorySuccess(category));

      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((Object error) {
      print(error);
      store.dispatch(LoadCategoryFailure(error));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}

Middleware<AppState> _loadCategories(CategoryRepository repository) {
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
    final action = dynamicAction as LoadCategories;
    final AppState state = store.state;

    store.dispatch(LoadCategoriesRequest());
    repository.loadList(state.credentials).then((data) {
      store.dispatch(LoadCategoriesSuccess(data));

      if (action.completer != null) {
        action.completer.complete(null);
      }
      /*
      if (state.productState.isStale) {
        store.dispatch(LoadProducts());
      }
      */
    }).catchError((Object error) {
      print(error);
      store.dispatch(LoadCategoriesFailure(error));
      if (action.completer != null) {
        action.completer.completeError(error);
      }
    });

    next(action);
  };
}
