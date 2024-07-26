import '/flutter_flow/flutter_flow_util.dart';
import 'd8_design_folder_widget.dart' show D8DesignFolderWidget;
import 'package:flutter/material.dart';

class D8DesignFolderModel extends FlutterFlowModel<D8DesignFolderWidget> {
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
