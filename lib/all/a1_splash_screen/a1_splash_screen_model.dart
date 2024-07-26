import '/flutter_flow/flutter_flow_util.dart';
import 'a1_splash_screen_widget.dart' show A1SplashScreenWidget;
import 'package:flutter/material.dart';

class A1SplashScreenModel extends FlutterFlowModel<A1SplashScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
