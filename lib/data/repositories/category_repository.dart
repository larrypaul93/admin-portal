import 'dart:convert';
import 'dart:core';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/data/models/serializers.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';

class CategoryRepository {
  const CategoryRepository({
    this.webClient = const WebClient(),
  });

  final WebClient webClient;

  Future<CategoryEntity> loadItem(
      Credentials credentials, String entityId) async {
    final dynamic response = await webClient.get(
        '${credentials.url}/categories/$entityId', credentials.token);

    final CategoryItemResponse categoryResponse =
        serializers.deserializeWith(CategoryItemResponse.serializer, response);

    return categoryResponse.data;
  }

  Future<BuiltList<CategoryEntity>> loadList(Credentials credentials) async {
    final String url = credentials.url + '/categories?';
    final dynamic response = await webClient.get(url, credentials.token);

    final CategoryListResponse categoryResponse =
        serializers.deserializeWith(CategoryListResponse.serializer, response);

    return categoryResponse.data;
  }

  Future<List<CategoryEntity>> bulkAction(
      Credentials credentials, List<String> ids, EntityAction action) async {
    if (ids.length > kMaxEntitiesPerBulkAction) {
      ids = ids.sublist(0, kMaxEntitiesPerBulkAction);
    }

    final url = credentials.url + '/categories/bulk';
    final dynamic response = await webClient.post(url, credentials.token,
        data: json.encode({'ids': ids, 'action': action.toApiParam()}));

    final CategoryListResponse categoryResponse =
        serializers.deserializeWith(CategoryListResponse.serializer, response);

    return categoryResponse.data.toList();
  }

  Future<CategoryEntity> saveData(
      Credentials credentials, CategoryEntity category) async {
    final data = serializers.serializeWith(CategoryEntity.serializer, category);
    dynamic response;

    if (category.isNew) {
      response = await webClient.post(
          credentials.url + '/categories', credentials.token,
          data: json.encode(data));
    } else {
      final url = '${credentials.url}/categories/${category.id}';
      response =
          await webClient.put(url, credentials.token, data: json.encode(data));
    }

    final CategoryItemResponse categoryResponse =
        serializers.deserializeWith(CategoryItemResponse.serializer, response);

    return categoryResponse.data;
  }
}
