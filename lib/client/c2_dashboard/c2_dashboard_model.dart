import '/flutter_flow/flutter_flow_util.dart';
import 'c2_dashboard_widget.dart' show C2DashboardWidget;
import 'package:flutter/material.dart';

class C2DashboardModel extends FlutterFlowModel<C2DashboardWidget> {
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
