import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:invoiceninja_flutter/ui/app/entities/entity_actions_dialog.dart';

class ViewCategoryList implements PersistUI {
  ViewCategoryList({this.force = false});

  final bool force;
}

class ViewCategory implements PersistUI, PersistPrefs {
  ViewCategory({
    @required this.categoryId,
    this.force = false,
  });

  final String categoryId;
  final bool force;
}

class EditCategory implements PersistUI, PersistPrefs {
  EditCategory(
      {@required this.category,
      this.completer,
      this.cancelCompleter,
      this.force = false});

  final CategoryEntity category;
  final Completer completer;
  final Completer cancelCompleter;
  final bool force;
}

class UpdateCategory implements PersistUI {
  UpdateCategory(this.category);

  final CategoryEntity category;
}

class LoadCategory {
  LoadCategory({this.completer, this.categoryId});

  final Completer completer;
  final String categoryId;
}

class LoadCategoryActivity {
  LoadCategoryActivity({this.completer, this.categoryId});

  final Completer completer;
  final String categoryId;
}

class LoadCategories {
  LoadCategories({this.completer});

  final Completer completer;
}

class LoadCategoryRequest implements StartLoading {}

class LoadCategoryFailure implements StopLoading {
  LoadCategoryFailure(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'LoadCategoryFailure{error: $error}';
  }
}

class LoadCategorySuccess implements StopLoading, PersistData {
  LoadCategorySuccess(this.category);

  final CategoryEntity category;

  @override
  String toString() {
    return 'LoadCategorySuccess{category: $category}';
  }
}

class LoadCategoriesRequest implements StartLoading {}

class LoadCategoriesFailure implements StopLoading {
  LoadCategoriesFailure(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'LoadCategoriesFailure{error: $error}';
  }
}

class LoadCategoriesSuccess implements StopLoading {
  LoadCategoriesSuccess(this.categories);

  final BuiltList<CategoryEntity> categories;

  @override
  String toString() {
    return 'LoadCategoriesSuccess{categories: $categories}';
  }
}

class SaveCategoryRequest implements StartSaving {
  SaveCategoryRequest({this.completer, this.category});

  final Completer completer;
  final CategoryEntity category;
}

class SaveCategorySuccess implements StopSaving, PersistData, PersistUI {
  SaveCategorySuccess(this.category);

  final CategoryEntity category;
}

class AddCategorySuccess implements StopSaving, PersistData, PersistUI {
  AddCategorySuccess(this.category);

  final CategoryEntity category;
}

class SaveCategoryFailure implements StopSaving {
  SaveCategoryFailure(this.error);

  final Object error;
}

class ArchiveCategoriesRequest implements StartSaving {
  ArchiveCategoriesRequest(this.completer, this.categoryIds);

  final Completer completer;
  final List<String> categoryIds;
}

class ArchiveCategoriesSuccess implements StopSaving, PersistData {
  ArchiveCategoriesSuccess(this.categories);

  final List<CategoryEntity> categories;
}

class ArchiveCategoriesFailure implements StopSaving {
  ArchiveCategoriesFailure(this.categories);

  final List<CategoryEntity> categories;
}

class DeleteCategoriesRequest implements StartSaving {
  DeleteCategoriesRequest(this.completer, this.categoryIds);

  final Completer completer;
  final List<String> categoryIds;
}

class DeleteCategoriesSuccess implements StopSaving, PersistData {
  DeleteCategoriesSuccess(this.categories);

  final List<CategoryEntity> categories;
}

class DeleteCategoriesFailure implements StopSaving {
  DeleteCategoriesFailure(this.categories);

  final List<CategoryEntity> categories;
}

class RestoreCategoriesRequest implements StartSaving {
  RestoreCategoriesRequest(this.completer, this.categoryIds);

  final Completer completer;
  final List<String> categoryIds;
}

class RestoreCategoriesSuccess implements StopSaving, PersistData {
  RestoreCategoriesSuccess(this.categories);

  final List<CategoryEntity> categories;
}

class RestoreCategoriesFailure implements StopSaving {
  RestoreCategoriesFailure(this.categories);

  final List<CategoryEntity> categories;
}

class FilterCategories implements PersistUI {
  FilterCategories(this.filter);

  final String filter;
}

class SortCategories implements PersistUI, PersistPrefs {
  SortCategories(this.field);

  final String field;
}

class FilterCategoriesByState implements PersistUI {
  FilterCategoriesByState(this.state);

  final EntityState state;
}

class FilterCategoriesByCustom1 implements PersistUI {
  FilterCategoriesByCustom1(this.value);

  final String value;
}

class FilterCategoriesByCustom2 implements PersistUI {
  FilterCategoriesByCustom2(this.value);

  final String value;
}

class FilterCategoriesByCustom3 implements PersistUI {
  FilterCategoriesByCustom3(this.value);

  final String value;
}

class FilterCategoriesByCustom4 implements PersistUI {
  FilterCategoriesByCustom4(this.value);

  final String value;
}

class StartCategoryMultiselect {
  StartCategoryMultiselect();
}

class AddToCategoryMultiselect {
  AddToCategoryMultiselect({@required this.entity});

  final BaseEntity entity;
}

class RemoveFromCategoryMultiselect {
  RemoveFromCategoryMultiselect({@required this.entity});

  final BaseEntity entity;
}

class ClearCategoryMultiselect {
  ClearCategoryMultiselect();
}

class UpdateCategoryTab implements PersistUI {
  UpdateCategoryTab({this.tabIndex});

  final int tabIndex;
}

void handleCategoryAction(
    BuildContext context, List<BaseEntity> categories, EntityAction action) {
  if (categories.isEmpty) {
    return;
  }

  final store = StoreProvider.of<AppState>(context);
  final state = store.state;
  final localization = AppLocalization.of(context);
  final category = categories.first as CategoryEntity;
  final categoryIds = categories.map((category) => category.id).toList();

  switch (action) {
    case EntityAction.edit:
      editEntity(/* context: context, */ entity: category);
      break;
    case EntityAction.restore:
      store.dispatch(RestoreCategoriesRequest(
          snackBarCompleter<Null>(context, localization.restoredCategory),
          categoryIds));
      break;
    case EntityAction.archive:
      store.dispatch(ArchiveCategoriesRequest(
          snackBarCompleter<Null>(context, localization.archivedCategory),
          categoryIds));
      break;
    case EntityAction.delete:
      store.dispatch(DeleteCategoriesRequest(
          snackBarCompleter<Null>(context, localization.deletedCategory),
          categoryIds));
      break;
    case EntityAction.toggleMultiselect:
      if (!store.state.categoryListState.isInMultiselect()) {
        store.dispatch(StartCategoryMultiselect());
      }

      if (categories.isEmpty) {
        break;
      }

      for (final category in categories) {
        if (!store.state.categoryListState.isSelected(category.id)) {
          store.dispatch(AddToCategoryMultiselect(entity: category));
        } else {
          store.dispatch(RemoveFromCategoryMultiselect(entity: category));
        }
      }
      break;
    case EntityAction.more:
      showEntityActionsDialog(
        entities: [category],
      );
      break;
    default:
      print('## ERROR: unhandled action $action in category_actions');
      break;
  }
}
