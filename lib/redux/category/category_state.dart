import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/redux/ui/entity_ui_state.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';

part 'category_state.g.dart';

abstract class CategoryState
    implements Built<CategoryState, CategoryStateBuilder> {
  factory CategoryState() {
    return _$CategoryState._(
      map: BuiltMap<String, CategoryEntity>(),
      list: BuiltList<String>(),
    );
  }
  CategoryState._();

  @override
  @memoized
  int get hashCode;

  BuiltMap<String, CategoryEntity> get map;
  BuiltList<String> get list;

  CategoryEntity get(String categoryId) {
    if (map.containsKey(categoryId)) {
      return map[categoryId];
    } else {
      return CategoryEntity(id: categoryId);
    }
  }

  CategoryState loadCategories(BuiltList<CategoryEntity> clients) {
    final map = Map<String, CategoryEntity>.fromIterable(
      clients,
      key: (dynamic item) => item.id,
      value: (dynamic item) => item,
    );

    return rebuild((b) => b
      ..map.addAll(map)
      ..list.replace((map.keys.toList() + list.toList()).toSet().toList()));
  }

  static Serializer<CategoryState> get serializer => _$categoryStateSerializer;
}

abstract class CategoryUIState extends Object
    with EntityUIState
    implements Built<CategoryUIState, CategoryUIStateBuilder> {
  factory CategoryUIState(PrefStateSortField sortField) {
    return _$CategoryUIState._(
      listUIState: ListUIState(sortField?.field ?? CategoryFields.name,
          sortAscending: sortField?.ascending),
      editing: CategoryEntity(),
      selectedId: '',
      tabIndex: 0,
    );
  }
  CategoryUIState._();

  @override
  @memoized
  int get hashCode;

  @nullable
  CategoryEntity get editing;

  @override
  bool get isCreatingNew => editing.isNew;

  @override
  String get editingId => editing.id;

  static Serializer<CategoryUIState> get serializer =>
      _$categoryUIStateSerializer;
}
