import '/flutter_flow/flutter_flow_util.dart';
import 'c4_notifications_widget.dart' show C4NotificationsWidget;
import 'package:flutter/material.dart';

class C4NotificationsModel extends FlutterFlowModel<C4NotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
