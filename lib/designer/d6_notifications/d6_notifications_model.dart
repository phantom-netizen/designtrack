import '/flutter_flow/flutter_flow_util.dart';
import 'd6_notifications_widget.dart' show D6NotificationsWidget;
import 'package:flutter/material.dart';

class D6NotificationsModel extends FlutterFlowModel<D6NotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
