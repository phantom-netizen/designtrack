import '/flutter_flow/flutter_flow_util.dart';
import 'a2_user_selection_widget.dart' show A2UserSelectionWidget;
import 'package:flutter/material.dart';

class A2UserSelectionModel extends FlutterFlowModel<A2UserSelectionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
