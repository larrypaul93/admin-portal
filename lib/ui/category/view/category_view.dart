import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/ui/app/FieldGrid.dart';
import 'package:invoiceninja_flutter/ui/app/scrollable_listview.dart';
import 'package:invoiceninja_flutter/ui/category/view/category_view_vm.dart';
import 'package:invoiceninja_flutter/ui/app/view_scaffold.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({
    Key key,
    @required this.viewModel,
    @required this.isFilter,
  }) : super(key: key);

  final CategoryViewVM viewModel;
  final bool isFilter;

  @override
  _CategoryViewState createState() => new _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;
    final category = viewModel.category;
    final fields = <String, String>{};
    fields['Name'] = category.name;
    fields['Sku Prefix'] = category.skuPrefix;
    fields['Next Number'] = category.nextNumber;
    fields['Description'] = category.description;
    if (category.categoryId.isNotEmpty)
      fields['Parent Category'] = category.category.name;

    return ViewScaffold(
      isFilter: widget.isFilter,
      entity: category,
      body: ScrollableListView(
        children: <Widget>[
          FieldGrid(fields),
        ],
      ),
    );
  }
}
