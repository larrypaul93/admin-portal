import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/ui/app/scrollable_listview.dart';
import 'package:invoiceninja_flutter/ui/contact/view/contact_view_vm.dart';
import 'package:invoiceninja_flutter/ui/app/view_scaffold.dart';

class ContactView extends StatefulWidget {
  const ContactView({
    Key key,
    @required this.viewModel,
    @required this.isFilter,
  }) : super(key: key);

  final ContactViewVM viewModel;
  final bool isFilter;

  @override
  _ContactViewState createState() => new _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;
    final contact = viewModel.contact;

    return ViewScaffold(
      isFilter: widget.isFilter,
      entity: contact,
      body: ScrollableListView(
        children: <Widget>[],
      ),
    );
  }
}
