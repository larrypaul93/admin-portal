import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/ui/app/presenters/entity_presenter.dart';

class CategoryPresenter extends EntityPresenter {
  static List<String> getDefaultTableFields(UserCompanyEntity userCompany) {
    return [
      CategoryFields.name,
      CategoryFields.skuPrefix,
      CategoryFields.nextNumber
    ];
  }

  static List<String> getAllTableFields(UserCompanyEntity userCompany) {
    return [
      ...getDefaultTableFields(userCompany),
      ...EntityPresenter.getBaseFields(),
      CategoryFields.name,
      CategoryFields.skuPrefix,
      CategoryFields.nextNumber,
    ];
  }

  @override
  Widget getField({String field, BuildContext context}) {
    final category = entity as CategoryEntity;

    switch (field) {
      case CategoryFields.name:
        return Text(category.displayName);
      case CategoryFields.description:
        return Text(category.description);
      case CategoryFields.skuPrefix:
        return Text(category.skuPrefix);
      case CategoryFields.nextNumber:
        return Text(category.nextNumber);
      case CategoryFields.category:
        return Text(category.category?.name ?? '');
    }

    return super.getField(field: field, context: context);
  }
}
