import '/flutter_flow/flutter_flow_util.dart';
import 'c5_design_folder_widget.dart' show C5DesignFolderWidget;
import 'package:flutter/material.dart';

class C5DesignFolderModel extends FlutterFlowModel<C5DesignFolderWidget> {
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
