import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  TextEditingController emailAddressController;
  TextEditingController fullNameController;
  TextEditingController phoneController;
  TextEditingController myBioController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    myBioController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'profile'),
              ),
            );
          },
        ),
        title: Text(
          'Edit Profile',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(130, 30, 0, 0),
                      child: Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          '',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.05, -0.09),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(110, 20, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('changePhoto pressed ...');
                          },
                          text: 'Change Photo',
                          options: FFButtonOptions(
                            width: 150,
                            height: 35,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: TextFormField(
                    controller: fullNameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontWeight: FontWeight.normal,
                              ),
                      hintText: 'Enter your name here...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
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
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 0, 24, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF14181B),
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                  child: TextFormField(
                    controller: emailAddressController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontWeight: FontWeight.normal,
                              ),
                      hintText: 'Enter your email here...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
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
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 0, 24, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF14181B),
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                  child: TextFormField(
                    controller: phoneController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Phone ',
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontWeight: FontWeight.normal,
                              ),
                      hintText: 'Enter your phone number',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontWeight: FontWeight.normal,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 0, 24, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF14181B),
                          fontWeight: FontWeight.normal,
                        ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: myBioController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontWeight: FontWeight.normal,
                              ),
                      hintText: '[bio]',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
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
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 0, 24, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF14181B),
                          fontWeight: FontWeight.normal,
                        ),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.05, -0.09),
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
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final saveUsersRecord = snapshot.data;
                        return FFButtonWidget(
                          onPressed: () async {
                            final usersUpdateData = createUsersRecordData(
                              name: fullNameController.text,
                              emailAddress: emailAddressController.text,
                              bio: myBioController.text,
                              phoneNumber: phoneController.text,
                            );
                            await saveUsersRecord.reference
                                .update(usersUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'profile'),
                              ),
                            );
                          },
                          text: 'Save Changes',
                          options: FFButtonOptions(
                            width: 250,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
