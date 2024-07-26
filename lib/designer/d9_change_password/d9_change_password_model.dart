import '/flutter_flow/flutter_flow_util.dart';
import 'd9_change_password_widget.dart' show D9ChangePasswordWidget;
import 'package:flutter/material.dart';

class D9ChangePasswordModel extends FlutterFlowModel<D9ChangePasswordWidget> {
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
