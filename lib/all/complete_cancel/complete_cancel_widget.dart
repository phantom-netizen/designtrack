import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'complete_cancel_model.dart';
export 'complete_cancel_model.dart';

class CompleteCancelWidget extends StatefulWidget {
  const CompleteCancelWidget({super.key});

  @override
  State<CompleteCancelWidget> createState() => _CompleteCancelWidgetState();
}

class _CompleteCancelWidgetState extends State<CompleteCancelWidget> {
  late CompleteCancelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompleteCancelModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: StreamBuilder<List<ProjectsRecord>>(
                stream: queryProjectsRecord(
                  queryBuilder: (projectsRecord) => projectsRecord.where(
                    'projectongoing',
                    isEqualTo: true,
                  ),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<ProjectsRecord> columnProjectsRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnProjectsRecord =
                      columnProjectsRecordList.isNotEmpty
                          ? columnProjectsRecordList.first
                          : null;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await columnProjectsRecord!.reference
                                  .update(createProjectsRecordData(
                                projectcompleted: true,
                                projectongoing: false,
                              ));

                              await NotificationRecord.collection
                                  .doc()
                                  .set(createNotificationRecordData(
                                    userId: currentUserReference,
                                    projectId: columnProjectsRecord.reference,
                                    timestamp: getCurrentTimestamp,
                                    type: 'project',
                                    action: 'completed',
                                  ));
                              Navigator.pop(context);
                            },
                            text: 'Mark as complete',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 2.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              hoverColor: const Color(0xFF9CD5F0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await columnProjectsRecord!.reference
                                .update(createProjectsRecordData(
                              projectongoing: false,
                              projectcancelled: true,
                            ));

                            await NotificationRecord.collection
                                .doc()
                                .set(createNotificationRecordData(
                                  userId: currentUserReference,
                                  projectId: columnProjectsRecord.reference,
                                  timestamp: getCurrentTimestamp,
                                  type: 'project',
                                  action: 'cancelled',
                                ));
                            Navigator.pop(context);
                          },
                          text: 'Cancel project',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            hoverColor: const Color(0xFFDA3E25),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: const Icon(
                Icons.close_rounded,
                color: Color(0xFF57636C),
                size: 30.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
