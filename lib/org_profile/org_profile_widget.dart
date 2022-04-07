import '../backend/backend.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrgProfileWidget extends StatefulWidget {
  const OrgProfileWidget({Key key}) : super(key: key);

  @override
  _OrgProfileWidgetState createState() => _OrgProfileWidgetState();
}

class _OrgProfileWidgetState extends State<OrgProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
          child: Text(
            'Profile',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.82, -0.02),
                      child: Icon(
                        Icons.add_business,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.82, -0.34),
                      child: Icon(
                        Icons.adjust_rounded,
                        color: Color(0xFF090F13),
                        size: 24,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.82, -0.17),
                      child: Icon(
                        Icons.phone_sharp,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.56, -0.06),
                      child: Text(
                        'Address',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.71, -0.46),
                      child: StreamBuilder<List<OrganizationRecord>>(
                        stream: queryOrganizationRecord(
                          singleRecord: true,
                        ),
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
                          List<OrganizationRecord> textOrganizationRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final textOrganizationRecord =
                              textOrganizationRecordList.isNotEmpty
                                  ? textOrganizationRecordList.first
                                  : null;
                          return Text(
                            valueOrDefault<String>(
                              textOrganizationRecord.orgEmail,
                              'emailaddress',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.56, -0.31),
                      child: StreamBuilder<List<OrganizationRecord>>(
                        stream: queryOrganizationRecord(
                          singleRecord: true,
                        ),
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
                          List<OrganizationRecord> textOrganizationRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final textOrganizationRecord =
                              textOrganizationRecordList.isNotEmpty
                                  ? textOrganizationRecordList.first
                                  : null;
                          return Text(
                            valueOrDefault<String>(
                              textOrganizationRecord.orgAbout,
                              'Available',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.71, -0.6),
                      child: StreamBuilder<List<OrganizationRecord>>(
                        stream: queryOrganizationRecord(
                          singleRecord: true,
                        ),
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
                          List<OrganizationRecord> textOrganizationRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final textOrganizationRecord =
                              textOrganizationRecordList.isNotEmpty
                                  ? textOrganizationRecordList.first
                                  : null;
                          return Text(
                            valueOrDefault<String>(
                              textOrganizationRecord.orgName,
                              'name',
                            ),
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.84, -0.93),
                      child: StreamBuilder<List<OrganizationRecord>>(
                        stream: queryOrganizationRecord(
                          singleRecord: true,
                        ),
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
                          List<OrganizationRecord>
                              circleImageOrganizationRecordList = snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final circleImageOrganizationRecord =
                              circleImageOrganizationRecordList.isNotEmpty
                                  ? circleImageOrganizationRecordList.first
                                  : null;
                          return Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://picsum.photos/seed/990/600',
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.56, -0.35),
                      child: Text(
                        'About',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.55, -0.2),
                      child: Text(
                        'Phone',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.01, 0.46),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginWidget(),
                            ),
                          );
                        },
                        text: 'Delete',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.68, -0.47),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileWidget(),
                            ),
                          );
                        },
                        text: 'Edit Profile',
                        options: FFButtonOptions(
                          width: 100,
                          height: 30,
                          color: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.39, -0.02),
                      child: StreamBuilder<List<OrganizationRecord>>(
                        stream: queryOrganizationRecord(
                          singleRecord: true,
                        ),
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
                          List<OrganizationRecord> textOrganizationRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final textOrganizationRecord =
                              textOrganizationRecordList.isNotEmpty
                                  ? textOrganizationRecordList.first
                                  : null;
                          return Text(
                            textOrganizationRecord.orgAddress,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      fontWeight: FontWeight.w500,
                                    ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.71, -0.53),
                      child: StreamBuilder<List<OrganizationRecord>>(
                        stream: queryOrganizationRecord(
                          singleRecord: true,
                        ),
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
                          List<OrganizationRecord> textOrganizationRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final textOrganizationRecord =
                              textOrganizationRecordList.isNotEmpty
                                  ? textOrganizationRecordList.first
                                  : null;
                          return Text(
                            valueOrDefault<String>(
                              textOrganizationRecord.orgRegid.toString(),
                              'emailaddress',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.44, -0.16),
                      child: StreamBuilder<List<OrganizationRecord>>(
                        stream: queryOrganizationRecord(
                          singleRecord: true,
                        ),
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
                          List<OrganizationRecord> textOrganizationRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final textOrganizationRecord =
                              textOrganizationRecordList.isNotEmpty
                                  ? textOrganizationRecordList.first
                                  : null;
                          return Text(
                            valueOrDefault<String>(
                              textOrganizationRecord.orgPhoneNumber.toString(),
                              '+91',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      fontWeight: FontWeight.w500,
                                    ),
                          );
                        },
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
