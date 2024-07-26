import '/flutter_flow/flutter_flow_util.dart';
import 'c5_agreement_folder_widget.dart' show C5AgreementFolderWidget;
import 'package:flutter/material.dart';

class C5AgreementFolderModel extends FlutterFlowModel<C5AgreementFolderWidget> {
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
