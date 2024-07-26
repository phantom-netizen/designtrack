import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_project_widget.dart' show CreateProjectWidget;
import 'package:flutter/material.dart';

class CreateProjectModel extends FlutterFlowModel<CreateProjectWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameTextController;
  String? Function(BuildContext, String?)? projectNameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for design_specification widget.
  FocusNode? designSpecificationFocusNode;
  TextEditingController? designSpecificationTextController;
  String? Function(BuildContext, String?)?
      designSpecificationTextControllerValidator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProjectsRecord? newProject;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    projectNameFocusNode?.dispose();
    projectNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    designSpecificationFocusNode?.dispose();
    designSpecificationTextController?.dispose();
  }
}
