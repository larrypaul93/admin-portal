import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/company/company_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/entity_ui_state.dart';
import 'package:invoiceninja_flutter/redux/category/category_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';
import 'package:invoiceninja_flutter/redux/category/category_state.dart';
import 'package:invoiceninja_flutter/data/models/entities.dart';

EntityUIState categoryUIReducer(CategoryUIState state, dynamic action) {
  return state.rebuild((b) => b
    ..listUIState.replace(categoryListReducer(state.listUIState, action))
    ..editing.replace(editingReducer(state.editing, action))
    ..selectedId = selectedIdReducer(state.selectedId, action)
    ..forceSelected = forceSelectedReducer(state.forceSelected, action)
    ..tabIndex = tabIndexReducer(state.tabIndex, action));
}

final forceSelectedReducer = combineReducers<bool>([
  TypedReducer<bool, ViewCategory>((completer, action) => true),
  TypedReducer<bool, ViewCategoryList>((completer, action) => false),
  TypedReducer<bool, FilterCategoriesByState>((completer, action) => false),
  TypedReducer<bool, FilterCategories>((completer, action) => false),
  TypedReducer<bool, FilterCategoriesByCustom1>((completer, action) => false),
  TypedReducer<bool, FilterCategoriesByCustom2>((completer, action) => false),
  TypedReducer<bool, FilterCategoriesByCustom3>((completer, action) => false),
  TypedReducer<bool, FilterCategoriesByCustom4>((completer, action) => false),
]);

final tabIndexReducer = combineReducers<int>([
  TypedReducer<int, UpdateCategoryTab>((completer, action) {
    return action.tabIndex;
  }),
  TypedReducer<int, PreviewEntity>((completer, action) {
    return 0;
  }),
]);

Reducer<String> selectedIdReducer = combineReducers([
  TypedReducer<String, ArchiveCategoriesSuccess>((completer, action) => ''),
  TypedReducer<String, DeleteCategoriesSuccess>((completer, action) => ''),
  TypedReducer<String, PreviewEntity>((selectedId, action) =>
      action.entityType == EntityType.category ? action.entityId : selectedId),
  TypedReducer<String, ViewCategory>(
      (String selectedId, dynamic action) => action.categoryId),
  TypedReducer<String, AddCategorySuccess>(
      (String selectedId, dynamic action) => action.category.id),
  TypedReducer<String, SelectCompany>(
      (selectedId, action) => action.clearSelection ? '' : selectedId),
  TypedReducer<String, ClearEntityFilter>((selectedId, action) => ''),
  TypedReducer<String, SortCategories>((selectedId, action) => ''),
  TypedReducer<String, FilterCategories>((selectedId, action) => ''),
  TypedReducer<String, FilterCategoriesByState>((selectedId, action) => ''),
  TypedReducer<String, FilterCategoriesByCustom1>((selectedId, action) => ''),
  TypedReducer<String, FilterCategoriesByCustom2>((selectedId, action) => ''),
  TypedReducer<String, FilterCategoriesByCustom3>((selectedId, action) => ''),
  TypedReducer<String, FilterCategoriesByCustom4>((selectedId, action) => ''),
  TypedReducer<String, FilterByEntity>(
      (selectedId, action) => action.clearSelection
          ? ''
          : action.entityType == EntityType.category
              ? action.entityId
              : selectedId),
]);

final editingReducer = combineReducers<CategoryEntity>([
  TypedReducer<CategoryEntity, SaveCategorySuccess>(_updateEditing),
  TypedReducer<CategoryEntity, AddCategorySuccess>(_updateEditing),
  TypedReducer<CategoryEntity, RestoreCategoriesSuccess>((categories, action) {
    return action.categories[0];
  }),
  TypedReducer<CategoryEntity, ArchiveCategoriesSuccess>((categories, action) {
    return action.categories[0];
  }),
  TypedReducer<CategoryEntity, DeleteCategoriesSuccess>((categories, action) {
    return action.categories[0];
  }),
  TypedReducer<CategoryEntity, EditCategory>(_updateEditing),
  TypedReducer<CategoryEntity, UpdateCategory>((category, action) {
    return action.category.rebuild((b) => b..isChanged = true);
  }),
  TypedReducer<CategoryEntity, DiscardChanges>(_clearEditing),
]);

CategoryEntity _clearEditing(CategoryEntity category, dynamic action) {
  return CategoryEntity();
}

CategoryEntity _updateEditing(CategoryEntity category, dynamic action) {
  return action.category;
}

final categoryListReducer = combineReducers<ListUIState>([
  TypedReducer<ListUIState, SortCategories>(_sortCategories),
  TypedReducer<ListUIState, FilterCategoriesByState>(_filterCategoriesByState),
  TypedReducer<ListUIState, FilterCategories>(_filterCategories),
  TypedReducer<ListUIState, FilterCategoriesByCustom1>(
      _filterCategoriesByCustom1),
  TypedReducer<ListUIState, FilterCategoriesByCustom2>(
      _filterCategoriesByCustom2),
  TypedReducer<ListUIState, StartCategoryMultiselect>(_startListMultiselect),
  TypedReducer<ListUIState, AddToCategoryMultiselect>(_addToListMultiselect),
  TypedReducer<ListUIState, RemoveFromCategoryMultiselect>(
      _removeFromListMultiselect),
  TypedReducer<ListUIState, ClearCategoryMultiselect>(_clearListMultiselect),
  TypedReducer<ListUIState, ViewCategoryList>(_viewCategoryList),
]);

ListUIState _viewCategoryList(
    ListUIState categoryListState, ViewCategoryList action) {
  return categoryListState.rebuild((b) => b
    ..selectedIds = null
    ..filter = null
    ..filterClearedAt = DateTime.now().millisecondsSinceEpoch);
}

ListUIState _filterCategoriesByCustom1(
    ListUIState categoryListState, FilterCategoriesByCustom1 action) {
  if (categoryListState.custom1Filters.contains(action.value)) {
    return categoryListState
        .rebuild((b) => b..custom1Filters.remove(action.value));
  } else {
    return categoryListState
        .rebuild((b) => b..custom1Filters.add(action.value));
  }
}

ListUIState _filterCategoriesByCustom2(
    ListUIState categoryListState, FilterCategoriesByCustom2 action) {
  if (categoryListState.custom2Filters.contains(action.value)) {
    return categoryListState
        .rebuild((b) => b..custom2Filters.remove(action.value));
  } else {
    return categoryListState
        .rebuild((b) => b..custom2Filters.add(action.value));
  }
}

ListUIState _filterCategoriesByState(
    ListUIState categoryListState, FilterCategoriesByState action) {
  if (categoryListState.stateFilters.contains(action.state)) {
    return categoryListState
        .rebuild((b) => b..stateFilters.remove(action.state));
  } else {
    return categoryListState.rebuild((b) => b..stateFilters.add(action.state));
  }
}

ListUIState _filterCategories(
    ListUIState categoryListState, FilterCategories action) {
  return categoryListState.rebuild((b) => b
    ..filter = action.filter
    ..filterClearedAt = action.filter == null
        ? DateTime.now().millisecondsSinceEpoch
        : categoryListState.filterClearedAt);
}

ListUIState _sortCategories(
    ListUIState categoryListState, SortCategories action) {
  return categoryListState.rebuild((b) => b
    ..sortAscending = b.sortField != action.field || !b.sortAscending
    ..sortField = action.field);
}

ListUIState _startListMultiselect(
    ListUIState productListState, StartCategoryMultiselect action) {
  return productListState.rebuild((b) => b..selectedIds = ListBuilder());
}

ListUIState _addToListMultiselect(
    ListUIState productListState, AddToCategoryMultiselect action) {
  return productListState.rebuild((b) => b..selectedIds.add(action.entity.id));
}

ListUIState _removeFromListMultiselect(
    ListUIState productListState, RemoveFromCategoryMultiselect action) {
  return productListState
      .rebuild((b) => b..selectedIds.remove(action.entity.id));
}

ListUIState _clearListMultiselect(
    ListUIState productListState, ClearCategoryMultiselect action) {
  return productListState.rebuild((b) => b..selectedIds = null);
}

final categoriesReducer = combineReducers<CategoryState>([
  TypedReducer<CategoryState, SaveCategorySuccess>(_updateCategory),
  TypedReducer<CategoryState, AddCategorySuccess>(_addCategory),
  TypedReducer<CategoryState, LoadCategoriesSuccess>(_setLoadedCategories),
  TypedReducer<CategoryState, LoadCategorySuccess>(_setLoadedCategory),
  TypedReducer<CategoryState, LoadCompanySuccess>(_setLoadedCompany),
  TypedReducer<CategoryState, ArchiveCategoriesSuccess>(
      _archiveCategorySuccess),
  TypedReducer<CategoryState, DeleteCategoriesSuccess>(_deleteCategorySuccess),
  TypedReducer<CategoryState, RestoreCategoriesSuccess>(
      _restoreCategorySuccess),
]);

CategoryState _archiveCategorySuccess(
    CategoryState categoryState, ArchiveCategoriesSuccess action) {
  return categoryState.rebuild((b) {
    for (final category in action.categories) {
      b.map[category.id] = category;
    }
  });
}

CategoryState _deleteCategorySuccess(
    CategoryState categoryState, DeleteCategoriesSuccess action) {
  return categoryState.rebuild((b) {
    for (final category in action.categories) {
      b.map[category.id] = category;
    }
  });
}

CategoryState _restoreCategorySuccess(
    CategoryState categoryState, RestoreCategoriesSuccess action) {
  return categoryState.rebuild((b) {
    for (final category in action.categories) {
      b.map[category.id] = category;
    }
  });
}

CategoryState _addCategory(
    CategoryState categoryState, AddCategorySuccess action) {
  return categoryState.rebuild((b) => b
    ..map[action.category.id] = action.category
    ..list.add(action.category.id));
}

CategoryState _updateCategory(
    CategoryState categoryState, SaveCategorySuccess action) {
  return categoryState
      .rebuild((b) => b..map[action.category.id] = action.category);
}

CategoryState _setLoadedCategory(
    CategoryState categoryState, LoadCategorySuccess action) {
  return categoryState
      .rebuild((b) => b..map[action.category.id] = action.category);
}

CategoryState _setLoadedCategories(
        CategoryState categoryState, LoadCategoriesSuccess action) =>
    categoryState.loadCategories(action.categories);

CategoryState _setLoadedCompany(
    CategoryState categoryState, LoadCompanySuccess action) {
  final company = action.userCompany.company;
  return categoryState.loadCategories(company.categories);
}
