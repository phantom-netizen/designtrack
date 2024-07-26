import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'd5_add_task_widget.dart' show D5AddTaskWidget;
import 'package:flutter/material.dart';

class D5AddTaskModel extends FlutterFlowModel<D5AddTaskWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TasksRecord? newTask;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
