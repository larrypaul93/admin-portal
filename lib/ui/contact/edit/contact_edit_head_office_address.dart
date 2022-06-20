// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/entities.dart';
import 'package:invoiceninja_flutter/redux/static/static_selectors.dart';
import 'package:invoiceninja_flutter/ui/app/entity_dropdown.dart';
import 'package:invoiceninja_flutter/ui/app/form_card.dart';
import 'package:invoiceninja_flutter/ui/app/forms/decorated_form_field.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_vm.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

class ContactEditHeadOfficeAddress extends StatefulWidget {
  const ContactEditHeadOfficeAddress({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final ClientContactEditVM viewModel;

  @override
  ContactEditHeadOfficeAddressState createState() =>
      ContactEditHeadOfficeAddressState();
}

class ContactEditHeadOfficeAddressState
    extends State<ContactEditHeadOfficeAddress> {
  final _address1Controller = TextEditingController();
  final _address2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();

  List<TextEditingController> _controllers = [];
  final _debouncer = Debouncer();

  @override
  void didChangeDependencies() {
    _controllers = [
      _address1Controller,
      _address2Controller,
      _cityController,
      _stateController,
      _postalCodeController,
    ];

    _controllers
        .forEach((dynamic controller) => controller.removeListener(_onChanged));

    final contact = widget.viewModel.contact;
    _address1Controller.text = contact.headOfficeAddress1;
    _address2Controller.text = contact.headOfficeAddress2;
    _cityController.text = contact.headOfficeCity;
    _stateController.text = contact.headOfficeState;
    _postalCodeController.text = contact.headOfficePostalCode;

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
      ..headOfficeAddress1 = _address1Controller.text.trim()
      ..headOfficeAddress2 = _address2Controller.text.trim()
      ..headOfficeCity = _cityController.text.trim()
      ..headOfficeState = _stateController.text.trim()
      ..headOfficePostalCode = _postalCodeController.text.trim());
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
    final contact = viewModel.contact;
    final isFullscreen =
        viewModel.state.prefState.isEditorFullScreen(EntityType.contact);

    return FormCard(
      isLast: true,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      padding: isFullscreen
          ? const EdgeInsets.only(
              left: kMobileDialogPadding / 2,
              top: kMobileDialogPadding,
              right: kMobileDialogPadding,
            )
          : null,
      children: <Widget>[
        DecoratedFormField(
          controller: _address1Controller,
          label: isFullscreen
              ? localization.headOfficeAddress1
              : localization.address1,
          onSavePressed: viewModel.onSavePressed,
          keyboardType: TextInputType.streetAddress,
        ),
        DecoratedFormField(
          autocorrect: false,
          controller: _address2Controller,
          label: localization.address2,
          onSavePressed: viewModel.onSavePressed,
          keyboardType: TextInputType.text,
        ),
        DecoratedFormField(
          autocorrect: false,
          controller: _cityController,
          label: localization.city,
          onSavePressed: viewModel.onSavePressed,
          keyboardType: TextInputType.text,
        ),
        DecoratedFormField(
          autocorrect: false,
          controller: _stateController,
          label: localization.state,
          onSavePressed: viewModel.onSavePressed,
          keyboardType: TextInputType.text,
        ),
        DecoratedFormField(
          autocorrect: false,
          controller: _postalCodeController,
          label: localization.postalCode,
          onSavePressed: viewModel.onSavePressed,
          keyboardType: TextInputType.text,
        ),
        EntityDropdown(
          entityType: EntityType.country,
          entityList: memoizedCountryList(viewModel.staticState.countryMap),
          labelText: localization.country,
          entityId: contact.headOfficeCountryId,
          onSelected: (SelectableEntity country) => viewModel.onChanged(contact
              .rebuild((b) => b..headOfficeCountryId = country?.id ?? '')),
        ),
      ],
    );
  }
}
