// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:contacts_service/contacts_service.dart';

// Project imports:
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/static/static_selectors.dart';
import 'package:invoiceninja_flutter/ui/app/form_card.dart';
import 'package:invoiceninja_flutter/ui/app/forms/app_dropdown_button.dart';
import 'package:invoiceninja_flutter/ui/app/forms/custom_field.dart';
import 'package:invoiceninja_flutter/ui/app/forms/decorated_form_field.dart';
import 'package:invoiceninja_flutter/ui/app/forms/dynamic_selector.dart';
import 'package:invoiceninja_flutter/ui/app/forms/user_picker.dart';
import 'package:invoiceninja_flutter/ui/client/edit/client_edit_vm.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/contacts.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

class ClientEditDetails extends StatefulWidget {
  const ClientEditDetails({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final ClientEditVM viewModel;

  @override
  ClientEditDetailsState createState() => ClientEditDetailsState();
}

class ClientEditDetailsState extends State<ClientEditDetails> {
  final _numberController = TextEditingController();
  final _nameController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _vatNumberController = TextEditingController();
  final _websiteController = TextEditingController();
  final _phoneController = TextEditingController();
  final _routingIdController = TextEditingController();
  final _custom1Controller = TextEditingController();
  final _custom2Controller = TextEditingController();
  final _custom3Controller = TextEditingController();
  final _custom4Controller = TextEditingController();

  final _suffixController = TextEditingController();
  final _legalBusinessNameController = TextEditingController();
  final _regionController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneHomeController = TextEditingController();
  final _phoneMainController = TextEditingController();
  final _phoneTollFreeController = TextEditingController();
  final _phoneCellController = TextEditingController();
  final _faxController = TextEditingController();

  final regions = <String>[
    'GVRD',
    'FVRD',
    'RMOW',
    'CRD',
    'SCRD',
    'SLRD',
    'RDOS',
    'GTA',
    'SF'
  ]
      .map((option) => DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          ))
      .toList();
  // final _personalController = BoolController();

  static final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_clientEditDetails');
  final _debouncer = Debouncer();
  List<TextEditingController> _controllers;

  @override
  void didChangeDependencies() {
    _controllers = [
      _numberController,
      _nameController,
      _idNumberController,
      _vatNumberController,
      _websiteController,
      _phoneController,
      _routingIdController,
      _custom1Controller,
      _custom2Controller,
      _custom3Controller,
      _custom4Controller,
      _suffixController,
      _legalBusinessNameController,
      _emailController,
      _phoneHomeController,
      _phoneMainController,
      _phoneTollFreeController,
      _phoneCellController,
      _faxController,
      _regionController
    ];

    _controllers
        .forEach((dynamic controller) => controller.removeListener(_onChanged));

    final client = widget.viewModel.client;
    _numberController.text = client.number;
    _nameController.text = client.name;
    _idNumberController.text = client.idNumber;
    _vatNumberController.text = client.vatNumber;
    _websiteController.text = client.website;
    _phoneController.text = client.phone;
    _routingIdController.text = client.routingId;
    _custom1Controller.text = client.customValue1;
    _custom2Controller.text = client.customValue2;
    _custom3Controller.text = client.customValue3;
    _custom4Controller.text = client.customValue4;

    _suffixController.text = client.suffix;
    _legalBusinessNameController.text = client.legalBusinessName;
    _emailController.text = client.email;
    _phoneHomeController.text = client.phoneHome;
    _phoneMainController.text = client.phoneMain;
    _phoneTollFreeController.text = client.phoneTollFree;
    _phoneCellController.text = client.phoneCell;
    _faxController.text = client.fax;
    _regionController.text = client.region;

    _controllers
        .forEach((dynamic controller) => controller.addListener(_onChanged));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controllers.forEach((dynamic controller) {
      controller.removeListener(_onChanged);
      controller.dispose();
    });

    super.dispose();
  }

  void _onChanged() {
    final viewModel = widget.viewModel;
    final client = viewModel.client.rebuild((b) => b
      ..number = _numberController.text.trim()
      ..name = _nameController.text.trim()
      ..idNumber = _idNumberController.text.trim()
      ..vatNumber = _vatNumberController.text.trim()
      ..website = _websiteController.text.trim()
      ..phone = _phoneController.text.trim()
      ..routingId = _routingIdController.text.trim()
      ..customValue1 = _custom1Controller.text.trim()
      ..customValue2 = _custom2Controller.text.trim()
      ..customValue3 = _custom3Controller.text.trim()
      ..customValue4 = _custom4Controller.text.trim()
      ..suffix = _suffixController.text.trim()
      ..legalBusinessName = _legalBusinessNameController.text.trim()
      ..email = _emailController.text.trim()
      ..phoneMain = _phoneMainController.text.trim()
      ..phoneHome = _phoneHomeController.text.trim()
      ..phoneCell = _phoneCellController.text.trim()
      ..phoneTollFree = _phoneTollFreeController.text.trim()
      // ..region = _regionController.text.trim()
      ..fax = _faxController.text.trim());
    if (client != viewModel.client) {
      _debouncer.run(() {
        viewModel.onChanged(client);
      });
    }
  }

  void _onSavePressed(BuildContext context) {
    final bool isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    }

    widget.viewModel.onSavePressed(context);
  }

  void _setContactControllers(Contact contact) {
    final viewModel = widget.viewModel;
    final client = viewModel.client;

    final contactEmail =
        contact.emails.isNotEmpty ? contact.emails.first : null;
    final contactPhone =
        contact.phones.isNotEmpty ? contact.phones.first : null;
    final contactAddress = contact.postalAddresses.isNotEmpty
        ? contact.postalAddresses.first
        : null;

    final countryMap = viewModel.state.staticState.countryMap;
    String countryId;

    countryMap.keys.forEach((countryId) {
      final country = countryMap[countryId] ?? CountryEntity();
      if (country.name.toLowerCase() ==
          contactAddress?.country?.toLowerCase()) {
        countryId = country.id;
      }
    });

    widget.viewModel.onChanged(client.rebuild((b) => b
      ..name = (contact?.company ?? '').trim()
      ..address1 = (contactAddress?.street ?? '').trim()
      ..city = (contactAddress?.city ?? '').trim()
      ..state = (contactAddress?.region ?? '').trim()
      ..postalCode = (contactAddress?.postcode ?? '').trim()
      ..countryId = countryId ?? ''
      ..contacts[0] = client.contacts[0].rebuild((b) => b
        ..firstName = (contact?.givenName ?? '').trim()
        ..lastName = (contact?.familyName ?? '').trim()
        ..email = (contactEmail?.value ?? '').trim()
        ..phone = (contactPhone?.value ?? '').trim())
      ..updatedAt = DateTime.now().millisecondsSinceEpoch));
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    final viewModel = widget.viewModel;
    final state = viewModel.state;
    final client = viewModel.client;
    final isFullscreen = state.prefState.isEditorFullScreen(EntityType.client);

    return Form(
      key: _formKey,
      child: FormCard(
        isLast: true,
        padding: isFullscreen
            ? const EdgeInsets.only(
                left: kMobileDialogPadding,
                top: kMobileDialogPadding,
                right: kMobileDialogPadding / 2,
              )
            : null,
        children: <Widget>[
          DecoratedFormField(
            autofocus: true,
            controller: _nameController,
            validator: (String val) => !viewModel.client.hasNameSet
                ? AppLocalization.of(context).pleaseEnterAClientOrContactName
                : null,
            onSavePressed: viewModel.onSavePressed,
            label: localization.name,
            keyboardType: TextInputType.text,
            decoration: !kIsWeb && (Platform.isIOS || Platform.isAndroid)
                ? InputDecoration(
                    labelText: localization.name,
                    suffixIcon: IconButton(
                        alignment: Alignment.bottomCenter,
                        color: Theme.of(context).cardColor,
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        onPressed: () async {
                          final contact = await getDeviceContact();
                          if (contact != null) {
                            setState(() {
                              _setContactControllers(contact);
                            });
                          }
                        }),
                  )
                : null,
          ),
          DecoratedFormField(
            label: localization.suffix,
            controller: _suffixController,
            onSavePressed: viewModel.onSavePressed,
            keyboardType: TextInputType.text,
          ),
          DecoratedFormField(
            label: localization.legalBusinessName,
            controller: _legalBusinessNameController,
            onSavePressed: viewModel.onSavePressed,
            keyboardType: TextInputType.text,
          ),
          AppDropdownButton(
              labelText: localization.region,
              value: client.region,
              items: regions,
              onChanged: (dynamic region) => viewModel
                  .onChanged(client.rebuild((b) => b..region = region))),
          if (client.isOld)
            DecoratedFormField(
              label: localization.number,
              controller: _numberController,
              onSavePressed: _onSavePressed,
              keyboardType: TextInputType.text,
            ),
          if (memoizedGroupList(state.groupState.map).isNotEmpty)
            DynamicSelector(
              entityType: EntityType.group,
              entityIds: memoizedGroupList(state.groupState.map),
              entityId: client.groupId,
              onChanged: (groupId) => viewModel
                  .onChanged(client.rebuild((b) => b..groupId = groupId)),
            ),
          UserPicker(
            userId: client.assignedUserId,
            onChanged: (userId) => viewModel
                .onChanged(client.rebuild((b) => b..assignedUserId = userId)),
          ),
          DecoratedFormField(
            label: localization.idNumber,
            controller: _idNumberController,
            onSavePressed: _onSavePressed,
            keyboardType: TextInputType.text,
          ),
          DecoratedFormField(
            label: localization.vatNumber,
            controller: _vatNumberController,
            onSavePressed: _onSavePressed,
            keyboardType: TextInputType.text,
          ),
          UserPicker(
            userId: client.assignedUserId,
            onChanged: (userId) => viewModel
                .onChanged(client.rebuild((b) => b..assignedUserId = userId)),
          ),
          DecoratedFormField(
            label: localization.idNumber,
            controller: _idNumberController,
            onSavePressed: viewModel.onSavePressed,
            keyboardType: TextInputType.text,
          ),
          DecoratedFormField(
            label: localization.vatNumber,
            controller: _vatNumberController,
            onSavePressed: viewModel.onSavePressed,
            keyboardType: TextInputType.text,
          ),
          DecoratedFormField(
            label: localization.website,
            controller: _websiteController,
            keyboardType: TextInputType.url,
            onSavePressed: viewModel.onSavePressed,
          ),
          DecoratedFormField(
            label: localization.phone,
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            onSavePressed: viewModel.onSavePressed,
          ),
          DecoratedFormField(
            label: localization.phoneHome,
            controller: _phoneHomeController,
            keyboardType: TextInputType.phone,
            onSavePressed: viewModel.onSavePressed,
          ),
          DecoratedFormField(
            label: localization.phoneMain,
            controller: _phoneMainController,
            keyboardType: TextInputType.phone,
            onSavePressed: viewModel.onSavePressed,
          ),
          DecoratedFormField(
            label: localization.phoneCell,
            controller: _phoneCellController,
            keyboardType: TextInputType.phone,
            onSavePressed: viewModel.onSavePressed,
          ),
          DecoratedFormField(
            label: localization.phoneTollFree,
            controller: _phoneTollFreeController,
            keyboardType: TextInputType.phone,
            onSavePressed: viewModel.onSavePressed,
          ),
          CustomField(
            controller: _custom1Controller,
            field: CustomFieldType.client1,
            value: client.customValue1,
            onSavePressed: viewModel.onSavePressed,
          ),
          CustomField(
            controller: _custom2Controller,
            field: CustomFieldType.client2,
            value: client.customValue2,
            onSavePressed: viewModel.onSavePressed,
          ),
          CustomField(
            controller: _custom3Controller,
            field: CustomFieldType.client3,
            value: client.customValue3,
            onSavePressed: viewModel.onSavePressed,
          ),
          CustomField(
            controller: _custom4Controller,
            field: CustomFieldType.client4,
            value: client.customValue4,
            onSavePressed: viewModel.onSavePressed,
          ),
          if (state.company.settings.enableEInvoice == true) ...[
            DecoratedFormField(
              label: localization.routingId,
              controller: _routingIdController,
              keyboardType: TextInputType.text,
              onSavePressed: _onSavePressed,
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text(localization.taxExempt),
              value: client.isTaxExempt,
              onChanged: (value) {
                viewModel
                    .onChanged(client.rebuild((b) => b..isTaxExempt = value));
              },
            )
          ]
        ],
      ),
    );
  }
}
