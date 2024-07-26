import '/flutter_flow/flutter_flow_util.dart';
import 'a3_forgot_password_widget.dart' show A3ForgotPasswordWidget;
import 'package:flutter/material.dart';

class A3ForgotPasswordModel extends FlutterFlowModel<A3ForgotPasswordWidget> {
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
