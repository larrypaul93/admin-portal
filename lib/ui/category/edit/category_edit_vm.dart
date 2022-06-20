import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/ui_actions.dart';
import 'package:redux/redux.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/ui/app/dialogs/error_dialog.dart';
import 'package:invoiceninja_flutter/ui/category/view/category_view_vm.dart';
import 'package:invoiceninja_flutter/redux/category/category_actions.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/ui/category/edit/category_edit.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

class CategoryEditScreen extends StatelessWidget {
  const CategoryEditScreen({Key key}) : super(key: key);
  static const String route = '/category/edit';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoryEditVM>(
      converter: (Store<AppState> store) {
        return CategoryEditVM.fromStore(store);
      },
      builder: (context, viewModel) {
        return CategoryEdit(
          viewModel: viewModel,
          key: ValueKey(viewModel.category.updatedAt),
        );
      },
    );
  }
}

class CategoryEditVM {
  CategoryEditVM({
    @required this.state,
    @required this.category,
    @required this.company,
    @required this.onChanged,
    @required this.isSaving,
    @required this.origCategory,
    @required this.onSavePressed,
    @required this.onCancelPressed,
    @required this.isLoading,
  });

  factory CategoryEditVM.fromStore(Store<AppState> store) {
    final state = store.state;
    final category = state.categoryUIState.editing;

    return CategoryEditVM(
      state: state,
      isLoading: state.isLoading,
      isSaving: state.isSaving,
      origCategory: state.categoryState.map[category.id],
      category: category,
      company: state.company,
      onChanged: (CategoryEntity category) {
        store.dispatch(UpdateCategory(category));
      },
      onCancelPressed: (BuildContext context) {
        createEntity(context: context, entity: CategoryEntity(), force: true);
        if (state.categoryUIState.cancelCompleter != null) {
          state.categoryUIState.cancelCompleter.complete();
        } else {
          store.dispatch(UpdateCurrentRoute(state.uiState.previousRoute));
        }
      },
      onSavePressed: (BuildContext context) {
        Debouncer.runOnComplete(() {
          final category = store.state.categoryUIState.editing;
          final localization = AppLocalization.of(context);
          final Completer<CategoryEntity> completer =
              new Completer<CategoryEntity>();
          store.dispatch(
              SaveCategoryRequest(completer: completer, category: category));
          return completer.future.then((savedCategory) {
            showToast(category.isNew
                ? localization.createdCategory
                : localization.updatedCategory);
            if (state.prefState.isMobile) {
              store.dispatch(UpdateCurrentRoute(CategoryViewScreen.route));
              if (category.isNew) {
                Navigator.of(context)
                    .pushReplacementNamed(CategoryViewScreen.route);
              } else {
                Navigator.of(context).pop(savedCategory);
              }
            } else {
              viewEntity(entity: savedCategory, force: true);
            }
          }).catchError((Object error) {
            showDialog<ErrorDialog>(
                context: context,
                builder: (BuildContext context) {
                  return ErrorDialog(error);
                });
          });
        });
      },
    );
  }

  final CategoryEntity category;
  final CompanyEntity company;
  final Function(CategoryEntity) onChanged;
  final Function(BuildContext) onSavePressed;
  final Function(BuildContext) onCancelPressed;
  final bool isLoading;
  final bool isSaving;
  final CategoryEntity origCategory;
  final AppState state;
}
