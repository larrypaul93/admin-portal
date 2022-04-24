// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:invoiceninja_flutter/data/models/entities.dart';
import 'package:invoiceninja_flutter/ui/app/edit_scaffold.dart';
import 'package:invoiceninja_flutter/ui/app/scrollable_listview.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_billing_address.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_desktop.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_details.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_footer.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_head_office_address.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_home_address.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_main_address.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_vm.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

class ContactEdit extends StatefulWidget {
  const ContactEdit({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final ClientContactEditVM viewModel;

  @override
  _ContactEditState createState() => _ContactEditState();
}

class _ContactEditState extends State<ContactEdit>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  static final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_contactEdit');

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    final viewModel = widget.viewModel;
    final contact = viewModel.contact;
    final state = viewModel.state;
    final prefState = state.prefState;
    final isFullscreen = prefState.isEditorFullScreen(EntityType.contact);

    return EditScaffold(
      isFullscreen: isFullscreen,
      entity: contact,
      title: contact.isNew ? localization.newContact : localization.editContact,
      onCancelPressed: (context) => viewModel.onCancelPressed(context),
      onSavePressed: (context) {
        final bool isValid = _formKey.currentState.validate();
        setState(() {
          //autoValidate = !isValid;
        });

        if (!isValid) {
          return;
        }

        viewModel.onSavePressed(context);
      },
      appBarBottom: TabBar(
        controller: _controller,
        isScrollable: true,
        tabs: [
          Tab(
            text: localization.details,
          ),
          Tab(
            text: localization.homeAddress,
          ),
          Tab(
            text: localization.mainAddress,
          ),
          Tab(
            text: localization.headOfficeAddress,
          ),
          Tab(
            text: localization.billingAddress,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: isFullscreen
            ? ContactEditDesktop(
                viewModel: viewModel,
                key: ValueKey('__contact_${contact.id}_${contact.updatedAt}__'),
              )
            : TabBarView(
                key: ValueKey('__contact_${contact.id}_${contact.updatedAt}__'),
                controller: _controller,
                children: <Widget>[
                  ScrollableListView(
                    children: [
                      ContactEditDetails(viewModel: viewModel),
                    ],
                  ),
                  ScrollableListView(
                    children: [
                      ContactEditHomeAddress(viewModel: viewModel),
                    ],
                  ),
                  ScrollableListView(
                    children: [
                      ContactEditMainAddress(viewModel: viewModel),
                    ],
                  ),
                  ScrollableListView(
                    children: [
                      ContactEditHeadOfficeAddress(viewModel: viewModel),
                    ],
                  ),
                  ScrollableListView(
                    children: [
                      ContactEditBillingAddress(viewModel: viewModel),
                    ],
                  ),
                ],
              ),
      ),
      bottomNavigationBar: ContactEditFooter(contact: contact),
    );
  }
}
