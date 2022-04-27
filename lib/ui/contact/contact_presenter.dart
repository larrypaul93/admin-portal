import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/data/models/contact_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/ui/app/presenters/entity_presenter.dart';

class ContactPresenter extends EntityPresenter {
  static List<String> getDefaultTableFields(UserCompanyEntity userCompany) {
    return [
      ContactFields.firstName,
      ContactFields.lastName,
      ContactFields.email,
      ContactFields.phone
    ];
  }

  static List<String> getAllTableFields(UserCompanyEntity userCompany) {
    return [
      ...getDefaultTableFields(userCompany),
      ...EntityPresenter.getBaseFields(),
      ContactFields.firstName,
      ContactFields.lastName,
      ContactFields.fullName,
      ContactFields.email,
      ContactFields.phone
    ];
  }

  @override
  Widget getField({String field, BuildContext context}) {
    //final state = StoreProvider.of<AppState>(context).state;
    final contact = entity as ContactEntity;

    switch (field) {
      case ContactFields.email:
        return Text(contact.email);
      case ContactFields.firstName:
        return Text(contact.firstName);
      case ContactFields.lastName:
        return Text(contact.lastName);
      case ContactFields.phone:
        return Text(contact.phone);
      case ContactFields.fullName:
        return Text(contact.fullName);
    }

    return super.getField(field: field, context: context);
  }
}
