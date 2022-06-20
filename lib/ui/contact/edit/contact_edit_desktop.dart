// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/ui/app/scrollable_listview.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_billing_address.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_details.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_head_office_address.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_home_address.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_main_address.dart';
import 'package:invoiceninja_flutter/ui/contact/edit/contact_edit_vm.dart';

class ContactEditDesktop extends StatelessWidget {
  const ContactEditDesktop({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final ClientContactEditVM viewModel;

  @override
  Widget build(BuildContext context) {
    return ScrollableListView(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FocusTraversalGroup(
                child: Column(
                  children: [
                    ContactEditDetails(
                      viewModel: viewModel,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FocusTraversalGroup(
                child: Column(
                  children: [
                    ContactEditHomeAddress(
                      viewModel: viewModel,
                    ),
                    ContactEditHeadOfficeAddress(
                      viewModel: viewModel,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FocusTraversalGroup(
                child: Column(
                  children: [
                    ContactEditMainAddress(
                      viewModel: viewModel,
                    ),
                    ContactEditBillingAddress(
                      viewModel: viewModel,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: kMobileDialogPadding,
        ),
      ],
    );
  }
}
