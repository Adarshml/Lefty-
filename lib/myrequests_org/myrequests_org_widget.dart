import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../myrequestdetails_org/myrequestdetails_org_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyrequestsOrgWidget extends StatefulWidget {
  const MyrequestsOrgWidget({Key key}) : super(key: key);

  @override
  _MyrequestsOrgWidgetState createState() => _MyrequestsOrgWidgetState();
}

class _MyrequestsOrgWidgetState extends State<MyrequestsOrgWidget> {
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
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'org_home'),
              ),
              (r) => false,
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          'LEFTY',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
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
              Expanded(
                child: AuthUserStreamWidget(
                  child: StreamBuilder<List<RequestFoodRecord>>(
                    stream: queryRequestFoodRecord(
                      queryBuilder: (requestFoodRecord) =>
                          requestFoodRecord.where('req_by',
                              isEqualTo: currentUserDocument?.orgname),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<RequestFoodRecord> columnRequestFoodRecordList =
                          snapshot.data;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(columnRequestFoodRecordList.length,
                                  (columnIndex) {
                            final columnRequestFoodRecord =
                                columnRequestFoodRecordList[columnIndex];
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MyrequestdetailsOrgWidget(
                                      requestDetails:
                                          columnRequestFoodRecord.reference,
                                      rmap: columnRequestFoodRecord
                                          .requestLocation,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 7,
                                      color: Color(0x32171717),
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      StreamBuilder<List<RequestFoodRecord>>(
                                        stream: queryRequestFoodRecord(
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<RequestFoodRecord>
                                              imageRequestFoodRecordList =
                                              snapshot.data;
                                          // Return an empty Container when the document does not exist.
                                          if (snapshot.data.isEmpty) {
                                            return Container();
                                          }
                                          final imageRequestFoodRecord =
                                              imageRequestFoodRecordList
                                                      .isNotEmpty
                                                  ? imageRequestFoodRecordList
                                                      .first
                                                  : null;
                                          return Image.network(
                                            valueOrDefault<String>(
                                              columnRequestFoodRecord
                                                  .rqstdOrgcover,
                                              'https://firebasestorage.googleapis.com/v0/b/lefty-bdb52.appspot.com/o/assets%2Fdownload%20(1).jpg?alt=media&token=34230413-fcfc-4df0-ad0e-bec16958721c',
                                            ),
                                            width: 90,
                                            height: 90,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              StreamBuilder<
                                                  List<RequestFoodRecord>>(
                                                stream: queryRequestFoodRecord(
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<RequestFoodRecord>
                                                      textRequestFoodRecordList =
                                                      snapshot.data;
                                                  // Return an empty Container when the document does not exist.
                                                  if (snapshot.data.isEmpty) {
                                                    return Container();
                                                  }
                                                  final textRequestFoodRecord =
                                                      textRequestFoodRecordList
                                                              .isNotEmpty
                                                          ? textRequestFoodRecordList
                                                              .first
                                                          : null;
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      columnRequestFoodRecord
                                                          .acceptedby,
                                                      'Waiting list',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: StreamBuilder<
                                                    List<RequestFoodRecord>>(
                                                  stream:
                                                      queryRequestFoodRecord(
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<RequestFoodRecord>
                                                        textRequestFoodRecordList =
                                                        snapshot.data;
                                                    // Return an empty Container when the document does not exist.
                                                    if (snapshot.data.isEmpty) {
                                                      return Container();
                                                    }
                                                    final textRequestFoodRecord =
                                                        textRequestFoodRecordList
                                                                .isNotEmpty
                                                            ? textRequestFoodRecordList
                                                                .first
                                                            : null;
                                                    return Text(
                                                      dateTimeFormat(
                                                          'd/M h:mm a',
                                                          columnRequestFoodRecord
                                                              .rDate),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: StreamBuilder<
                                                    List<RequestFoodRecord>>(
                                                  stream:
                                                      queryRequestFoodRecord(
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<RequestFoodRecord>
                                                        textRequestFoodRecordList =
                                                        snapshot.data;
                                                    // Return an empty Container when the document does not exist.
                                                    if (snapshot.data.isEmpty) {
                                                      return Container();
                                                    }
                                                    final textRequestFoodRecord =
                                                        textRequestFoodRecordList
                                                                .isNotEmpty
                                                            ? textRequestFoodRecordList
                                                                .first
                                                            : null;
                                                    return Text(
                                                      columnRequestFoodRecord
                                                          .requeststatus,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .subtitle1
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 4, 4),
                                        child: Icon(
                                          Icons.chevron_right_rounded,
                                          color: Color(0xFF57636C),
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
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
    );
  }
}
