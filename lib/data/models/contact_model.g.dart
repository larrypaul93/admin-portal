// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactListResponse> _$contactListResponseSerializer =
    new _$ContactListResponseSerializer();
Serializer<ContactItemResponse> _$contactItemResponseSerializer =
    new _$ContactItemResponseSerializer();
Serializer<ContactEntity> _$contactEntitySerializer =
    new _$ContactEntitySerializer();

class _$ContactListResponseSerializer
    implements StructuredSerializer<ContactListResponse> {
  @override
  final Iterable<Type> types = const [
    ContactListResponse,
    _$ContactListResponse
  ];
  @override
  final String wireName = 'ContactListResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ContactListResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ContactEntity)])),
    ];

    return result;
  }

  @override
  ContactListResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactListResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ContactEntity)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ContactItemResponseSerializer
    implements StructuredSerializer<ContactItemResponse> {
  @override
  final Iterable<Type> types = const [
    ContactItemResponse,
    _$ContactItemResponse
  ];
  @override
  final String wireName = 'ContactItemResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ContactItemResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(ContactEntity)),
    ];

    return result;
  }

  @override
  ContactItemResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactItemResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(ContactEntity)) as ContactEntity);
          break;
      }
    }

    return result.build();
  }
}

class _$ContactEntitySerializer implements StructuredSerializer<ContactEntity> {
  @override
  final Iterable<Type> types = const [ContactEntity, _$ContactEntity];
  @override
  final String wireName = 'ContactEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, ContactEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'first_name',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'last_name',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'contact_key',
      serializers.serialize(object.contactKey,
          specifiedType: const FullType(String)),
      'is_primary',
      serializers.serialize(object.isPrimary,
          specifiedType: const FullType(bool)),
      'send_email',
      serializers.serialize(object.sendEmail,
          specifiedType: const FullType(bool)),
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
      'region',
      serializers.serialize(object.region,
          specifiedType: const FullType(String)),
      'fax',
      serializers.serialize(object.fax, specifiedType: const FullType(String)),
      'phone_home',
      serializers.serialize(object.phoneHome,
          specifiedType: const FullType(String)),
      'phone_main',
      serializers.serialize(object.phoneMain,
          specifiedType: const FullType(String)),
      'phone_toll_free',
      serializers.serialize(object.phoneTollFree,
          specifiedType: const FullType(String)),
      'phone_cell',
      serializers.serialize(object.phoneCell,
          specifiedType: const FullType(String)),
      'home_address1',
      serializers.serialize(object.homeAddress1,
          specifiedType: const FullType(String)),
      'home_address2',
      serializers.serialize(object.homeAddress2,
          specifiedType: const FullType(String)),
      'home_city',
      serializers.serialize(object.homeCity,
          specifiedType: const FullType(String)),
      'home_state',
      serializers.serialize(object.homeState,
          specifiedType: const FullType(String)),
      'home_postal_code',
      serializers.serialize(object.homePostalCode,
          specifiedType: const FullType(String)),
      'home_country_id',
      serializers.serialize(object.homeCountryId,
          specifiedType: const FullType(String)),
      'head_office_address1',
      serializers.serialize(object.headOfficeAddress1,
          specifiedType: const FullType(String)),
      'head_office_address2',
      serializers.serialize(object.headOfficeAddress2,
          specifiedType: const FullType(String)),
      'head_office_city',
      serializers.serialize(object.headOfficeCity,
          specifiedType: const FullType(String)),
      'head_office_state',
      serializers.serialize(object.headOfficeState,
          specifiedType: const FullType(String)),
      'head_office_postal_code',
      serializers.serialize(object.headOfficePostalCode,
          specifiedType: const FullType(String)),
      'head_office_country_id',
      serializers.serialize(object.headOfficeCountryId,
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
      'last_login',
      serializers.serialize(object.lastLogin,
          specifiedType: const FullType(int)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'number',
      serializers.serialize(object.number,
          specifiedType: const FullType(String)),
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
    value = object.groupId;
    if (value != null) {
      result
        ..add('group_settings_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.loadedAt;
    if (value != null) {
      result
        ..add('loadedAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ContactEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_key':
          result.contactKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_primary':
          result.isPrimary = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'send_email':
          result.sendEmail = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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
        case 'last_login':
          result.lastLogin = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'group_settings_id':
          result.groupId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loadedAt':
          result.loadedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$ContactListResponse extends ContactListResponse {
  @override
  final BuiltList<ContactEntity> data;

  factory _$ContactListResponse(
          [void Function(ContactListResponseBuilder) updates]) =>
      (new ContactListResponseBuilder()..update(updates))._build();

  _$ContactListResponse._({this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'ContactListResponse', 'data');
  }

  @override
  ContactListResponse rebuild(
          void Function(ContactListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactListResponseBuilder toBuilder() =>
      new ContactListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactListResponse && data == other.data;
  }

  int __hashCode;
  @override
  int get hashCode {
    return __hashCode ??= $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactListResponse')
          ..add('data', data))
        .toString();
  }
}

class ContactListResponseBuilder
    implements Builder<ContactListResponse, ContactListResponseBuilder> {
  _$ContactListResponse _$v;

  ListBuilder<ContactEntity> _data;
  ListBuilder<ContactEntity> get data =>
      _$this._data ??= new ListBuilder<ContactEntity>();
  set data(ListBuilder<ContactEntity> data) => _$this._data = data;

  ContactListResponseBuilder();

  ContactListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactListResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactListResponse;
  }

  @override
  void update(void Function(ContactListResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactListResponse build() => _build();

  _$ContactListResponse _build() {
    _$ContactListResponse _$result;
    try {
      _$result = _$v ?? new _$ContactListResponse._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ContactListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ContactItemResponse extends ContactItemResponse {
  @override
  final ContactEntity data;

  factory _$ContactItemResponse(
          [void Function(ContactItemResponseBuilder) updates]) =>
      (new ContactItemResponseBuilder()..update(updates))._build();

  _$ContactItemResponse._({this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'ContactItemResponse', 'data');
  }

  @override
  ContactItemResponse rebuild(
          void Function(ContactItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactItemResponseBuilder toBuilder() =>
      new ContactItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactItemResponse && data == other.data;
  }

  int __hashCode;
  @override
  int get hashCode {
    return __hashCode ??= $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactItemResponse')
          ..add('data', data))
        .toString();
  }
}

class ContactItemResponseBuilder
    implements Builder<ContactItemResponse, ContactItemResponseBuilder> {
  _$ContactItemResponse _$v;

  ContactEntityBuilder _data;
  ContactEntityBuilder get data => _$this._data ??= new ContactEntityBuilder();
  set data(ContactEntityBuilder data) => _$this._data = data;

  ContactItemResponseBuilder();

  ContactItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactItemResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactItemResponse;
  }

  @override
  void update(void Function(ContactItemResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactItemResponse build() => _build();

  _$ContactItemResponse _build() {
    _$ContactItemResponse _$result;
    try {
      _$result = _$v ?? new _$ContactItemResponse._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ContactItemResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ContactEntity extends ContactEntity {
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String phone;
  @override
  final String contactKey;
  @override
  final bool isPrimary;
  @override
  final bool sendEmail;
  @override
  final String customValue1;
  @override
  final String customValue2;
  @override
  final String customValue3;
  @override
  final String customValue4;
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
  final String region;
  @override
  final String fax;
  @override
  final String phoneHome;
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
  final int lastLogin;
  @override
  final String link;
  @override
  final String groupId;
  @override
  final int loadedAt;
  @override
  final String number;
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

  factory _$ContactEntity([void Function(ContactEntityBuilder) updates]) =>
      (new ContactEntityBuilder()..update(updates))._build();

  _$ContactEntity._(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.contactKey,
      this.isPrimary,
      this.sendEmail,
      this.customValue1,
      this.customValue2,
      this.customValue3,
      this.customValue4,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postalCode,
      this.countryId,
      this.region,
      this.fax,
      this.phoneHome,
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
      this.lastLogin,
      this.link,
      this.groupId,
      this.loadedAt,
      this.number,
      this.isChanged,
      this.createdAt,
      this.updatedAt,
      this.archivedAt,
      this.isDeleted,
      this.createdUserId,
      this.assignedUserId,
      this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'ContactEntity', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        lastName, r'ContactEntity', 'lastName');
    BuiltValueNullFieldError.checkNotNull(email, r'ContactEntity', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, r'ContactEntity', 'password');
    BuiltValueNullFieldError.checkNotNull(phone, r'ContactEntity', 'phone');
    BuiltValueNullFieldError.checkNotNull(
        contactKey, r'ContactEntity', 'contactKey');
    BuiltValueNullFieldError.checkNotNull(
        isPrimary, r'ContactEntity', 'isPrimary');
    BuiltValueNullFieldError.checkNotNull(
        sendEmail, r'ContactEntity', 'sendEmail');
    BuiltValueNullFieldError.checkNotNull(
        customValue1, r'ContactEntity', 'customValue1');
    BuiltValueNullFieldError.checkNotNull(
        customValue2, r'ContactEntity', 'customValue2');
    BuiltValueNullFieldError.checkNotNull(
        customValue3, r'ContactEntity', 'customValue3');
    BuiltValueNullFieldError.checkNotNull(
        customValue4, r'ContactEntity', 'customValue4');
    BuiltValueNullFieldError.checkNotNull(
        address1, r'ContactEntity', 'address1');
    BuiltValueNullFieldError.checkNotNull(
        address2, r'ContactEntity', 'address2');
    BuiltValueNullFieldError.checkNotNull(city, r'ContactEntity', 'city');
    BuiltValueNullFieldError.checkNotNull(state, r'ContactEntity', 'state');
    BuiltValueNullFieldError.checkNotNull(
        postalCode, r'ContactEntity', 'postalCode');
    BuiltValueNullFieldError.checkNotNull(
        countryId, r'ContactEntity', 'countryId');
    BuiltValueNullFieldError.checkNotNull(region, r'ContactEntity', 'region');
    BuiltValueNullFieldError.checkNotNull(fax, r'ContactEntity', 'fax');
    BuiltValueNullFieldError.checkNotNull(
        phoneHome, r'ContactEntity', 'phoneHome');
    BuiltValueNullFieldError.checkNotNull(
        phoneMain, r'ContactEntity', 'phoneMain');
    BuiltValueNullFieldError.checkNotNull(
        phoneTollFree, r'ContactEntity', 'phoneTollFree');
    BuiltValueNullFieldError.checkNotNull(
        phoneCell, r'ContactEntity', 'phoneCell');
    BuiltValueNullFieldError.checkNotNull(
        homeAddress1, r'ContactEntity', 'homeAddress1');
    BuiltValueNullFieldError.checkNotNull(
        homeAddress2, r'ContactEntity', 'homeAddress2');
    BuiltValueNullFieldError.checkNotNull(
        homeCity, r'ContactEntity', 'homeCity');
    BuiltValueNullFieldError.checkNotNull(
        homeState, r'ContactEntity', 'homeState');
    BuiltValueNullFieldError.checkNotNull(
        homePostalCode, r'ContactEntity', 'homePostalCode');
    BuiltValueNullFieldError.checkNotNull(
        homeCountryId, r'ContactEntity', 'homeCountryId');
    BuiltValueNullFieldError.checkNotNull(
        headOfficeAddress1, r'ContactEntity', 'headOfficeAddress1');
    BuiltValueNullFieldError.checkNotNull(
        headOfficeAddress2, r'ContactEntity', 'headOfficeAddress2');
    BuiltValueNullFieldError.checkNotNull(
        headOfficeCity, r'ContactEntity', 'headOfficeCity');
    BuiltValueNullFieldError.checkNotNull(
        headOfficeState, r'ContactEntity', 'headOfficeState');
    BuiltValueNullFieldError.checkNotNull(
        headOfficePostalCode, r'ContactEntity', 'headOfficePostalCode');
    BuiltValueNullFieldError.checkNotNull(
        headOfficeCountryId, r'ContactEntity', 'headOfficeCountryId');
    BuiltValueNullFieldError.checkNotNull(
        mainAddress1, r'ContactEntity', 'mainAddress1');
    BuiltValueNullFieldError.checkNotNull(
        mainAddress2, r'ContactEntity', 'mainAddress2');
    BuiltValueNullFieldError.checkNotNull(
        mainCity, r'ContactEntity', 'mainCity');
    BuiltValueNullFieldError.checkNotNull(
        mainState, r'ContactEntity', 'mainState');
    BuiltValueNullFieldError.checkNotNull(
        mainPostalCode, r'ContactEntity', 'mainPostalCode');
    BuiltValueNullFieldError.checkNotNull(
        mainCountryId, r'ContactEntity', 'mainCountryId');
    BuiltValueNullFieldError.checkNotNull(
        lastLogin, r'ContactEntity', 'lastLogin');
    BuiltValueNullFieldError.checkNotNull(link, r'ContactEntity', 'link');
    BuiltValueNullFieldError.checkNotNull(number, r'ContactEntity', 'number');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'ContactEntity', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'ContactEntity', 'updatedAt');
    BuiltValueNullFieldError.checkNotNull(
        archivedAt, r'ContactEntity', 'archivedAt');
    BuiltValueNullFieldError.checkNotNull(id, r'ContactEntity', 'id');
  }

  @override
  ContactEntity rebuild(void Function(ContactEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactEntityBuilder toBuilder() => new ContactEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactEntity &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        password == other.password &&
        phone == other.phone &&
        contactKey == other.contactKey &&
        isPrimary == other.isPrimary &&
        sendEmail == other.sendEmail &&
        customValue1 == other.customValue1 &&
        customValue2 == other.customValue2 &&
        customValue3 == other.customValue3 &&
        customValue4 == other.customValue4 &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        city == other.city &&
        state == other.state &&
        postalCode == other.postalCode &&
        countryId == other.countryId &&
        region == other.region &&
        fax == other.fax &&
        phoneHome == other.phoneHome &&
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
        lastLogin == other.lastLogin &&
        link == other.link &&
        groupId == other.groupId &&
        number == other.number &&
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
    return __hashCode ??= $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, firstName.hashCode), lastName.hashCode), email.hashCode), password.hashCode), phone.hashCode), contactKey.hashCode), isPrimary.hashCode), sendEmail.hashCode), customValue1.hashCode), customValue2.hashCode), customValue3.hashCode), customValue4.hashCode), address1.hashCode), address2.hashCode), city.hashCode), state.hashCode), postalCode.hashCode), countryId.hashCode), region.hashCode), fax.hashCode), phoneHome.hashCode), phoneMain.hashCode), phoneTollFree.hashCode), phoneCell.hashCode), homeAddress1.hashCode), homeAddress2.hashCode), homeCity.hashCode), homeState.hashCode), homePostalCode.hashCode), homeCountryId.hashCode), headOfficeAddress1.hashCode), headOfficeAddress2.hashCode), headOfficeCity.hashCode), headOfficeState.hashCode), headOfficePostalCode.hashCode),
                                                                                headOfficeCountryId.hashCode),
                                                                            mainAddress1.hashCode),
                                                                        mainAddress2.hashCode),
                                                                    mainCity.hashCode),
                                                                mainState.hashCode),
                                                            mainPostalCode.hashCode),
                                                        mainCountryId.hashCode),
                                                    lastLogin.hashCode),
                                                link.hashCode),
                                            groupId.hashCode),
                                        number.hashCode),
                                    isChanged.hashCode),
                                createdAt.hashCode),
                            updatedAt.hashCode),
                        archivedAt.hashCode),
                    isDeleted.hashCode),
                createdUserId.hashCode),
            assignedUserId.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactEntity')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('password', password)
          ..add('phone', phone)
          ..add('contactKey', contactKey)
          ..add('isPrimary', isPrimary)
          ..add('sendEmail', sendEmail)
          ..add('customValue1', customValue1)
          ..add('customValue2', customValue2)
          ..add('customValue3', customValue3)
          ..add('customValue4', customValue4)
          ..add('address1', address1)
          ..add('address2', address2)
          ..add('city', city)
          ..add('state', state)
          ..add('postalCode', postalCode)
          ..add('countryId', countryId)
          ..add('region', region)
          ..add('fax', fax)
          ..add('phoneHome', phoneHome)
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
          ..add('lastLogin', lastLogin)
          ..add('link', link)
          ..add('groupId', groupId)
          ..add('loadedAt', loadedAt)
          ..add('number', number)
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

class ContactEntityBuilder
    implements Builder<ContactEntity, ContactEntityBuilder> {
  _$ContactEntity _$v;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _contactKey;
  String get contactKey => _$this._contactKey;
  set contactKey(String contactKey) => _$this._contactKey = contactKey;

  bool _isPrimary;
  bool get isPrimary => _$this._isPrimary;
  set isPrimary(bool isPrimary) => _$this._isPrimary = isPrimary;

  bool _sendEmail;
  bool get sendEmail => _$this._sendEmail;
  set sendEmail(bool sendEmail) => _$this._sendEmail = sendEmail;

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

  String _region;
  String get region => _$this._region;
  set region(String region) => _$this._region = region;

  String _fax;
  String get fax => _$this._fax;
  set fax(String fax) => _$this._fax = fax;

  String _phoneHome;
  String get phoneHome => _$this._phoneHome;
  set phoneHome(String phoneHome) => _$this._phoneHome = phoneHome;

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

  int _lastLogin;
  int get lastLogin => _$this._lastLogin;
  set lastLogin(int lastLogin) => _$this._lastLogin = lastLogin;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  String _groupId;
  String get groupId => _$this._groupId;
  set groupId(String groupId) => _$this._groupId = groupId;

  int _loadedAt;
  int get loadedAt => _$this._loadedAt;
  set loadedAt(int loadedAt) => _$this._loadedAt = loadedAt;

  String _number;
  String get number => _$this._number;
  set number(String number) => _$this._number = number;

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

  ContactEntityBuilder() {
    ContactEntity._initializeBuilder(this);
  }

  ContactEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _email = $v.email;
      _password = $v.password;
      _phone = $v.phone;
      _contactKey = $v.contactKey;
      _isPrimary = $v.isPrimary;
      _sendEmail = $v.sendEmail;
      _customValue1 = $v.customValue1;
      _customValue2 = $v.customValue2;
      _customValue3 = $v.customValue3;
      _customValue4 = $v.customValue4;
      _address1 = $v.address1;
      _address2 = $v.address2;
      _city = $v.city;
      _state = $v.state;
      _postalCode = $v.postalCode;
      _countryId = $v.countryId;
      _region = $v.region;
      _fax = $v.fax;
      _phoneHome = $v.phoneHome;
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
      _lastLogin = $v.lastLogin;
      _link = $v.link;
      _groupId = $v.groupId;
      _loadedAt = $v.loadedAt;
      _number = $v.number;
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
  void replace(ContactEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactEntity;
  }

  @override
  void update(void Function(ContactEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactEntity build() => _build();

  _$ContactEntity _build() {
    final _$result = _$v ??
        new _$ContactEntity._(
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'ContactEntity', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'ContactEntity', 'lastName'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'ContactEntity', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'ContactEntity', 'password'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'ContactEntity', 'phone'),
            contactKey: BuiltValueNullFieldError.checkNotNull(
                contactKey, r'ContactEntity', 'contactKey'),
            isPrimary: BuiltValueNullFieldError.checkNotNull(
                isPrimary, r'ContactEntity', 'isPrimary'),
            sendEmail: BuiltValueNullFieldError.checkNotNull(
                sendEmail, r'ContactEntity', 'sendEmail'),
            customValue1: BuiltValueNullFieldError.checkNotNull(
                customValue1, r'ContactEntity', 'customValue1'),
            customValue2: BuiltValueNullFieldError.checkNotNull(customValue2, r'ContactEntity', 'customValue2'),
            customValue3: BuiltValueNullFieldError.checkNotNull(customValue3, r'ContactEntity', 'customValue3'),
            customValue4: BuiltValueNullFieldError.checkNotNull(customValue4, r'ContactEntity', 'customValue4'),
            address1: BuiltValueNullFieldError.checkNotNull(address1, r'ContactEntity', 'address1'),
            address2: BuiltValueNullFieldError.checkNotNull(address2, r'ContactEntity', 'address2'),
            city: BuiltValueNullFieldError.checkNotNull(city, r'ContactEntity', 'city'),
            state: BuiltValueNullFieldError.checkNotNull(state, r'ContactEntity', 'state'),
            postalCode: BuiltValueNullFieldError.checkNotNull(postalCode, r'ContactEntity', 'postalCode'),
            countryId: BuiltValueNullFieldError.checkNotNull(countryId, r'ContactEntity', 'countryId'),
            region: BuiltValueNullFieldError.checkNotNull(region, r'ContactEntity', 'region'),
            fax: BuiltValueNullFieldError.checkNotNull(fax, r'ContactEntity', 'fax'),
            phoneHome: BuiltValueNullFieldError.checkNotNull(phoneHome, r'ContactEntity', 'phoneHome'),
            phoneMain: BuiltValueNullFieldError.checkNotNull(phoneMain, r'ContactEntity', 'phoneMain'),
            phoneTollFree: BuiltValueNullFieldError.checkNotNull(phoneTollFree, r'ContactEntity', 'phoneTollFree'),
            phoneCell: BuiltValueNullFieldError.checkNotNull(phoneCell, r'ContactEntity', 'phoneCell'),
            homeAddress1: BuiltValueNullFieldError.checkNotNull(homeAddress1, r'ContactEntity', 'homeAddress1'),
            homeAddress2: BuiltValueNullFieldError.checkNotNull(homeAddress2, r'ContactEntity', 'homeAddress2'),
            homeCity: BuiltValueNullFieldError.checkNotNull(homeCity, r'ContactEntity', 'homeCity'),
            homeState: BuiltValueNullFieldError.checkNotNull(homeState, r'ContactEntity', 'homeState'),
            homePostalCode: BuiltValueNullFieldError.checkNotNull(homePostalCode, r'ContactEntity', 'homePostalCode'),
            homeCountryId: BuiltValueNullFieldError.checkNotNull(homeCountryId, r'ContactEntity', 'homeCountryId'),
            headOfficeAddress1: BuiltValueNullFieldError.checkNotNull(headOfficeAddress1, r'ContactEntity', 'headOfficeAddress1'),
            headOfficeAddress2: BuiltValueNullFieldError.checkNotNull(headOfficeAddress2, r'ContactEntity', 'headOfficeAddress2'),
            headOfficeCity: BuiltValueNullFieldError.checkNotNull(headOfficeCity, r'ContactEntity', 'headOfficeCity'),
            headOfficeState: BuiltValueNullFieldError.checkNotNull(headOfficeState, r'ContactEntity', 'headOfficeState'),
            headOfficePostalCode: BuiltValueNullFieldError.checkNotNull(headOfficePostalCode, r'ContactEntity', 'headOfficePostalCode'),
            headOfficeCountryId: BuiltValueNullFieldError.checkNotNull(headOfficeCountryId, r'ContactEntity', 'headOfficeCountryId'),
            mainAddress1: BuiltValueNullFieldError.checkNotNull(mainAddress1, r'ContactEntity', 'mainAddress1'),
            mainAddress2: BuiltValueNullFieldError.checkNotNull(mainAddress2, r'ContactEntity', 'mainAddress2'),
            mainCity: BuiltValueNullFieldError.checkNotNull(mainCity, r'ContactEntity', 'mainCity'),
            mainState: BuiltValueNullFieldError.checkNotNull(mainState, r'ContactEntity', 'mainState'),
            mainPostalCode: BuiltValueNullFieldError.checkNotNull(mainPostalCode, r'ContactEntity', 'mainPostalCode'),
            mainCountryId: BuiltValueNullFieldError.checkNotNull(mainCountryId, r'ContactEntity', 'mainCountryId'),
            lastLogin: BuiltValueNullFieldError.checkNotNull(lastLogin, r'ContactEntity', 'lastLogin'),
            link: BuiltValueNullFieldError.checkNotNull(link, r'ContactEntity', 'link'),
            groupId: groupId,
            loadedAt: loadedAt,
            number: BuiltValueNullFieldError.checkNotNull(number, r'ContactEntity', 'number'),
            isChanged: isChanged,
            createdAt: BuiltValueNullFieldError.checkNotNull(createdAt, r'ContactEntity', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt, r'ContactEntity', 'updatedAt'),
            archivedAt: BuiltValueNullFieldError.checkNotNull(archivedAt, r'ContactEntity', 'archivedAt'),
            isDeleted: isDeleted,
            createdUserId: createdUserId,
            assignedUserId: assignedUserId,
            id: BuiltValueNullFieldError.checkNotNull(id, r'ContactEntity', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
