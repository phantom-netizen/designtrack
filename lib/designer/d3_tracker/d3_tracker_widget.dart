import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/designer/d4_history/d4_history_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'd3_tracker_model.dart';
export 'd3_tracker_model.dart';

class D3TrackerWidget extends StatefulWidget {
  const D3TrackerWidget({
    super.key,
    this.projectName,
  });

  final String? projectName;

  @override
  State<D3TrackerWidget> createState() => _D3TrackerWidgetState();
}

class _D3TrackerWidgetState extends State<D3TrackerWidget> {
  late D3TrackerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => D3TrackerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Project Progress',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
            ),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.projectName,
                      'Progress',
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FutureBuilder<int>(
                        future: queryTasksRecordCount(
                          queryBuilder: (tasksRecord) => tasksRecord.where(
                            'completed',
                            isEqualTo: true,
                          ),
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
                          int progressBarCount = snapshot.data!;

                          return CircularPercentIndicator(
                            percent: valueOrDefault<int>(
                                  progressBarCount,
                                  0,
                                ) /
                                valueOrDefault<int>(
                                  (currentUserDocument?.tasks.toList() ?? [])
                                      .length,
                                  0,
                                ),
                            radius: 100.0,
                            lineWidth: 20.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: const Color(0xFFFEDD02),
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            center: Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  progressBarCount.toDouble() /
                                      (currentUserDocument?.tasks.toList() ??
                                              [])
                                          .length
                                          .toDouble(),
                                  formatType: FormatType.percent,
                                ),
                                '0%',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: D4HistoryWidget(
                                projectName: widget.projectName,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Container(
                      width: 284.0,
                      height: 53.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(64.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(0xFFFEDD02),
                          width: 3.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Status:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          StreamBuilder<List<TasksRecord>>(
                            stream: queryTasksRecord(
                              queryBuilder: (tasksRecord) => tasksRecord.where(
                                'completed',
                                isEqualTo: false,
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
                              List<TasksRecord> textTasksRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textTasksRecord =
                                  textTasksRecordList.isNotEmpty
                                      ? textTasksRecordList.first
                                      : null;

                              return Text(
                                valueOrDefault<String>(
                                  textTasksRecord?.name,
                                  'no tasks',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ].divide(const SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Container(
                    width: 284.0,
                    height: 53.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEDD02),
                      borderRadius: BorderRadius.circular(64.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: const Color(0xFFFEDD02),
                        width: 3.0,
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Design will be ready in',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: StreamBuilder<List<ProjectsRecord>>(
                      stream: queryProjectsRecord(
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
                        List<ProjectsRecord> rowProjectsRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final rowProjectsRecord =
                            rowProjectsRecordList.isNotEmpty
                                ? rowProjectsRecordList.first
                                : null;

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'EEEE',
                                    rowProjectsRecord?.estimatedTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Monday',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: const Color(0xFFFEDD02),
                                      fontSize: 70.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 15.0)),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ].divide(const SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
