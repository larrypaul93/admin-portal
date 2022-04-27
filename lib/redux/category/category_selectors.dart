import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/redux/static/static_state.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:memoize/memoize.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';

var memoizedDropdownCategoryList = memo5(
    (BuiltMap<String, CategoryEntity> categoryMap,
            BuiltList<String> categoryList,
            StaticState staticState,
            BuiltMap<String, UserEntity> userMap,
            String categoryId) =>
        dropdownCategoriesSelector(
            categoryMap, categoryList, staticState, userMap, categoryId));
var memoizedDropdownSubCategoryList = memo5(
    (BuiltMap<String, CategoryEntity> categoryMap,
            BuiltList<String> categoryList,
            StaticState staticState,
            BuiltMap<String, UserEntity> userMap,
            String mainCategoryId) =>
        dropdownSubCategoriesSelector(
            categoryMap, categoryList, staticState, userMap, mainCategoryId));

List<String> dropdownCategoriesSelector(
    BuiltMap<String, CategoryEntity> categoryMap,
    BuiltList<String> categoryList,
    StaticState staticState,
    BuiltMap<String, UserEntity> userMap,
    String categoryId) {
  final list = categoryList.where((catId) {
    final category = categoryMap[catId];
    /*
    if (clientId != null && clientId > 0 && category.clientId != clientId) {
      return false;
    }
    */

    return category.isActive &&
        category.categoryId.isEmpty &&
        categoryId != category.id;
    // category.categoryId.isEmpty &&
    // categoryId != category.categoryId;
  }).toList();

  list.sort((categoryAId, categoryBId) {
    final categoryA = categoryMap[categoryAId];
    final categoryB = categoryMap[categoryBId];
    return categoryA.compareTo(categoryB, CategoryFields.name, true);
  });

  return list;
}

List<String> dropdownSubCategoriesSelector(
    BuiltMap<String, CategoryEntity> categoryMap,
    BuiltList<String> categoryList,
    StaticState staticState,
    BuiltMap<String, UserEntity> userMap,
    String mainCategoryId) {
  final list = categoryList.where((categoryId) {
    final category = categoryMap[categoryId];
    /*
    if (clientId != null && clientId > 0 && category.clientId != clientId) {
      return false;
    }
    */

    return category.isActive &&
        category.categoryId.isNotEmpty &&
        mainCategoryId == category.categoryId;
    // category.categoryId.isEmpty &&
    // categoryId != category.categoryId;
  }).toList();

  list.sort((categoryAId, categoryBId) {
    final categoryA = categoryMap[categoryAId];
    final categoryB = categoryMap[categoryBId];
    return categoryA.compareTo(categoryB, CategoryFields.name, true);
  });

  return list;
}

var memoizedFilteredCategoryList = memo6((SelectionState selectionState,
        BuiltMap<String, CategoryEntity> categoryMap,
        BuiltList<String> categoryList,
        StaticState staticState,
        BuiltMap<String, UserEntity> userMap,
        ListUIState categoryListState) =>
    filteredCategoriesSelector(selectionState, categoryMap, categoryList,
        staticState, userMap, categoryListState));

List<String> filteredCategoriesSelector(
    SelectionState selectionState,
    BuiltMap<String, CategoryEntity> categoryMap,
    BuiltList<String> categoryList,
    StaticState staticState,
    BuiltMap<String, UserEntity> userMap,
    ListUIState categoryListState) {
  final filterEntityId = selectionState.filterEntityId;
  final filterEntityType = selectionState.filterEntityType;

  final list = categoryList.where((categoryId) {
    final category = categoryMap[categoryId];
    if (filterEntityId != null && category.id != filterEntityId) {
      return false;
    } else {}

    if (!category.matchesStates(categoryListState.stateFilters)) {
      return false;
    }

    return category.matchesFilter(categoryListState.filter);
  }).toList();

  list.sort((categoryAId, categoryBId) {
    final categoryA = categoryMap[categoryAId];
    final categoryB = categoryMap[categoryBId];
    return categoryA.compareTo(categoryB, categoryListState.sortField,
        categoryListState.sortAscending);
  });

  return list;
}

bool hasCategoryChanges(CategoryEntity category,
        BuiltMap<String, CategoryEntity> categoryMap) =>
    category.isNew ? category.isChanged : category != categoryMap[category.id];
