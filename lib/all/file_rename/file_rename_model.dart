import '/flutter_flow/flutter_flow_util.dart';
import 'file_rename_widget.dart' show FileRenameWidget;
import 'package:flutter/material.dart';

class FileRenameModel extends FlutterFlowModel<FileRenameWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for renaming widget.
  FocusNode? renamingFocusNode;
  TextEditingController? renamingTextController;
  String? Function(BuildContext, String?)? renamingTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    renamingFocusNode?.dispose();
    renamingTextController?.dispose();
  }
}
