import '/flutter_flow/flutter_flow_util.dart';
import 'c7_change_password_widget.dart' show C7ChangePasswordWidget;
import 'package:flutter/material.dart';

class C7ChangePasswordModel extends FlutterFlowModel<C7ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
