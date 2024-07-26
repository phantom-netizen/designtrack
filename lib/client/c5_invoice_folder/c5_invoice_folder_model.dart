import '/flutter_flow/flutter_flow_util.dart';
import 'c5_invoice_folder_widget.dart' show C5InvoiceFolderWidget;
import 'package:flutter/material.dart';

class C5InvoiceFolderModel extends FlutterFlowModel<C5InvoiceFolderWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
