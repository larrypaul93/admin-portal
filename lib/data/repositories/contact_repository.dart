import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/data/models/serializers.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';

class ContactRepository {
  const ContactRepository({
    this.webClient = const WebClient(),
  });

  final WebClient webClient;

  Future<ContactEntity> loadItem(
      Credentials credentials, String entityId) async {
    final dynamic response = await webClient.get(
        '${credentials.url}/contacts/$entityId', credentials.token);

    final ContactItemResponse contactResponse =
        serializers.deserializeWith(ContactItemResponse.serializer, response);

    return contactResponse.data;
  }

  Future<BuiltList<ContactEntity>> loadList(
      Credentials credentials, int page) async {
    final String url =
        credentials.url + '/contacts?per_page=$kRecordsPerPage&page=$page';
    final dynamic response = await webClient.get(url, credentials.token);

    final ContactListResponse contactResponse =
        serializers.deserializeWith(ContactListResponse.serializer, response);

    return contactResponse.data;
  }

  Future<List<ContactEntity>> bulkAction(
      Credentials credentials, List<String> ids, EntityAction action) async {
    if (ids.length > kMaxEntitiesPerBulkAction) {
      ids = ids.sublist(0, kMaxEntitiesPerBulkAction);
    }

    final url = credentials.url + '/contacts/bulk';
    final dynamic response = await webClient.post(url, credentials.token,
        data: json.encode({'ids': ids, 'action': action.toApiParam()}));

    final ContactListResponse contactResponse =
        serializers.deserializeWith(ContactListResponse.serializer, response);

    return contactResponse.data.toList();
  }

  Future<ContactEntity> saveData(
      Credentials credentials, ContactEntity contact) async {
    final data = serializers.serializeWith(ContactEntity.serializer, contact);
    dynamic response;

    if (contact.isNew) {
      response = await webClient.post(
          credentials.url + '/contacts', credentials.token,
          data: json.encode(data));
    } else {
      final url = '${credentials.url}/contacts/${contact.id}';
      response =
          await webClient.put(url, credentials.token, data: json.encode(data));
    }

    final ContactItemResponse contactResponse =
        serializers.deserializeWith(ContactItemResponse.serializer, response);

    return contactResponse.data;
  }
}
