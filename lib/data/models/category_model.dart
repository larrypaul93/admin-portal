import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/utils/formatting.dart';

part 'category_model.g.dart';

abstract class CategoryListResponse
    implements Built<CategoryListResponse, CategoryListResponseBuilder> {
  factory CategoryListResponse([void updates(CategoryListResponseBuilder b)]) =
      _$CategoryListResponse;

  CategoryListResponse._();

  @override
  @memoized
  int get hashCode;

  BuiltList<CategoryEntity> get data;

  static Serializer<CategoryListResponse> get serializer =>
      _$categoryListResponseSerializer;
}

abstract class CategoryItemResponse
    implements Built<CategoryItemResponse, CategoryItemResponseBuilder> {
  factory CategoryItemResponse([void updates(CategoryItemResponseBuilder b)]) =
      _$CategoryItemResponse;

  CategoryItemResponse._();

  @override
  @memoized
  int get hashCode;

  CategoryEntity get data;

  static Serializer<CategoryItemResponse> get serializer =>
      _$categoryItemResponseSerializer;
}

class CategoryFields {
  // STARTER: fields - do not remove comment
  static const String name = 'name';
  static const String description = 'description';
  static const String category = 'category';
  static const String skuPrefix = 'sku_prefix';
  static const String nextNumber = 'next_number';
  static const String custom1 = 'custom1';
  static const String custom2 = 'custom2';
  static const String custom3 = 'custom3';
  static const String custom4 = 'custom4';
  static const String updatedAt = 'updated_at';
}

abstract class CategoryEntity extends Object
    with BaseEntity
    implements Built<CategoryEntity, CategoryEntityBuilder> {
  // STARTER: properties - do not remove comment

  factory CategoryEntity({String id, AppState state}) {
    return _$CategoryEntity._(
        id: id ?? BaseEntity.nextId,
        isChanged: false,
        isDeleted: false,
        createdAt: 0,
        updatedAt: 0,
        createdUserId: '',
        assignedUserId: '',
        archivedAt: 0,
        // STARTER: constructor - do not remove comment
        name: '',
        description: '',
        skuPrefix: '',
        categoryId: '',
        nextNumber: '',
        category: null);
  }

  CategoryEntity._();

  @override
  @memoized
  int get hashCode;

  @override
  EntityType get entityType => EntityType.category;

  String get name;
  String get description;

  @nullable
  @BuiltValueField(wireName: 'category_id')
  String get categoryId;

  @BuiltValueField(wireName: 'sku_prefix')
  String get skuPrefix;

  @BuiltValueField(wireName: 'next_number')
  String get nextNumber;

  @nullable
  CategoryEntity get category;

  String get displayName {
    // STARTER: display name - do not remove comment
    return name;
  }

  @override
  List<EntityAction> getActions(
      {UserCompanyEntity userCompany,
      ClientEntity client,
      bool includeEdit = false,
      bool multiselect = false}) {
    final actions = <EntityAction>[];

    if (!isDeleted && !multiselect) {
      if (!multiselect && includeEdit && userCompany.canEditEntity(this)) {
        actions.add(EntityAction.edit);
      }
    }

    if (actions.isNotEmpty && actions.last != null) {
      actions.add(null);
    }

    return actions..addAll(super.getActions(userCompany: userCompany));
  }

  int compareTo(CategoryEntity category, String sortField, bool sortAscending) {
    int response = 0;
    final categoryA = sortAscending ? this : category;
    final categoryB = sortAscending ? category : this;

    // switch (sortField) {
    //   // STARTER: sort switch - do not remove comment
    //   default:
    //     print('## ERROR: sort by category.$sortField is not implemented');
    //     break;
    // }

    if (response == 0) {
      // STARTER: sort default - do not remove comment
      return categoryA.name.compareTo(categoryB.name);
    } else {
      return response;
    }
  }

  @override
  bool matchesFilter(String filter) {
    if (filter == null || filter.isEmpty) {
      return true;
    }

    filter = filter.toLowerCase();

    return false;
  }

  @override
  String matchesFilterValue(String filter) {
    if (filter == null || filter.isEmpty) {
      return null;
    }

    filter = filter.toLowerCase();

    return null;
  }

  @override
  String get listDisplayName => name;

  @override
  double get listDisplayAmount => null;

  @override
  FormatNumberType get listDisplayAmountType => null;

  static Serializer<CategoryEntity> get serializer =>
      _$categoryEntitySerializer;
}
