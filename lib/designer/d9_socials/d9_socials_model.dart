import '/flutter_flow/flutter_flow_util.dart';
import 'd9_socials_widget.dart' show D9SocialsWidget;
import 'package:flutter/material.dart';

class D9SocialsModel extends FlutterFlowModel<D9SocialsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
