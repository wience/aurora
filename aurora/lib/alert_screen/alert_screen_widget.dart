import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home/home_widget.dart';
import '../home_state3/home_state3_widget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertScreenWidget extends StatefulWidget {
  const AlertScreenWidget({Key? key}) : super(key: key);

  @override
  _AlertScreenWidgetState createState() => _AlertScreenWidgetState();
}

class _AlertScreenWidgetState extends State<AlertScreenWidget> {
  StopWatchTimer? timerController;
  String? timerValue;
  int? timerMilliseconds;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    timerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFFF6161),
            borderRadius: BorderRadius.circular(0),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 197, 20, 0),
                  child: Text(
                    'We will send an alert to the nearest Local Government Authority and all of your emergency contacts when the timer reaches zero.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 43, 0, 0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: FlutterFlowTimer(
                        timerValue: timerValue ??=
                            StopWatchTimer.getDisplayTime(
                          timerMilliseconds ??= 10000,
                          hours: false,
                          minute: false,
                          second: true,
                          milliSecond: false,
                        ),
                        timer: timerController ??= StopWatchTimer(
                          mode: StopWatchMode.countDown,
                          presetMillisecond: timerMilliseconds ??= 10000,
                          onChange: (value) {
                            setState(() {
                              timerMilliseconds = value;
                              timerValue = StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                minute: false,
                                second: true,
                                milliSecond: false,
                              );
                            });
                          },
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat Alternates',
                              color: Color(0xFFFE7878),
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            ),
                        onEnded: () async {
                          await launchUrl(Uri(
                            scheme: 'tel',
                            path: '',
                          ));
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: HomeWidget(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 62, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.topToBottom,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: HomeState3Widget(),
                      ),
                    );
                  },
                  text: 'Cancel',
                  options: FFButtonOptions(
                    width: 208,
                    height: 44,
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Montserrat Alternates',
                          color: Color(0xFFFF6161),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(96),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
