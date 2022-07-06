import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/redux/service_report/service_reports_state.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/company/company_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/entity_ui_state.dart';
import 'package:invoiceninja_flutter/redux/category/category_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';
import 'package:invoiceninja_flutter/redux/category/category_state.dart';
import 'package:invoiceninja_flutter/data/models/entities.dart';

final serviceReportsReducer = combineReducers<ServiceReportsState>([
  // TypedReducer<ServiceReportsState, LoadSe>(_setLoadedCategories),
  TypedReducer<ServiceReportsState, LoadCompanySuccess>(_setLoadedCompany),
]);

CategoryState _setLoadedCategories(
        CategoryState categoryState, LoadCategoriesSuccess action) =>
    categoryState.loadCategories(action.categories);

ServiceReportsState _setLoadedCompany(
    ServiceReportsState serviceReportsState, LoadCompanySuccess action) {
  final company = action.userCompany.company;
  return serviceReportsState.loadServiceReports(company.serviceReports);
}
