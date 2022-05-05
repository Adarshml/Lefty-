import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController confirmpasswordController;
  bool confirmpasswordVisibility;
  TextEditingController emailAddressController;
  TextEditingController nameController;
  TextEditingController passwordController;
  bool passwordVisibility;

  @override
  void initState() {
    super.initState();
    confirmpasswordController = TextEditingController();
    confirmpasswordVisibility = false;
    emailAddressController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-3.13, -0.62),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                        child: TextFormField(
                          controller: nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Enter your email here...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Product Sans',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.68, -0.28),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: emailAddressController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Enter your email here...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Product Sans',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.45, 0.03),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Enter your password here...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Product Sans',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.21, 0.4),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: confirmpasswordController,
                          obscureText: !confirmpasswordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Enter your password here...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF2B343A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => confirmpasswordVisibility =
                                    !confirmpasswordVisibility,
                              ),
                              child: Icon(
                                confirmpasswordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Product Sans',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.17, 0.73),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(currentUserReference),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitChasingDots(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            final buttonUsersRecord = snapshot.data;
                            return FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Create Account',
                              options: FFButtonOptions(
                                width: 230,
                                height: 50,
                                color: Color(0xFF090F13),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Product Sans',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: 8,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0.99),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(45, 0, 0, 0),
                              child: Text(
                                'Already have an account?',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Product Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginWidget(),
                                  ),
                                );
                              },
                              text: 'Login',
                              options: FFButtonOptions(
                                width: 80,
                                height: 30,
                                color: Color(0x00FFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Product Sans',
                                      color: Color(0xFFFFDE06),
                                      fontSize: 18,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
