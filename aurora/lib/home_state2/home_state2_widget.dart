import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeState2Widget extends StatefulWidget {
  const HomeState2Widget({Key? key}) : super(key: key);

  @override
  _HomeState2WidgetState createState() => _HomeState2WidgetState();
}

class _HomeState2WidgetState extends State<HomeState2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Hello Wince',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).subtitle1.override(
                  fontFamily: 'Montserrat Alternates',
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF6161), Color(0xFF5B8DEE)],
              stops: [0, 0.7],
              begin: AlignmentDirectional(-0.94, -1),
              end: AlignmentDirectional(0.94, 1),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            shape: BoxShape.rectangle,
          ),
          child: Stack(
            alignment: AlignmentDirectional(0, 0),
            children: [
              Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(136, 36, 0, 0),
                  child: GradientText(
                    '26°',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat Alternates',
                          fontSize: 65,
                          fontWeight: FontWeight.bold,
                        ),
                    colors: [
                      Colors.white,
                      Color(0xE5FFFFFF),
                      Color(0x1AFFFFFF)
                    ],
                    gradientDirection: GradientDirection.ttb,
                    gradientType: GradientType.linear,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                  child: Image.asset(
                    'assets/images/weatherbad.png',
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.65, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 385, 20, 0),
                  child: GradientText(
                    'Today\'s Weather Looks Bad!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                    colors: [
                      Colors.white,
                      Color(0xE6FFFFFF),
                      Color(0x1AFFFFFF)
                    ],
                    gradientDirection: GradientDirection.ttb,
                    gradientType: GradientType.linear,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 459, 25, 0),
                  child: Text(
                    'We suggest updating your emergency contacts and reading the preparation tips in the “Safety Services” Section\n',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      color: Color(0xCBFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
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
