import '/flutter_flow/flutter_flow_util.dart';
import 'd8_invoice_folder_widget.dart' show D8InvoiceFolderWidget;
import 'package:flutter/material.dart';

class D8InvoiceFolderModel extends FlutterFlowModel<D8InvoiceFolderWidget> {
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
