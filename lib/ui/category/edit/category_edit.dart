import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/data/models/entities.dart';
import 'package:invoiceninja_flutter/redux/category/category_selectors.dart';
import 'package:invoiceninja_flutter/ui/app/edit_scaffold.dart';
import 'package:invoiceninja_flutter/ui/app/form_card.dart';
import 'package:invoiceninja_flutter/ui/app/forms/dynamic_selector.dart';
import 'package:invoiceninja_flutter/ui/category/edit/category_edit_vm.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/ui/app/scrollable_listview.dart';

class CategoryEdit extends StatefulWidget {
  const CategoryEdit({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final CategoryEditVM viewModel;

  @override
  _CategoryEditState createState() => _CategoryEditState();
}

class _CategoryEditState extends State<CategoryEdit> {
  static final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_categoryEdit');
  final _debouncer = Debouncer();

  // STARTER: controllers - do not remove comment
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _skuPrefixController = TextEditingController();
  final _nextNumberController = TextEditingController();

  List<TextEditingController> _controllers = [];

  @override
  void didChangeDependencies() {
    _controllers = [
      // STARTER: array - do not remove comment
      _nameController,
      _descriptionController,
      _skuPrefixController,
      _nextNumberController
    ];

    _controllers.forEach((controller) => controller.removeListener(_onChanged));

    final category = widget.viewModel.category;
    // STARTER: read value - do not remove comment
    _nameController.text = category.name;
    _descriptionController.text = category.description;
    _skuPrefixController.text = category.skuPrefix;
    _nextNumberController.text = category.nextNumber;

    _controllers.forEach((controller) => controller.addListener(_onChanged));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) {
      controller.removeListener(_onChanged);
      controller.dispose();
    });

    super.dispose();
  }

  void _onChanged() {
    _debouncer.run(() {
      final category = widget.viewModel.category.rebuild((b) => b
        // STARTER: set value - do not remove comment
        ..name = _nameController.text.trim()
        ..description = _descriptionController.text.trim()
        ..skuPrefix = _skuPrefixController.text.trim()
        ..nextNumber = _nextNumberController.text.trim());
      if (category != widget.viewModel.category) {
        widget.viewModel.onChanged(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;
    final localization = AppLocalization.of(context);
    final category = viewModel.category;
    final state = viewModel.state;
    return EditScaffold(
      title:
          category.isNew ? localization.newCategory : localization.editCategory,
      onCancelPressed: (context) => viewModel.onCancelPressed(context),
      onSavePressed: (context) {
        final bool isValid = _formKey.currentState.validate();

        /*
          setState(() {
            _autoValidate = !isValid;
          });
            */

        if (!isValid) {
          return;
        }

        viewModel.onSavePressed(context);
      },
      body: Form(
          key: _formKey,
          child: Builder(builder: (BuildContext context) {
            return ScrollableListView(
              children: <Widget>[
                FormCard(
                  children: <Widget>[
                    // STARTER: widgets - do not remove comment
                    TextFormField(
                      controller: _nameController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    TextFormField(
                      controller: _skuPrefixController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Sku Prefix',
                      ),
                    ),
                    TextFormField(
                      controller: _nextNumberController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Next Number',
                      ),
                    ),
                    DynamicSelector(
                      entityType: EntityType.category,
                      entityIds: memoizedDropdownCategoryList(
                          state.categoryState.map,
                          state.categoryState.list,
                          state.staticState,
                          state.userState.map,
                          category.id),
                      entityId: category.categoryId,
                      onChanged: (categoryId) => viewModel.onChanged(
                          category.rebuild((b) => b..categoryId = categoryId)),
                    ),
                  ],
                ),
              ],
            );
          })),
    );
  }
}
