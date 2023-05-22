// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClientListResponse> _$clientListResponseSerializer =
    new _$ClientListResponseSerializer();
Serializer<ClientItemResponse> _$clientItemResponseSerializer =
    new _$ClientItemResponseSerializer();
Serializer<ClientEntity> _$clientEntitySerializer =
    new _$ClientEntitySerializer();

class _$ClientListResponseSerializer
    implements StructuredSerializer<ClientListResponse> {
  @override
  final Iterable<Type> types = const [ClientListResponse, _$ClientListResponse];
  @override
  final String wireName = 'ClientListResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, ClientListResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ClientEntity)])),
    ];

    return result;
  }

  @override
  ClientListResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClientListResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ClientEntity)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ClientItemResponseSerializer
    implements StructuredSerializer<ClientItemResponse> {
  @override
  final Iterable<Type> types = const [ClientItemResponse, _$ClientItemResponse];
  @override
  final String wireName = 'ClientItemResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, ClientItemResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(ClientEntity)),
    ];

    return result;
  }

  @override
  ClientItemResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClientItemResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(ClientEntity)) as ClientEntity);
          break;
      }
    }

    return result.build();
  }
}

class _$ClientEntitySerializer implements StructuredSerializer<ClientEntity> {
  @override
  final Iterable<Type> types = const [ClientEntity, _$ClientEntity];
  @override
  final String wireName = 'ClientEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, ClientEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'group_settings_id',
      serializers.serialize(object.groupId,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'display_name',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'balance',
      serializers.serialize(object.balance,
          specifiedType: const FullType(double)),
      'credit_balance',
      serializers.serialize(object.creditBalance,
          specifiedType: const FullType(double)),
      'payment_balance',
      serializers.serialize(object.paymentBalance,
          specifiedType: const FullType(double)),
      'paid_to_date',
      serializers.serialize(object.paidToDate,
          specifiedType: const FullType(double)),
      'client_hash',
      serializers.serialize(object.clientHash,
          specifiedType: const FullType(String)),
      'address1',
      serializers.serialize(object.address1,
          specifiedType: const FullType(String)),
      'address2',
      serializers.serialize(object.address2,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'postal_code',
      serializers.serialize(object.postalCode,
          specifiedType: const FullType(String)),
      'country_id',
      serializers.serialize(object.countryId,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'private_notes',
      serializers.serialize(object.privateNotes,
          specifiedType: const FullType(String)),
      'public_notes',
      serializers.serialize(object.publicNotes,
          specifiedType: const FullType(String)),
      'website',
      serializers.serialize(object.website,
          specifiedType: const FullType(String)),
      'industry_id',
      serializers.serialize(object.industryId,
          specifiedType: const FullType(String)),
      'size_id',
      serializers.serialize(object.sizeId,
          specifiedType: const FullType(String)),
      'vat_number',
      serializers.serialize(object.vatNumber,
          specifiedType: const FullType(String)),
      'id_number',
      serializers.serialize(object.idNumber,
          specifiedType: const FullType(String)),
      'number',
      serializers.serialize(object.number,
          specifiedType: const FullType(String)),
      'shipping_address1',
      serializers.serialize(object.shippingAddress1,
          specifiedType: const FullType(String)),
      'shipping_address2',
      serializers.serialize(object.shippingAddress2,
          specifiedType: const FullType(String)),
      'shipping_city',
      serializers.serialize(object.shippingCity,
          specifiedType: const FullType(String)),
      'shipping_state',
      serializers.serialize(object.shippingState,
          specifiedType: const FullType(String)),
      'shipping_postal_code',
      serializers.serialize(object.shippingPostalCode,
          specifiedType: const FullType(String)),
      'shipping_country_id',
      serializers.serialize(object.shippingCountryId,
          specifiedType: const FullType(String)),
      'settings',
      serializers.serialize(object.settings,
          specifiedType: const FullType(SettingsEntity)),
      'last_login',
      serializers.serialize(object.lastLogin,
          specifiedType: const FullType(int)),
      'custom_value1',
      serializers.serialize(object.customValue1,
          specifiedType: const FullType(String)),
      'custom_value2',
      serializers.serialize(object.customValue2,
          specifiedType: const FullType(String)),
      'custom_value3',
      serializers.serialize(object.customValue3,
          specifiedType: const FullType(String)),
      'custom_value4',
      serializers.serialize(object.customValue4,
          specifiedType: const FullType(String)),
      'main_address1',
      serializers.serialize(object.mainAddress1,
          specifiedType: const FullType(String)),
      'main_address2',
      serializers.serialize(object.mainAddress2,
          specifiedType: const FullType(String)),
      'main_city',
      serializers.serialize(object.mainCity,
          specifiedType: const FullType(String)),
      'main_state',
      serializers.serialize(object.mainState,
          specifiedType: const FullType(String)),
      'main_postal_code',
      serializers.serialize(object.mainPostalCode,
          specifiedType: const FullType(String)),
      'main_country_id',
      serializers.serialize(object.mainCountryId,
          specifiedType: const FullType(String)),
      'contacts',
      serializers.serialize(object.contacts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ContactEntity)])),
      'routing_id',
      serializers.serialize(object.routingId,
          specifiedType: const FullType(String)),
      'is_tax_exempt',
      serializers.serialize(object.isTaxExempt,
          specifiedType: const FullType(bool)),
      'activities',
      serializers.serialize(object.activities,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ActivityEntity)])),
      'ledger',
      serializers.serialize(object.ledger,
          specifiedType:
              const FullType(BuiltList, const [const FullType(LedgerEntity)])),
      'gateway_tokens',
      serializers.serialize(object.gatewayTokens,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GatewayTokenEntity)])),
      'documents',
      serializers.serialize(object.documents,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DocumentEntity)])),
      'system_logs',
      serializers.serialize(object.systemLogs,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SystemLogEntity)])),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(int)),
      'archived_at',
      serializers.serialize(object.archivedAt,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object value;
    value = object.loadedAt;
    if (value != null) {
      result
        ..add('loadedAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.suffix;
    if (value != null) {
      result
        ..add('suffix')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.legalBusinessName;
    if (value != null) {
      result
        ..add('legal_business_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.region;
    if (value != null) {
      result
        ..add('region')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fax;
    if (value != null) {
      result
        ..add('fax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneHome;
    if (value != null) {
      result
        ..add('phone_home')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gdId;
    if (value != null) {
      result
        ..add('gd_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneMain;
    if (value != null) {
      result
        ..add('phone_main')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneTollFree;
    if (value != null) {
      result
        ..add('phone_toll_free')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneCell;
    if (value != null) {
      result
        ..add('phone_cell')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homeAddress1;
    if (value != null) {
      result
        ..add('home_address1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homeAddress2;
    if (value != null) {
      result
        ..add('home_address2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homeCity;
    if (value != null) {
      result
        ..add('home_city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homeState;
    if (value != null) {
      result
        ..add('home_state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homePostalCode;
    if (value != null) {
      result
        ..add('home_postal_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homeCountryId;
    if (value != null) {
      result
        ..add('home_country_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.headOfficeAddress1;
    if (value != null) {
      result
        ..add('head_office_address1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.headOfficeAddress2;
    if (value != null) {
      result
        ..add('head_office_address2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.headOfficeCity;
    if (value != null) {
      result
        ..add('head_office_city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.headOfficeState;
    if (value != null) {
      result
        ..add('head_office_state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.headOfficePostalCode;
    if (value != null) {
      result
        ..add('head_office_postal_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.headOfficeCountryId;
    if (value != null) {
      result
        ..add('head_office_country_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isChanged;
    if (value != null) {
      result
        ..add('isChanged')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isDeleted;
    if (value != null) {
      result
        ..add('is_deleted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdUserId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.assignedUserId;
    if (value != null) {
      result
        ..add('assigned_user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ClientEntity deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClientEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'group_settings_id':
          result.groupId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loadedAt':
          result.loadedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'credit_balance':
          result.creditBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'payment_balance':
          result.paymentBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'paid_to_date':
          result.paidToDate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'client_hash':
          result.clientHash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address1':
          result.address1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address2':
          result.address2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postal_code':
          result.postalCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'country_id':
          result.countryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'private_notes':
          result.privateNotes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'public_notes':
          result.publicNotes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'industry_id':
          result.industryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'size_id':
          result.sizeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vat_number':
          result.vatNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id_number':
          result.idNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_address1':
          result.shippingAddress1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_address2':
          result.shippingAddress2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_city':
          result.shippingCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_state':
          result.shippingState = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_postal_code':
          result.shippingPostalCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_country_id':
          result.shippingCountryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'settings':
          result.settings.replace(serializers.deserialize(value,
              specifiedType: const FullType(SettingsEntity)) as SettingsEntity);
          break;
        case 'last_login':
          result.lastLogin = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'custom_value1':
          result.customValue1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'custom_value2':
          result.customValue2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'custom_value3':
          result.customValue3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'custom_value4':
          result.customValue4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'suffix':
          result.suffix = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'legal_business_name':
          result.legalBusinessName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'region':
          result.region = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fax':
          result.fax = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone_home':
          result.phoneHome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gd_id':
          result.gdId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone_main':
          result.phoneMain = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone_toll_free':
          result.phoneTollFree = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone_cell':
          result.phoneCell = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'home_address1':
          result.homeAddress1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'home_address2':
          result.homeAddress2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'home_city':
          result.homeCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'home_state':
          result.homeState = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'home_postal_code':
          result.homePostalCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'home_country_id':
          result.homeCountryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'head_office_address1':
          result.headOfficeAddress1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'head_office_address2':
          result.headOfficeAddress2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'head_office_city':
          result.headOfficeCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'head_office_state':
          result.headOfficeState = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'head_office_postal_code':
          result.headOfficePostalCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'head_office_country_id':
          result.headOfficeCountryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'main_address1':
          result.mainAddress1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'main_address2':
          result.mainAddress2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'main_city':
          result.mainCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'main_state':
          result.mainState = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'main_postal_code':
          result.mainPostalCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'main_country_id':
          result.mainCountryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contacts':
          result.contacts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ContactEntity)]))
              as BuiltList<Object>);
          break;
        case 'routing_id':
          result.routingId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_tax_exempt':
          result.isTaxExempt = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'activities':
          result.activities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ActivityEntity)]))
              as BuiltList<Object>);
          break;
        case 'ledger':
          result.ledger.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(LedgerEntity)]))
              as BuiltList<Object>);
          break;
        case 'gateway_tokens':
          result.gatewayTokens.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GatewayTokenEntity)]))
              as BuiltList<Object>);
          break;
        case 'documents':
          result.documents.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DocumentEntity)]))
              as BuiltList<Object>);
          break;
        case 'system_logs':
          result.systemLogs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SystemLogEntity)]))
              as BuiltList<Object>);
          break;
        case 'isChanged':
          result.isChanged = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'archived_at':
          result.archivedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'is_deleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'user_id':
          result.createdUserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assigned_user_id':
          result.assignedUserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ClientListResponse extends ClientListResponse {
  @override
  final BuiltList<ClientEntity> data;

  factory _$ClientListResponse(
          [void Function(ClientListResponseBuilder) updates]) =>
      (new ClientListResponseBuilder()..update(updates))._build();

  _$ClientListResponse._({this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'ClientListResponse', 'data');
  }

  @override
  ClientListResponse rebuild(
          void Function(ClientListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientListResponseBuilder toBuilder() =>
      new ClientListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientListResponse && data == other.data;
  }

  int __hashCode;
  @override
  int get hashCode {
    if (__hashCode != null) return __hashCode;
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return __hashCode ??= _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientListResponse')
          ..add('data', data))
        .toString();
  }
}

class ClientListResponseBuilder
    implements Builder<ClientListResponse, ClientListResponseBuilder> {
  _$ClientListResponse _$v;

  ListBuilder<ClientEntity> _data;
  ListBuilder<ClientEntity> get data =>
      _$this._data ??= new ListBuilder<ClientEntity>();
  set data(ListBuilder<ClientEntity> data) => _$this._data = data;

  ClientListResponseBuilder();

  ClientListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientListResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientListResponse;
  }

  @override
  void update(void Function(ClientListResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientListResponse build() => _build();

  _$ClientListResponse _build() {
    _$ClientListResponse _$result;
    try {
      _$result = _$v ?? new _$ClientListResponse._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ClientListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ClientItemResponse extends ClientItemResponse {
  @override
  final ClientEntity data;

  factory _$ClientItemResponse(
          [void Function(ClientItemResponseBuilder) updates]) =>
      (new ClientItemResponseBuilder()..update(updates))._build();

  _$ClientItemResponse._({this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'ClientItemResponse', 'data');
  }

  @override
  ClientItemResponse rebuild(
          void Function(ClientItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientItemResponseBuilder toBuilder() =>
      new ClientItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientItemResponse && data == other.data;
  }

  int __hashCode;
  @override
  int get hashCode {
    if (__hashCode != null) return __hashCode;
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return __hashCode ??= _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientItemResponse')
          ..add('data', data))
        .toString();
  }
}

class ClientItemResponseBuilder
    implements Builder<ClientItemResponse, ClientItemResponseBuilder> {
  _$ClientItemResponse _$v;

  ClientEntityBuilder _data;
  ClientEntityBuilder get data => _$this._data ??= new ClientEntityBuilder();
  set data(ClientEntityBuilder data) => _$this._data = data;

  ClientItemResponseBuilder();

  ClientItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientItemResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientItemResponse;
  }

  @override
  void update(void Function(ClientItemResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientItemResponse build() => _build();

  _$ClientItemResponse _build() {
    _$ClientItemResponse _$result;
    try {
      _$result = _$v ?? new _$ClientItemResponse._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ClientItemResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ClientEntity extends ClientEntity {
  @override
  final String groupId;
  @override
  final int loadedAt;
  @override
  final String name;
  @override
  final String displayName;
  @override
  final double balance;
  @override
  final double creditBalance;
  @override
  final double paymentBalance;
  @override
  final double paidToDate;
  @override
  final String clientHash;
  @override
  final String address1;
  @override
  final String address2;
  @override
  final String city;
  @override
  final String state;
  @override
  final String postalCode;
  @override
  final String countryId;
  @override
  final String phone;
  @override
  final String privateNotes;
  @override
  final String publicNotes;
  @override
  final String website;
  @override
  final String industryId;
  @override
  final String sizeId;
  @override
  final String vatNumber;
  @override
  final String idNumber;
  @override
  final String number;
  @override
  final String shippingAddress1;
  @override
  final String shippingAddress2;
  @override
  final String shippingCity;
  @override
  final String shippingState;
  @override
  final String shippingPostalCode;
  @override
  final String shippingCountryId;
  @override
  final SettingsEntity settings;
  @override
  final int lastLogin;
  @override
  final String customValue1;
  @override
  final String customValue2;
  @override
  final String customValue3;
  @override
  final String customValue4;
  @override
  final String suffix;
  @override
  final String legalBusinessName;
  @override
  final String email;
  @override
  final String region;
  @override
  final String fax;
  @override
  final String phoneHome;
  @override
  final String gdId;
  @override
  final String phoneMain;
  @override
  final String phoneTollFree;
  @override
  final String phoneCell;
  @override
  final String homeAddress1;
  @override
  final String homeAddress2;
  @override
  final String homeCity;
  @override
  final String homeState;
  @override
  final String homePostalCode;
  @override
  final String homeCountryId;
  @override
  final String headOfficeAddress1;
  @override
  final String headOfficeAddress2;
  @override
  final String headOfficeCity;
  @override
  final String headOfficeState;
  @override
  final String headOfficePostalCode;
  @override
  final String headOfficeCountryId;
  @override
  final String mainAddress1;
  @override
  final String mainAddress2;
  @override
  final String mainCity;
  @override
  final String mainState;
  @override
  final String mainPostalCode;
  @override
  final String mainCountryId;
  @override
  final BuiltList<ContactEntity> contacts;
  @override
  final String routingId;
  @override
  final bool isTaxExempt;
  @override
  final BuiltList<ActivityEntity> activities;
  @override
  final BuiltList<LedgerEntity> ledger;
  @override
  final BuiltList<GatewayTokenEntity> gatewayTokens;
  @override
  final BuiltList<DocumentEntity> documents;
  @override
  final BuiltList<SystemLogEntity> systemLogs;
  @override
  final bool isChanged;
  @override
  final int createdAt;
  @override
  final int updatedAt;
  @override
  final int archivedAt;
  @override
  final bool isDeleted;
  @override
  final String createdUserId;
  @override
  final String assignedUserId;
  @override
  final String id;

  factory _$ClientEntity([void Function(ClientEntityBuilder) updates]) =>
      (new ClientEntityBuilder()..update(updates))._build();

  _$ClientEntity._(
      {this.groupId,
      this.loadedAt,
      this.name,
      this.displayName,
      this.balance,
      this.creditBalance,
      this.paymentBalance,
      this.paidToDate,
      this.clientHash,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postalCode,
      this.countryId,
      this.phone,
      this.privateNotes,
      this.publicNotes,
      this.website,
      this.industryId,
      this.sizeId,
      this.vatNumber,
      this.idNumber,
      this.number,
      this.shippingAddress1,
      this.shippingAddress2,
      this.shippingCity,
      this.shippingState,
      this.shippingPostalCode,
      this.shippingCountryId,
      this.settings,
      this.lastLogin,
      this.customValue1,
      this.customValue2,
      this.customValue3,
      this.customValue4,
      this.suffix,
      this.legalBusinessName,
      this.email,
      this.region,
      this.fax,
      this.phoneHome,
      this.gdId,
      this.phoneMain,
      this.phoneTollFree,
      this.phoneCell,
      this.homeAddress1,
      this.homeAddress2,
      this.homeCity,
      this.homeState,
      this.homePostalCode,
      this.homeCountryId,
      this.headOfficeAddress1,
      this.headOfficeAddress2,
      this.headOfficeCity,
      this.headOfficeState,
      this.headOfficePostalCode,
      this.headOfficeCountryId,
      this.mainAddress1,
      this.mainAddress2,
      this.mainCity,
      this.mainState,
      this.mainPostalCode,
      this.mainCountryId,
      this.contacts,
      this.routingId,
      this.isTaxExempt,
      this.activities,
      this.ledger,
      this.gatewayTokens,
      this.documents,
      this.systemLogs,
      this.isChanged,
      this.createdAt,
      this.updatedAt,
      this.archivedAt,
      this.isDeleted,
      this.createdUserId,
      this.assignedUserId,
      this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(groupId, r'ClientEntity', 'groupId');
    BuiltValueNullFieldError.checkNotNull(name, r'ClientEntity', 'name');
    BuiltValueNullFieldError.checkNotNull(
        displayName, r'ClientEntity', 'displayName');
    BuiltValueNullFieldError.checkNotNull(balance, r'ClientEntity', 'balance');
    BuiltValueNullFieldError.checkNotNull(
        creditBalance, r'ClientEntity', 'creditBalance');
    BuiltValueNullFieldError.checkNotNull(
        paymentBalance, r'ClientEntity', 'paymentBalance');
    BuiltValueNullFieldError.checkNotNull(
        paidToDate, r'ClientEntity', 'paidToDate');
    BuiltValueNullFieldError.checkNotNull(
        clientHash, r'ClientEntity', 'clientHash');
    BuiltValueNullFieldError.checkNotNull(
        address1, r'ClientEntity', 'address1');
    BuiltValueNullFieldError.checkNotNull(
        address2, r'ClientEntity', 'address2');
    BuiltValueNullFieldError.checkNotNull(city, r'ClientEntity', 'city');
    BuiltValueNullFieldError.checkNotNull(state, r'ClientEntity', 'state');
    BuiltValueNullFieldError.checkNotNull(
        postalCode, r'ClientEntity', 'postalCode');
    BuiltValueNullFieldError.checkNotNull(
        countryId, r'ClientEntity', 'countryId');
    BuiltValueNullFieldError.checkNotNull(phone, r'ClientEntity', 'phone');
    BuiltValueNullFieldError.checkNotNull(
        privateNotes, r'ClientEntity', 'privateNotes');
    BuiltValueNullFieldError.checkNotNull(
        publicNotes, r'ClientEntity', 'publicNotes');
    BuiltValueNullFieldError.checkNotNull(website, r'ClientEntity', 'website');
    BuiltValueNullFieldError.checkNotNull(
        industryId, r'ClientEntity', 'industryId');
    BuiltValueNullFieldError.checkNotNull(sizeId, r'ClientEntity', 'sizeId');
    BuiltValueNullFieldError.checkNotNull(
        vatNumber, r'ClientEntity', 'vatNumber');
    BuiltValueNullFieldError.checkNotNull(
        idNumber, r'ClientEntity', 'idNumber');
    BuiltValueNullFieldError.checkNotNull(number, r'ClientEntity', 'number');
    BuiltValueNullFieldError.checkNotNull(
        shippingAddress1, r'ClientEntity', 'shippingAddress1');
    BuiltValueNullFieldError.checkNotNull(
        shippingAddress2, r'ClientEntity', 'shippingAddress2');
    BuiltValueNullFieldError.checkNotNull(
        shippingCity, r'ClientEntity', 'shippingCity');
    BuiltValueNullFieldError.checkNotNull(
        shippingState, r'ClientEntity', 'shippingState');
    BuiltValueNullFieldError.checkNotNull(
        shippingPostalCode, r'ClientEntity', 'shippingPostalCode');
    BuiltValueNullFieldError.checkNotNull(
        shippingCountryId, r'ClientEntity', 'shippingCountryId');
    BuiltValueNullFieldError.checkNotNull(
        settings, r'ClientEntity', 'settings');
    BuiltValueNullFieldError.checkNotNull(
        lastLogin, r'ClientEntity', 'lastLogin');
    BuiltValueNullFieldError.checkNotNull(
        customValue1, r'ClientEntity', 'customValue1');
    BuiltValueNullFieldError.checkNotNull(
        customValue2, r'ClientEntity', 'customValue2');
    BuiltValueNullFieldError.checkNotNull(
        customValue3, r'ClientEntity', 'customValue3');
    BuiltValueNullFieldError.checkNotNull(
        customValue4, r'ClientEntity', 'customValue4');
    BuiltValueNullFieldError.checkNotNull(
        mainAddress1, r'ClientEntity', 'mainAddress1');
    BuiltValueNullFieldError.checkNotNull(
        mainAddress2, r'ClientEntity', 'mainAddress2');
    BuiltValueNullFieldError.checkNotNull(
        mainCity, r'ClientEntity', 'mainCity');
    BuiltValueNullFieldError.checkNotNull(
        mainState, r'ClientEntity', 'mainState');
    BuiltValueNullFieldError.checkNotNull(
        mainPostalCode, r'ClientEntity', 'mainPostalCode');
    BuiltValueNullFieldError.checkNotNull(
        mainCountryId, r'ClientEntity', 'mainCountryId');
    BuiltValueNullFieldError.checkNotNull(
        contacts, r'ClientEntity', 'contacts');
    BuiltValueNullFieldError.checkNotNull(
        routingId, r'ClientEntity', 'routingId');
    BuiltValueNullFieldError.checkNotNull(
        isTaxExempt, r'ClientEntity', 'isTaxExempt');
    BuiltValueNullFieldError.checkNotNull(
        activities, r'ClientEntity', 'activities');
    BuiltValueNullFieldError.checkNotNull(ledger, r'ClientEntity', 'ledger');
    BuiltValueNullFieldError.checkNotNull(
        gatewayTokens, r'ClientEntity', 'gatewayTokens');
    BuiltValueNullFieldError.checkNotNull(
        documents, r'ClientEntity', 'documents');
    BuiltValueNullFieldError.checkNotNull(
        systemLogs, r'ClientEntity', 'systemLogs');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'ClientEntity', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'ClientEntity', 'updatedAt');
    BuiltValueNullFieldError.checkNotNull(
        archivedAt, r'ClientEntity', 'archivedAt');
    BuiltValueNullFieldError.checkNotNull(id, r'ClientEntity', 'id');
  }

  @override
  ClientEntity rebuild(void Function(ClientEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientEntityBuilder toBuilder() => new ClientEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientEntity &&
        groupId == other.groupId &&
        name == other.name &&
        displayName == other.displayName &&
        balance == other.balance &&
        creditBalance == other.creditBalance &&
        paymentBalance == other.paymentBalance &&
        paidToDate == other.paidToDate &&
        clientHash == other.clientHash &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        city == other.city &&
        state == other.state &&
        postalCode == other.postalCode &&
        countryId == other.countryId &&
        phone == other.phone &&
        privateNotes == other.privateNotes &&
        publicNotes == other.publicNotes &&
        website == other.website &&
        industryId == other.industryId &&
        sizeId == other.sizeId &&
        vatNumber == other.vatNumber &&
        idNumber == other.idNumber &&
        number == other.number &&
        shippingAddress1 == other.shippingAddress1 &&
        shippingAddress2 == other.shippingAddress2 &&
        shippingCity == other.shippingCity &&
        shippingState == other.shippingState &&
        shippingPostalCode == other.shippingPostalCode &&
        shippingCountryId == other.shippingCountryId &&
        settings == other.settings &&
        lastLogin == other.lastLogin &&
        customValue1 == other.customValue1 &&
        customValue2 == other.customValue2 &&
        customValue3 == other.customValue3 &&
        customValue4 == other.customValue4 &&
        suffix == other.suffix &&
        legalBusinessName == other.legalBusinessName &&
        email == other.email &&
        region == other.region &&
        fax == other.fax &&
        phoneHome == other.phoneHome &&
        gdId == other.gdId &&
        phoneMain == other.phoneMain &&
        phoneTollFree == other.phoneTollFree &&
        phoneCell == other.phoneCell &&
        homeAddress1 == other.homeAddress1 &&
        homeAddress2 == other.homeAddress2 &&
        homeCity == other.homeCity &&
        homeState == other.homeState &&
        homePostalCode == other.homePostalCode &&
        homeCountryId == other.homeCountryId &&
        headOfficeAddress1 == other.headOfficeAddress1 &&
        headOfficeAddress2 == other.headOfficeAddress2 &&
        headOfficeCity == other.headOfficeCity &&
        headOfficeState == other.headOfficeState &&
        headOfficePostalCode == other.headOfficePostalCode &&
        headOfficeCountryId == other.headOfficeCountryId &&
        mainAddress1 == other.mainAddress1 &&
        mainAddress2 == other.mainAddress2 &&
        mainCity == other.mainCity &&
        mainState == other.mainState &&
        mainPostalCode == other.mainPostalCode &&
        mainCountryId == other.mainCountryId &&
        contacts == other.contacts &&
        routingId == other.routingId &&
        isTaxExempt == other.isTaxExempt &&
        activities == other.activities &&
        ledger == other.ledger &&
        gatewayTokens == other.gatewayTokens &&
        documents == other.documents &&
        systemLogs == other.systemLogs &&
        isChanged == other.isChanged &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        archivedAt == other.archivedAt &&
        isDeleted == other.isDeleted &&
        createdUserId == other.createdUserId &&
        assignedUserId == other.assignedUserId &&
        id == other.id;
  }

  int __hashCode;
  @override
  int get hashCode {
    if (__hashCode != null) return __hashCode;
    var _$hash = 0;
    _$hash = $jc(_$hash, groupId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jc(_$hash, creditBalance.hashCode);
    _$hash = $jc(_$hash, paymentBalance.hashCode);
    _$hash = $jc(_$hash, paidToDate.hashCode);
    _$hash = $jc(_$hash, clientHash.hashCode);
    _$hash = $jc(_$hash, address1.hashCode);
    _$hash = $jc(_$hash, address2.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, postalCode.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, privateNotes.hashCode);
    _$hash = $jc(_$hash, publicNotes.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, industryId.hashCode);
    _$hash = $jc(_$hash, sizeId.hashCode);
    _$hash = $jc(_$hash, vatNumber.hashCode);
    _$hash = $jc(_$hash, idNumber.hashCode);
    _$hash = $jc(_$hash, number.hashCode);
    _$hash = $jc(_$hash, shippingAddress1.hashCode);
    _$hash = $jc(_$hash, shippingAddress2.hashCode);
    _$hash = $jc(_$hash, shippingCity.hashCode);
    _$hash = $jc(_$hash, shippingState.hashCode);
    _$hash = $jc(_$hash, shippingPostalCode.hashCode);
    _$hash = $jc(_$hash, shippingCountryId.hashCode);
    _$hash = $jc(_$hash, settings.hashCode);
    _$hash = $jc(_$hash, lastLogin.hashCode);
    _$hash = $jc(_$hash, customValue1.hashCode);
    _$hash = $jc(_$hash, customValue2.hashCode);
    _$hash = $jc(_$hash, customValue3.hashCode);
    _$hash = $jc(_$hash, customValue4.hashCode);
    _$hash = $jc(_$hash, suffix.hashCode);
    _$hash = $jc(_$hash, legalBusinessName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, region.hashCode);
    _$hash = $jc(_$hash, fax.hashCode);
    _$hash = $jc(_$hash, phoneHome.hashCode);
    _$hash = $jc(_$hash, gdId.hashCode);
    _$hash = $jc(_$hash, phoneMain.hashCode);
    _$hash = $jc(_$hash, phoneTollFree.hashCode);
    _$hash = $jc(_$hash, phoneCell.hashCode);
    _$hash = $jc(_$hash, homeAddress1.hashCode);
    _$hash = $jc(_$hash, homeAddress2.hashCode);
    _$hash = $jc(_$hash, homeCity.hashCode);
    _$hash = $jc(_$hash, homeState.hashCode);
    _$hash = $jc(_$hash, homePostalCode.hashCode);
    _$hash = $jc(_$hash, homeCountryId.hashCode);
    _$hash = $jc(_$hash, headOfficeAddress1.hashCode);
    _$hash = $jc(_$hash, headOfficeAddress2.hashCode);
    _$hash = $jc(_$hash, headOfficeCity.hashCode);
    _$hash = $jc(_$hash, headOfficeState.hashCode);
    _$hash = $jc(_$hash, headOfficePostalCode.hashCode);
    _$hash = $jc(_$hash, headOfficeCountryId.hashCode);
    _$hash = $jc(_$hash, mainAddress1.hashCode);
    _$hash = $jc(_$hash, mainAddress2.hashCode);
    _$hash = $jc(_$hash, mainCity.hashCode);
    _$hash = $jc(_$hash, mainState.hashCode);
    _$hash = $jc(_$hash, mainPostalCode.hashCode);
    _$hash = $jc(_$hash, mainCountryId.hashCode);
    _$hash = $jc(_$hash, contacts.hashCode);
    _$hash = $jc(_$hash, routingId.hashCode);
    _$hash = $jc(_$hash, isTaxExempt.hashCode);
    _$hash = $jc(_$hash, activities.hashCode);
    _$hash = $jc(_$hash, ledger.hashCode);
    _$hash = $jc(_$hash, gatewayTokens.hashCode);
    _$hash = $jc(_$hash, documents.hashCode);
    _$hash = $jc(_$hash, systemLogs.hashCode);
    _$hash = $jc(_$hash, isChanged.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, archivedAt.hashCode);
    _$hash = $jc(_$hash, isDeleted.hashCode);
    _$hash = $jc(_$hash, createdUserId.hashCode);
    _$hash = $jc(_$hash, assignedUserId.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return __hashCode ??= _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientEntity')
          ..add('groupId', groupId)
          ..add('loadedAt', loadedAt)
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('balance', balance)
          ..add('creditBalance', creditBalance)
          ..add('paymentBalance', paymentBalance)
          ..add('paidToDate', paidToDate)
          ..add('clientHash', clientHash)
          ..add('address1', address1)
          ..add('address2', address2)
          ..add('city', city)
          ..add('state', state)
          ..add('postalCode', postalCode)
          ..add('countryId', countryId)
          ..add('phone', phone)
          ..add('privateNotes', privateNotes)
          ..add('publicNotes', publicNotes)
          ..add('website', website)
          ..add('industryId', industryId)
          ..add('sizeId', sizeId)
          ..add('vatNumber', vatNumber)
          ..add('idNumber', idNumber)
          ..add('number', number)
          ..add('shippingAddress1', shippingAddress1)
          ..add('shippingAddress2', shippingAddress2)
          ..add('shippingCity', shippingCity)
          ..add('shippingState', shippingState)
          ..add('shippingPostalCode', shippingPostalCode)
          ..add('shippingCountryId', shippingCountryId)
          ..add('settings', settings)
          ..add('lastLogin', lastLogin)
          ..add('customValue1', customValue1)
          ..add('customValue2', customValue2)
          ..add('customValue3', customValue3)
          ..add('customValue4', customValue4)
          ..add('suffix', suffix)
          ..add('legalBusinessName', legalBusinessName)
          ..add('email', email)
          ..add('region', region)
          ..add('fax', fax)
          ..add('phoneHome', phoneHome)
          ..add('gdId', gdId)
          ..add('phoneMain', phoneMain)
          ..add('phoneTollFree', phoneTollFree)
          ..add('phoneCell', phoneCell)
          ..add('homeAddress1', homeAddress1)
          ..add('homeAddress2', homeAddress2)
          ..add('homeCity', homeCity)
          ..add('homeState', homeState)
          ..add('homePostalCode', homePostalCode)
          ..add('homeCountryId', homeCountryId)
          ..add('headOfficeAddress1', headOfficeAddress1)
          ..add('headOfficeAddress2', headOfficeAddress2)
          ..add('headOfficeCity', headOfficeCity)
          ..add('headOfficeState', headOfficeState)
          ..add('headOfficePostalCode', headOfficePostalCode)
          ..add('headOfficeCountryId', headOfficeCountryId)
          ..add('mainAddress1', mainAddress1)
          ..add('mainAddress2', mainAddress2)
          ..add('mainCity', mainCity)
          ..add('mainState', mainState)
          ..add('mainPostalCode', mainPostalCode)
          ..add('mainCountryId', mainCountryId)
          ..add('contacts', contacts)
          ..add('routingId', routingId)
          ..add('isTaxExempt', isTaxExempt)
          ..add('activities', activities)
          ..add('ledger', ledger)
          ..add('gatewayTokens', gatewayTokens)
          ..add('documents', documents)
          ..add('systemLogs', systemLogs)
          ..add('isChanged', isChanged)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('archivedAt', archivedAt)
          ..add('isDeleted', isDeleted)
          ..add('createdUserId', createdUserId)
          ..add('assignedUserId', assignedUserId)
          ..add('id', id))
        .toString();
  }
}

class ClientEntityBuilder
    implements Builder<ClientEntity, ClientEntityBuilder> {
  _$ClientEntity _$v;

  String _groupId;
  String get groupId => _$this._groupId;
  set groupId(String groupId) => _$this._groupId = groupId;

  int _loadedAt;
  int get loadedAt => _$this._loadedAt;
  set loadedAt(int loadedAt) => _$this._loadedAt = loadedAt;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  double _balance;
  double get balance => _$this._balance;
  set balance(double balance) => _$this._balance = balance;

  double _creditBalance;
  double get creditBalance => _$this._creditBalance;
  set creditBalance(double creditBalance) =>
      _$this._creditBalance = creditBalance;

  double _paymentBalance;
  double get paymentBalance => _$this._paymentBalance;
  set paymentBalance(double paymentBalance) =>
      _$this._paymentBalance = paymentBalance;

  double _paidToDate;
  double get paidToDate => _$this._paidToDate;
  set paidToDate(double paidToDate) => _$this._paidToDate = paidToDate;

  String _clientHash;
  String get clientHash => _$this._clientHash;
  set clientHash(String clientHash) => _$this._clientHash = clientHash;

  String _address1;
  String get address1 => _$this._address1;
  set address1(String address1) => _$this._address1 = address1;

  String _address2;
  String get address2 => _$this._address2;
  set address2(String address2) => _$this._address2 = address2;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  String _postalCode;
  String get postalCode => _$this._postalCode;
  set postalCode(String postalCode) => _$this._postalCode = postalCode;

  String _countryId;
  String get countryId => _$this._countryId;
  set countryId(String countryId) => _$this._countryId = countryId;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _privateNotes;
  String get privateNotes => _$this._privateNotes;
  set privateNotes(String privateNotes) => _$this._privateNotes = privateNotes;

  String _publicNotes;
  String get publicNotes => _$this._publicNotes;
  set publicNotes(String publicNotes) => _$this._publicNotes = publicNotes;

  String _website;
  String get website => _$this._website;
  set website(String website) => _$this._website = website;

  String _industryId;
  String get industryId => _$this._industryId;
  set industryId(String industryId) => _$this._industryId = industryId;

  String _sizeId;
  String get sizeId => _$this._sizeId;
  set sizeId(String sizeId) => _$this._sizeId = sizeId;

  String _vatNumber;
  String get vatNumber => _$this._vatNumber;
  set vatNumber(String vatNumber) => _$this._vatNumber = vatNumber;

  String _idNumber;
  String get idNumber => _$this._idNumber;
  set idNumber(String idNumber) => _$this._idNumber = idNumber;

  String _number;
  String get number => _$this._number;
  set number(String number) => _$this._number = number;

  String _shippingAddress1;
  String get shippingAddress1 => _$this._shippingAddress1;
  set shippingAddress1(String shippingAddress1) =>
      _$this._shippingAddress1 = shippingAddress1;

  String _shippingAddress2;
  String get shippingAddress2 => _$this._shippingAddress2;
  set shippingAddress2(String shippingAddress2) =>
      _$this._shippingAddress2 = shippingAddress2;

  String _shippingCity;
  String get shippingCity => _$this._shippingCity;
  set shippingCity(String shippingCity) => _$this._shippingCity = shippingCity;

  String _shippingState;
  String get shippingState => _$this._shippingState;
  set shippingState(String shippingState) =>
      _$this._shippingState = shippingState;

  String _shippingPostalCode;
  String get shippingPostalCode => _$this._shippingPostalCode;
  set shippingPostalCode(String shippingPostalCode) =>
      _$this._shippingPostalCode = shippingPostalCode;

  String _shippingCountryId;
  String get shippingCountryId => _$this._shippingCountryId;
  set shippingCountryId(String shippingCountryId) =>
      _$this._shippingCountryId = shippingCountryId;

  SettingsEntityBuilder _settings;
  SettingsEntityBuilder get settings =>
      _$this._settings ??= new SettingsEntityBuilder();
  set settings(SettingsEntityBuilder settings) => _$this._settings = settings;

  int _lastLogin;
  int get lastLogin => _$this._lastLogin;
  set lastLogin(int lastLogin) => _$this._lastLogin = lastLogin;

  String _customValue1;
  String get customValue1 => _$this._customValue1;
  set customValue1(String customValue1) => _$this._customValue1 = customValue1;

  String _customValue2;
  String get customValue2 => _$this._customValue2;
  set customValue2(String customValue2) => _$this._customValue2 = customValue2;

  String _customValue3;
  String get customValue3 => _$this._customValue3;
  set customValue3(String customValue3) => _$this._customValue3 = customValue3;

  String _customValue4;
  String get customValue4 => _$this._customValue4;
  set customValue4(String customValue4) => _$this._customValue4 = customValue4;

  String _suffix;
  String get suffix => _$this._suffix;
  set suffix(String suffix) => _$this._suffix = suffix;

  String _legalBusinessName;
  String get legalBusinessName => _$this._legalBusinessName;
  set legalBusinessName(String legalBusinessName) =>
      _$this._legalBusinessName = legalBusinessName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _region;
  String get region => _$this._region;
  set region(String region) => _$this._region = region;

  String _fax;
  String get fax => _$this._fax;
  set fax(String fax) => _$this._fax = fax;

  String _phoneHome;
  String get phoneHome => _$this._phoneHome;
  set phoneHome(String phoneHome) => _$this._phoneHome = phoneHome;

  String _gdId;
  String get gdId => _$this._gdId;
  set gdId(String gdId) => _$this._gdId = gdId;

  String _phoneMain;
  String get phoneMain => _$this._phoneMain;
  set phoneMain(String phoneMain) => _$this._phoneMain = phoneMain;

  String _phoneTollFree;
  String get phoneTollFree => _$this._phoneTollFree;
  set phoneTollFree(String phoneTollFree) =>
      _$this._phoneTollFree = phoneTollFree;

  String _phoneCell;
  String get phoneCell => _$this._phoneCell;
  set phoneCell(String phoneCell) => _$this._phoneCell = phoneCell;

  String _homeAddress1;
  String get homeAddress1 => _$this._homeAddress1;
  set homeAddress1(String homeAddress1) => _$this._homeAddress1 = homeAddress1;

  String _homeAddress2;
  String get homeAddress2 => _$this._homeAddress2;
  set homeAddress2(String homeAddress2) => _$this._homeAddress2 = homeAddress2;

  String _homeCity;
  String get homeCity => _$this._homeCity;
  set homeCity(String homeCity) => _$this._homeCity = homeCity;

  String _homeState;
  String get homeState => _$this._homeState;
  set homeState(String homeState) => _$this._homeState = homeState;

  String _homePostalCode;
  String get homePostalCode => _$this._homePostalCode;
  set homePostalCode(String homePostalCode) =>
      _$this._homePostalCode = homePostalCode;

  String _homeCountryId;
  String get homeCountryId => _$this._homeCountryId;
  set homeCountryId(String homeCountryId) =>
      _$this._homeCountryId = homeCountryId;

  String _headOfficeAddress1;
  String get headOfficeAddress1 => _$this._headOfficeAddress1;
  set headOfficeAddress1(String headOfficeAddress1) =>
      _$this._headOfficeAddress1 = headOfficeAddress1;

  String _headOfficeAddress2;
  String get headOfficeAddress2 => _$this._headOfficeAddress2;
  set headOfficeAddress2(String headOfficeAddress2) =>
      _$this._headOfficeAddress2 = headOfficeAddress2;

  String _headOfficeCity;
  String get headOfficeCity => _$this._headOfficeCity;
  set headOfficeCity(String headOfficeCity) =>
      _$this._headOfficeCity = headOfficeCity;

  String _headOfficeState;
  String get headOfficeState => _$this._headOfficeState;
  set headOfficeState(String headOfficeState) =>
      _$this._headOfficeState = headOfficeState;

  String _headOfficePostalCode;
  String get headOfficePostalCode => _$this._headOfficePostalCode;
  set headOfficePostalCode(String headOfficePostalCode) =>
      _$this._headOfficePostalCode = headOfficePostalCode;

  String _headOfficeCountryId;
  String get headOfficeCountryId => _$this._headOfficeCountryId;
  set headOfficeCountryId(String headOfficeCountryId) =>
      _$this._headOfficeCountryId = headOfficeCountryId;

  String _mainAddress1;
  String get mainAddress1 => _$this._mainAddress1;
  set mainAddress1(String mainAddress1) => _$this._mainAddress1 = mainAddress1;

  String _mainAddress2;
  String get mainAddress2 => _$this._mainAddress2;
  set mainAddress2(String mainAddress2) => _$this._mainAddress2 = mainAddress2;

  String _mainCity;
  String get mainCity => _$this._mainCity;
  set mainCity(String mainCity) => _$this._mainCity = mainCity;

  String _mainState;
  String get mainState => _$this._mainState;
  set mainState(String mainState) => _$this._mainState = mainState;

  String _mainPostalCode;
  String get mainPostalCode => _$this._mainPostalCode;
  set mainPostalCode(String mainPostalCode) =>
      _$this._mainPostalCode = mainPostalCode;

  String _mainCountryId;
  String get mainCountryId => _$this._mainCountryId;
  set mainCountryId(String mainCountryId) =>
      _$this._mainCountryId = mainCountryId;

  ListBuilder<ContactEntity> _contacts;
  ListBuilder<ContactEntity> get contacts =>
      _$this._contacts ??= new ListBuilder<ContactEntity>();
  set contacts(ListBuilder<ContactEntity> contacts) =>
      _$this._contacts = contacts;

  String _routingId;
  String get routingId => _$this._routingId;
  set routingId(String routingId) => _$this._routingId = routingId;

  bool _isTaxExempt;
  bool get isTaxExempt => _$this._isTaxExempt;
  set isTaxExempt(bool isTaxExempt) => _$this._isTaxExempt = isTaxExempt;

  ListBuilder<ActivityEntity> _activities;
  ListBuilder<ActivityEntity> get activities =>
      _$this._activities ??= new ListBuilder<ActivityEntity>();
  set activities(ListBuilder<ActivityEntity> activities) =>
      _$this._activities = activities;

  ListBuilder<LedgerEntity> _ledger;
  ListBuilder<LedgerEntity> get ledger =>
      _$this._ledger ??= new ListBuilder<LedgerEntity>();
  set ledger(ListBuilder<LedgerEntity> ledger) => _$this._ledger = ledger;

  ListBuilder<GatewayTokenEntity> _gatewayTokens;
  ListBuilder<GatewayTokenEntity> get gatewayTokens =>
      _$this._gatewayTokens ??= new ListBuilder<GatewayTokenEntity>();
  set gatewayTokens(ListBuilder<GatewayTokenEntity> gatewayTokens) =>
      _$this._gatewayTokens = gatewayTokens;

  ListBuilder<DocumentEntity> _documents;
  ListBuilder<DocumentEntity> get documents =>
      _$this._documents ??= new ListBuilder<DocumentEntity>();
  set documents(ListBuilder<DocumentEntity> documents) =>
      _$this._documents = documents;

  ListBuilder<SystemLogEntity> _systemLogs;
  ListBuilder<SystemLogEntity> get systemLogs =>
      _$this._systemLogs ??= new ListBuilder<SystemLogEntity>();
  set systemLogs(ListBuilder<SystemLogEntity> systemLogs) =>
      _$this._systemLogs = systemLogs;

  bool _isChanged;
  bool get isChanged => _$this._isChanged;
  set isChanged(bool isChanged) => _$this._isChanged = isChanged;

  int _createdAt;
  int get createdAt => _$this._createdAt;
  set createdAt(int createdAt) => _$this._createdAt = createdAt;

  int _updatedAt;
  int get updatedAt => _$this._updatedAt;
  set updatedAt(int updatedAt) => _$this._updatedAt = updatedAt;

  int _archivedAt;
  int get archivedAt => _$this._archivedAt;
  set archivedAt(int archivedAt) => _$this._archivedAt = archivedAt;

  bool _isDeleted;
  bool get isDeleted => _$this._isDeleted;
  set isDeleted(bool isDeleted) => _$this._isDeleted = isDeleted;

  String _createdUserId;
  String get createdUserId => _$this._createdUserId;
  set createdUserId(String createdUserId) =>
      _$this._createdUserId = createdUserId;

  String _assignedUserId;
  String get assignedUserId => _$this._assignedUserId;
  set assignedUserId(String assignedUserId) =>
      _$this._assignedUserId = assignedUserId;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  ClientEntityBuilder() {
    ClientEntity._initializeBuilder(this);
  }

  ClientEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupId = $v.groupId;
      _loadedAt = $v.loadedAt;
      _name = $v.name;
      _displayName = $v.displayName;
      _balance = $v.balance;
      _creditBalance = $v.creditBalance;
      _paymentBalance = $v.paymentBalance;
      _paidToDate = $v.paidToDate;
      _clientHash = $v.clientHash;
      _address1 = $v.address1;
      _address2 = $v.address2;
      _city = $v.city;
      _state = $v.state;
      _postalCode = $v.postalCode;
      _countryId = $v.countryId;
      _phone = $v.phone;
      _privateNotes = $v.privateNotes;
      _publicNotes = $v.publicNotes;
      _website = $v.website;
      _industryId = $v.industryId;
      _sizeId = $v.sizeId;
      _vatNumber = $v.vatNumber;
      _idNumber = $v.idNumber;
      _number = $v.number;
      _shippingAddress1 = $v.shippingAddress1;
      _shippingAddress2 = $v.shippingAddress2;
      _shippingCity = $v.shippingCity;
      _shippingState = $v.shippingState;
      _shippingPostalCode = $v.shippingPostalCode;
      _shippingCountryId = $v.shippingCountryId;
      _settings = $v.settings.toBuilder();
      _lastLogin = $v.lastLogin;
      _customValue1 = $v.customValue1;
      _customValue2 = $v.customValue2;
      _customValue3 = $v.customValue3;
      _customValue4 = $v.customValue4;
      _suffix = $v.suffix;
      _legalBusinessName = $v.legalBusinessName;
      _email = $v.email;
      _region = $v.region;
      _fax = $v.fax;
      _phoneHome = $v.phoneHome;
      _gdId = $v.gdId;
      _phoneMain = $v.phoneMain;
      _phoneTollFree = $v.phoneTollFree;
      _phoneCell = $v.phoneCell;
      _homeAddress1 = $v.homeAddress1;
      _homeAddress2 = $v.homeAddress2;
      _homeCity = $v.homeCity;
      _homeState = $v.homeState;
      _homePostalCode = $v.homePostalCode;
      _homeCountryId = $v.homeCountryId;
      _headOfficeAddress1 = $v.headOfficeAddress1;
      _headOfficeAddress2 = $v.headOfficeAddress2;
      _headOfficeCity = $v.headOfficeCity;
      _headOfficeState = $v.headOfficeState;
      _headOfficePostalCode = $v.headOfficePostalCode;
      _headOfficeCountryId = $v.headOfficeCountryId;
      _mainAddress1 = $v.mainAddress1;
      _mainAddress2 = $v.mainAddress2;
      _mainCity = $v.mainCity;
      _mainState = $v.mainState;
      _mainPostalCode = $v.mainPostalCode;
      _mainCountryId = $v.mainCountryId;
      _contacts = $v.contacts.toBuilder();
      _routingId = $v.routingId;
      _isTaxExempt = $v.isTaxExempt;
      _activities = $v.activities.toBuilder();
      _ledger = $v.ledger.toBuilder();
      _gatewayTokens = $v.gatewayTokens.toBuilder();
      _documents = $v.documents.toBuilder();
      _systemLogs = $v.systemLogs.toBuilder();
      _isChanged = $v.isChanged;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _archivedAt = $v.archivedAt;
      _isDeleted = $v.isDeleted;
      _createdUserId = $v.createdUserId;
      _assignedUserId = $v.assignedUserId;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientEntity;
  }

  @override
  void update(void Function(ClientEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientEntity build() => _build();

  _$ClientEntity _build() {
    _$ClientEntity _$result;
    try {
      _$result = _$v ??
          new _$ClientEntity._(
              groupId: BuiltValueNullFieldError.checkNotNull(
                  groupId, r'ClientEntity', 'groupId'),
              loadedAt: loadedAt,
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ClientEntity', 'name'),
              displayName: BuiltValueNullFieldError.checkNotNull(
                  displayName, r'ClientEntity', 'displayName'),
              balance: BuiltValueNullFieldError.checkNotNull(
                  balance, r'ClientEntity', 'balance'),
              creditBalance: BuiltValueNullFieldError.checkNotNull(
                  creditBalance, r'ClientEntity', 'creditBalance'),
              paymentBalance: BuiltValueNullFieldError.checkNotNull(
                  paymentBalance, r'ClientEntity', 'paymentBalance'),
              paidToDate: BuiltValueNullFieldError.checkNotNull(
                  paidToDate, r'ClientEntity', 'paidToDate'),
              clientHash: BuiltValueNullFieldError.checkNotNull(
                  clientHash, r'ClientEntity', 'clientHash'),
              address1: BuiltValueNullFieldError.checkNotNull(address1, r'ClientEntity', 'address1'),
              address2: BuiltValueNullFieldError.checkNotNull(address2, r'ClientEntity', 'address2'),
              city: BuiltValueNullFieldError.checkNotNull(city, r'ClientEntity', 'city'),
              state: BuiltValueNullFieldError.checkNotNull(state, r'ClientEntity', 'state'),
              postalCode: BuiltValueNullFieldError.checkNotNull(postalCode, r'ClientEntity', 'postalCode'),
              countryId: BuiltValueNullFieldError.checkNotNull(countryId, r'ClientEntity', 'countryId'),
              phone: BuiltValueNullFieldError.checkNotNull(phone, r'ClientEntity', 'phone'),
              privateNotes: BuiltValueNullFieldError.checkNotNull(privateNotes, r'ClientEntity', 'privateNotes'),
              publicNotes: BuiltValueNullFieldError.checkNotNull(publicNotes, r'ClientEntity', 'publicNotes'),
              website: BuiltValueNullFieldError.checkNotNull(website, r'ClientEntity', 'website'),
              industryId: BuiltValueNullFieldError.checkNotNull(industryId, r'ClientEntity', 'industryId'),
              sizeId: BuiltValueNullFieldError.checkNotNull(sizeId, r'ClientEntity', 'sizeId'),
              vatNumber: BuiltValueNullFieldError.checkNotNull(vatNumber, r'ClientEntity', 'vatNumber'),
              idNumber: BuiltValueNullFieldError.checkNotNull(idNumber, r'ClientEntity', 'idNumber'),
              number: BuiltValueNullFieldError.checkNotNull(number, r'ClientEntity', 'number'),
              shippingAddress1: BuiltValueNullFieldError.checkNotNull(shippingAddress1, r'ClientEntity', 'shippingAddress1'),
              shippingAddress2: BuiltValueNullFieldError.checkNotNull(shippingAddress2, r'ClientEntity', 'shippingAddress2'),
              shippingCity: BuiltValueNullFieldError.checkNotNull(shippingCity, r'ClientEntity', 'shippingCity'),
              shippingState: BuiltValueNullFieldError.checkNotNull(shippingState, r'ClientEntity', 'shippingState'),
              shippingPostalCode: BuiltValueNullFieldError.checkNotNull(shippingPostalCode, r'ClientEntity', 'shippingPostalCode'),
              shippingCountryId: BuiltValueNullFieldError.checkNotNull(shippingCountryId, r'ClientEntity', 'shippingCountryId'),
              settings: settings.build(),
              lastLogin: BuiltValueNullFieldError.checkNotNull(lastLogin, r'ClientEntity', 'lastLogin'),
              customValue1: BuiltValueNullFieldError.checkNotNull(customValue1, r'ClientEntity', 'customValue1'),
              customValue2: BuiltValueNullFieldError.checkNotNull(customValue2, r'ClientEntity', 'customValue2'),
              customValue3: BuiltValueNullFieldError.checkNotNull(customValue3, r'ClientEntity', 'customValue3'),
              customValue4: BuiltValueNullFieldError.checkNotNull(customValue4, r'ClientEntity', 'customValue4'),
              suffix: suffix,
              legalBusinessName: legalBusinessName,
              email: email,
              region: region,
              fax: fax,
              phoneHome: phoneHome,
              gdId: gdId,
              phoneMain: phoneMain,
              phoneTollFree: phoneTollFree,
              phoneCell: phoneCell,
              homeAddress1: homeAddress1,
              homeAddress2: homeAddress2,
              homeCity: homeCity,
              homeState: homeState,
              homePostalCode: homePostalCode,
              homeCountryId: homeCountryId,
              headOfficeAddress1: headOfficeAddress1,
              headOfficeAddress2: headOfficeAddress2,
              headOfficeCity: headOfficeCity,
              headOfficeState: headOfficeState,
              headOfficePostalCode: headOfficePostalCode,
              headOfficeCountryId: headOfficeCountryId,
              mainAddress1: BuiltValueNullFieldError.checkNotNull(mainAddress1, r'ClientEntity', 'mainAddress1'),
              mainAddress2: BuiltValueNullFieldError.checkNotNull(mainAddress2, r'ClientEntity', 'mainAddress2'),
              mainCity: BuiltValueNullFieldError.checkNotNull(mainCity, r'ClientEntity', 'mainCity'),
              mainState: BuiltValueNullFieldError.checkNotNull(mainState, r'ClientEntity', 'mainState'),
              mainPostalCode: BuiltValueNullFieldError.checkNotNull(mainPostalCode, r'ClientEntity', 'mainPostalCode'),
              mainCountryId: BuiltValueNullFieldError.checkNotNull(mainCountryId, r'ClientEntity', 'mainCountryId'),
              contacts: contacts.build(),
              routingId: BuiltValueNullFieldError.checkNotNull(routingId, r'ClientEntity', 'routingId'),
              isTaxExempt: BuiltValueNullFieldError.checkNotNull(isTaxExempt, r'ClientEntity', 'isTaxExempt'),
              activities: activities.build(),
              ledger: ledger.build(),
              gatewayTokens: gatewayTokens.build(),
              documents: documents.build(),
              systemLogs: systemLogs.build(),
              isChanged: isChanged,
              createdAt: BuiltValueNullFieldError.checkNotNull(createdAt, r'ClientEntity', 'createdAt'),
              updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt, r'ClientEntity', 'updatedAt'),
              archivedAt: BuiltValueNullFieldError.checkNotNull(archivedAt, r'ClientEntity', 'archivedAt'),
              isDeleted: isDeleted,
              createdUserId: createdUserId,
              assignedUserId: assignedUserId,
              id: BuiltValueNullFieldError.checkNotNull(id, r'ClientEntity', 'id'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'settings';
        settings.build();

        _$failedField = 'contacts';
        contacts.build();

        _$failedField = 'activities';
        activities.build();
        _$failedField = 'ledger';
        ledger.build();
        _$failedField = 'gatewayTokens';
        gatewayTokens.build();
        _$failedField = 'documents';
        documents.build();
        _$failedField = 'systemLogs';
        systemLogs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ClientEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
