import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/group_model.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/utils/formatting.dart';

part 'contact_model.g.dart';

abstract class ContactListResponse
    implements Built<ContactListResponse, ContactListResponseBuilder> {
  factory ContactListResponse([void updates(ContactListResponseBuilder b)]) =
      _$ContactListResponse;

  ContactListResponse._();

  @override
  @memoized
  int get hashCode;

  BuiltList<ContactEntity> get data;

  static Serializer<ContactListResponse> get serializer =>
      _$contactListResponseSerializer;
}

abstract class ContactItemResponse
    implements Built<ContactItemResponse, ContactItemResponseBuilder> {
  factory ContactItemResponse([void updates(ContactItemResponseBuilder b)]) =
      _$ContactItemResponse;

  ContactItemResponse._();

  @override
  @memoized
  int get hashCode;

  ContactEntity get data;

  static Serializer<ContactItemResponse> get serializer =>
      _$contactItemResponseSerializer;
}

class ContactFields {
  // STARTER: fields - do not remove comment
  static const String fullName = 'full_name';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String email = 'email';
  static const String phone = 'phone';
  static const String custom1 = 'custom1';
  static const String custom2 = 'custom2';
  static const String custom3 = 'custom3';
  static const String custom4 = 'custom4';
}

abstract class ContactEntity extends Object
    with BaseEntity, SelectableEntity
    implements Built<ContactEntity, ContactEntityBuilder> {
  // STARTER: properties - do not remove comment

  factory ContactEntity({
    String id,
    AppState state,
    UserEntity user,
    GroupEntity group,
  }) {
    return _$ContactEntity._(
        id: id ?? BaseEntity.nextId,
        isChanged: false,
        isDeleted: false,
        createdAt: 0,
        updatedAt: 0,
        // clientId: '',
        createdUserId: '',
        assignedUserId: user?.id ?? '',
        groupId: group?.id ?? '',
        number: '',
        archivedAt: 0,
        firstName: '',
        lastName: '',
        email: '',
        password: '',
        phone: '',
        contactKey: '',
        isPrimary: false,
        sendEmail: true,
        customValue1: '',
        customValue2: '',
        customValue3: '',
        customValue4: '',
        lastLogin: 0,
        link: '',
        address1: '',
        address2: '',
        city: '',
        state: '',
        postalCode: '',
        countryId: '',
        region: '',
        phoneHome: '',
        phoneMain: '',
        phoneTollFree: '',
        phoneCell: '',
        fax: '',
        homeAddress1: '',
        homeAddress2: '',
        homeCity: '',
        homeState: '',
        homePostalCode: '',
        homeCountryId: '',
        headOfficeAddress1: '',
        headOfficeAddress2: '',
        headOfficeCity: '',
        headOfficeState: '',
        headOfficePostalCode: '',
        headOfficeCountryId: '',
        mainAddress1: '',
        mainAddress2: '',
        mainCity: '',
        mainState: '',
        mainPostalCode: '',
        mainCountryId: ''
        // STARTER: constructor - do not remove comment
        );
  }

  ContactEntity._();

  @override
  @memoized
  int get hashCode;

  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  String get email;

  String get password;

  String get phone;

  // @BuiltValueField(wireName: 'client_id')
  // String get clientId;

  @BuiltValueField(wireName: 'contact_key')
  String get contactKey;

  @BuiltValueField(wireName: 'is_primary')
  bool get isPrimary;

  @BuiltValueField(wireName: 'send_email')
  bool get sendEmail;

  @BuiltValueField(wireName: 'custom_value1')
  String get customValue1;

  @BuiltValueField(wireName: 'custom_value2')
  String get customValue2;

  @BuiltValueField(wireName: 'custom_value3')
  String get customValue3;

  @BuiltValueField(wireName: 'custom_value4')
  String get customValue4;

  String get address1;

  String get address2;

  String get city;

  String get state;

  @BuiltValueField(wireName: 'postal_code')
  String get postalCode;

  @BuiltValueField(wireName: 'country_id')
  String get countryId;

  String get region;

  String get fax;

  @BuiltValueField(wireName: 'phone_home')
  String get phoneHome;

  @BuiltValueField(wireName: 'phone_main')
  String get phoneMain;

  @BuiltValueField(wireName: 'phone_toll_free')
  String get phoneTollFree;

  @BuiltValueField(wireName: 'phone_cell')
  String get phoneCell;

  @BuiltValueField(wireName: 'home_address1')
  String get homeAddress1;

  @BuiltValueField(wireName: 'home_address2')
  String get homeAddress2;

  @BuiltValueField(wireName: 'home_city')
  String get homeCity;

  @BuiltValueField(wireName: 'home_state')
  String get homeState;

  @BuiltValueField(wireName: 'home_postal_code')
  String get homePostalCode;

  @BuiltValueField(wireName: 'home_country_id')
  String get homeCountryId;

  @BuiltValueField(wireName: 'head_office_address1')
  String get headOfficeAddress1;

  @BuiltValueField(wireName: 'head_office_address2')
  String get headOfficeAddress2;

  @BuiltValueField(wireName: 'head_office_city')
  String get headOfficeCity;

  @BuiltValueField(wireName: 'head_office_state')
  String get headOfficeState;

  @BuiltValueField(wireName: 'head_office_postal_code')
  String get headOfficePostalCode;

  @BuiltValueField(wireName: 'head_office_country_id')
  String get headOfficeCountryId;

  @BuiltValueField(wireName: 'main_address1')
  String get mainAddress1;

  @BuiltValueField(wireName: 'main_address2')
  String get mainAddress2;

  @BuiltValueField(wireName: 'main_city')
  String get mainCity;

  @BuiltValueField(wireName: 'main_state')
  String get mainState;

  @BuiltValueField(wireName: 'main_postal_code')
  String get mainPostalCode;

  @BuiltValueField(wireName: 'main_country_id')
  String get mainCountryId;

  @BuiltValueField(wireName: 'last_login')
  int get lastLogin;

  String get link;

  String get silentLink => '$link?silent=true';

  String get fullName {
    return (firstName + ' ' + lastName).trim();
  }

  String get fullNameOrEmail {
    if (fullName.isNotEmpty) {
      return fullName;
    } else {
      return email;
    }
  }

  String get fullNameWithEmail {
    String name = fullName;

    if (email.isNotEmpty) {
      if (name.isEmpty) {
        name += email;
      } else {
        name += ' • $email';
      }
    }

    return name;
  }

  @override
  EntityType get entityType => EntityType.contact;

  String get displayName {
    // STARTER: display name - do not remove comment
    return fullName;
  }

  @override
  List<EntityAction> getActions(
      {UserCompanyEntity userCompany,
      ClientEntity client,
      bool includeEdit = false,
      bool multiselect = false}) {
    final actions = <EntityAction>[];

    if (!isDeleted && !multiselect) {
      actions.add(EntityAction.clientPortal);

      if (!multiselect && includeEdit && userCompany.canEditEntity(this)) {
        actions.add(EntityAction.edit);
      }
    }

    if (actions.isNotEmpty && actions.last != null) {
      actions.add(null);
    }

    return actions..addAll(super.getActions(userCompany: userCompany));
  }

  int compareTo(ContactEntity contact, String sortField, bool sortAscending) {
    int response = 0;
    final contactA = sortAscending ? this : contact;
    final contactB = sortAscending ? contact : this;

    switch (sortField) {
      // STARTER: sort switch - do not remove comment
      default:
        print('## ERROR: sort by contact.$sortField is not implemented');
        break;
    }

    if (response == 0) {
      // STARTER: sort default - do not remove comment
      return contactA.firstName.compareTo(contactB.firstName);
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
  String get listDisplayName {
    return fullNameOrEmail;
  }

  @nullable
  @BuiltValueField(wireName: 'group_settings_id')
  String get groupId;

  @nullable
  @BuiltValueField(compare: false)
  int get loadedAt;

  bool get isStale {
    if (!isLoaded) {
      return true;
    }

    return DateTime.now().millisecondsSinceEpoch - loadedAt >
        kMillisecondsToRefreshActivities;
  }

  @BuiltValueField(wireName: 'number')
  String get number;

  bool get isLoaded => loadedAt != null && loadedAt > 0;

  @override
  double get listDisplayAmount => null;

  @override
  FormatNumberType get listDisplayAmountType => FormatNumberType.money;

  static void _initializeBuilder(ContactEntityBuilder builder) =>
      builder..number = '';
  static Serializer<ContactEntity> get serializer => _$contactEntitySerializer;
}
