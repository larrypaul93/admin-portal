// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:contacts_service/contacts_service.dart';

// Project imports:
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/client/client_selectors.dart';
import 'package:invoiceninja_flutter/redux/static/static_selectors.dart';
import 'package:invoiceninja_flutter/ui/app/form_card.dart';
import 'package:invoiceninja_flutter/ui/app/forms/app_dropdown_button.dart';
import 'package:invoiceninja_flutter/ui/app/forms/client_picker.dart';
import 'package:invoiceninja_flutter/ui/app/forms/custom_field.dart';
import 'package:invoiceninja_flutter/ui/app/forms/decorated_form_field.dart';
import 'package:invoiceninja_flutter/ui/app/forms/dynamic_selector.dart';
import 'package:invoiceninja_flutter/ui/app/forms/user_picker.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_vm.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/contacts.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

class ContactEditDetails extends StatefulWidget {
  const ContactEditDetails({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final ClientContactEditVM viewModel;

  @override
  ContactEditDetailsState createState() => ContactEditDetailsState();
}

class ContactEditDetailsState extends State<ContactEditDetails> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _numberController = TextEditingController();
  final _nameController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _vatNumberController = TextEditingController();
  final _websiteController = TextEditingController();
  final _phoneController = TextEditingController();
  final _custom1Controller = TextEditingController();
  final _custom2Controller = TextEditingController();
  final _custom3Controller = TextEditingController();
  final _custom4Controller = TextEditingController();

  final _suffixController = TextEditingController();
  final _legalBusinessNameController = TextEditingController();
  final _regionController = TextEditingController();
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

  final _debouncer = Debouncer();
  List<TextEditingController> _controllers;

  @override
  void didChangeDependencies() {
    _controllers = [
      _firstNameController,
      _lastNameController,
      _emailController,
      _passwordController,
      _numberController,
      _nameController,
      _idNumberController,
      _vatNumberController,
      _websiteController,
      _phoneController,
      _custom1Controller,
      _custom2Controller,
      _custom3Controller,
      _custom4Controller,
      _suffixController,
      _legalBusinessNameController,
      _phoneHomeController,
      _phoneMainController,
      _phoneTollFreeController,
      _phoneCellController,
      _faxController,
      _regionController
    ];

    _controllers
        .forEach((dynamic controller) => controller.removeListener(_onChanged));

    print(widget.viewModel.contact);
    final contact = widget.viewModel.contact;

    _firstNameController.text = contact.firstName;
    _lastNameController.text = contact.lastName;
    _emailController.text = contact.email;
    _phoneController.text = contact.phone;
    _passwordController.text = contact.password;

    _numberController.text = contact.number;
    _phoneController.text = contact.phone;
    _custom1Controller.text = contact.customValue1;
    _custom2Controller.text = contact.customValue2;
    _custom3Controller.text = contact.customValue3;
    _custom4Controller.text = contact.customValue4;

    _phoneHomeController.text = contact.phoneHome;
    _phoneMainController.text = contact.phoneMain;
    _phoneTollFreeController.text = contact.phoneTollFree;
    _phoneCellController.text = contact.phoneCell;
    _faxController.text = contact.fax;
    _regionController.text = contact.region;

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
    final contact = viewModel.contact.rebuild((b) => b
      ..firstName = _firstNameController.text.trim()
      ..lastName = _lastNameController.text.trim()
      ..email = _emailController.text.trim()
      ..password = _passwordController.text.trim()
      ..phone = _phoneController.text.trim()
      ..customValue1 = _custom1Controller.text.trim()
      ..customValue2 = _custom2Controller.text.trim()
      ..customValue3 = _custom3Controller.text.trim()
      ..customValue4 = _custom4Controller.text.trim()
      ..phoneMain = _phoneMainController.text.trim()
      ..phoneHome = _phoneHomeController.text.trim()
      ..phoneCell = _phoneCellController.text.trim()
      ..phoneTollFree = _phoneTollFreeController.text.trim()
      // ..region = _regionController.text.trim()
      ..fax = _faxController.text.trim());
    if (contact != viewModel.contact) {
      _debouncer.run(() {
        viewModel.onChanged(contact);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);

    final viewModel = widget.viewModel;
    final company = viewModel.company;
    final state = viewModel.state;
    final contact = viewModel.contact;
    final isFullscreen = state.prefState.isEditorFullScreen(EntityType.contact);

    return FormCard(
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
          controller: _firstNameController,
          label: localization.firstName,
          keyboardType: TextInputType.name,
          onSavePressed: viewModel.onSavePressed,
        ),
        DecoratedFormField(
          controller: _lastNameController,
          label: localization.lastName,
          keyboardType: TextInputType.name,
          onSavePressed: viewModel.onSavePressed,
        ),
        DecoratedFormField(
          controller: _emailController,
          label: localization.email,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => value.isNotEmpty && !value.contains('@')
              ? localization.emailIsInvalid
              : null,
          onSavePressed: viewModel.onSavePressed,
        ),
        company.settings.enablePortalPassword ?? false
            ? DecoratedFormField(
                autocorrect: false,
                controller: _passwordController,
                label: localization.password,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => value.isNotEmpty && value.length < 8
                    ? localization.passwordIsTooShort
                    : null,
                onSavePressed: viewModel.onSavePressed,
              )
            : SizedBox(),
        AppDropdownButton(
            labelText: localization.region,
            value: contact.region,
            items: regions,
            onChanged: (dynamic region) {
              viewModel.onChanged(contact.rebuild((b) => b..region = region));
            }),
        if (memoizedGroupList(state.groupState.map).isNotEmpty)
          DynamicSelector(
            entityType: EntityType.group,
            entityIds: memoizedGroupList(state.groupState.map),
            entityId: contact.groupId,
            onChanged: (groupId) => viewModel
                .onChanged(contact.rebuild((b) => b..groupId = groupId)),
          ),
        UserPicker(
          userId: contact.assignedUserId,
          onChanged: (userId) => viewModel
              .onChanged(contact.rebuild((b) => b..assignedUserId = userId)),
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
          value: contact.customValue1,
          onSavePressed: viewModel.onSavePressed,
        ),
        CustomField(
          controller: _custom2Controller,
          field: CustomFieldType.client2,
          value: contact.customValue2,
          onSavePressed: viewModel.onSavePressed,
        ),
        CustomField(
          controller: _custom3Controller,
          field: CustomFieldType.client3,
          value: contact.customValue3,
          onSavePressed: viewModel.onSavePressed,
        ),
        CustomField(
          controller: _custom4Controller,
          field: CustomFieldType.client4,
          value: contact.customValue4,
          onSavePressed: viewModel.onSavePressed,
        ),
      ],
    );
  }
}
