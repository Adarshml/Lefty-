import '../add_org/add_org_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../donate_details/donate_details_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../map_org/map_org_widget.dart';
import '../myrequests_org/myrequests_org_widget.dart';
import '../orgprofile/orgprofile_widget.dart';
import '../request_food/request_food_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OrgHomeWidget extends StatefulWidget {
  const OrgHomeWidget({
    Key key,
    this.orghome,
  }) : super(key: key);

  final DocumentReference orghome;

  @override
  _OrgHomeWidgetState createState() => _OrgHomeWidgetState();
}

class _OrgHomeWidgetState extends State<OrgHomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserDocument?.orgregid != null) &&
          (currentUserDocument?.orgregid != '')) {
        return;
      }

      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => AddOrgWidget(),
        ),
        (r) => false,
      );
      return;
    });
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
            Icons.filter_list,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            scaffoldKey.currentState.openDrawer();
          },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RequestFoodWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AuthUserStreamWidget(
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  final imageUsersRecord = snapshot.data;
                  return Image.network(
                    valueOrDefault<String>(
                      currentUserDocument?.orgpicFromrUsers,
                      'https://firebasestorage.googleapis.com/v0/b/lefty-bdb52.appspot.com/o/assets%2F42de7cbe3ff10d84b2a281d4172da65c.png?alt=media&token=a72e1ee6-6c86-4dd8-a2cc-1055c613ae32',
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrgprofileWidget(),
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  'Profile',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Product Sans',
                        color: Colors.black,
                        useGoogleFonts: false,
                      ),
                ),
                subtitle: Text(
                  'View and edit profile',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            InkWell(
              onTap: () async {
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyrequestsOrgWidget(),
                  ),
                  (r) => false,
                );
              },
              child: ListTile(
                title: Text(
                  'Requests',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Product Sans',
                        color: Colors.black,
                        useGoogleFonts: false,
                      ),
                ),
                subtitle: Text(
                  'Food requests',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapOrgWidget(),
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  'Map',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Product Sans',
                        color: Colors.black,
                        useGoogleFonts: false,
                      ),
                ),
                subtitle: Text(
                  'Help and support',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<DonateRecord>>(
                  stream: queryDonateRecord(
                    queryBuilder: (donateRecord) => donateRecord
                        .where('ex_time', isGreaterThan: getCurrentTimestamp),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitChasingDots(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<DonateRecord> columnDonateRecordList = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(columnDonateRecordList.length,
                            (columnIndex) {
                          final columnDonateRecord =
                              columnDonateRecordList[columnIndex];
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DonateDetailsWidget(
                                    donateDetails: columnDonateRecord.reference,
                                    dmap: columnDonateRecord.donorLocation,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    StreamBuilder<List<DonateRecord>>(
                                      stream: queryDonateRecord(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<DonateRecord>
                                            imageDonateRecordList =
                                            snapshot.data;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data.isEmpty) {
                                          return Container();
                                        }
                                        final imageDonateRecord =
                                            imageDonateRecordList.isNotEmpty
                                                ? imageDonateRecordList.first
                                                : null;
                                        return Image.network(
                                          valueOrDefault<String>(
                                            columnDonateRecord.foodimageUrl,
                                            'https://firebasestorage.googleapis.com/v0/b/lefty-bdb52.appspot.com/o/food.jpg?alt=media&token=d739621c-1ef3-42fd-94b3-2e8670352672',
                                          ),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            StreamBuilder<List<DonateRecord>>(
                                              stream: queryDonateRecord(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: SpinKitChasingDots(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<DonateRecord>
                                                    textDonateRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final textDonateRecord =
                                                    textDonateRecordList
                                                            .isNotEmpty
                                                        ? textDonateRecordList
                                                            .first
                                                        : null;
                                                return Text(
                                                  columnDonateRecord.foodName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily:
                                                            'Product Sans',
                                                        color: Colors.black,
                                                        useGoogleFonts: false,
                                                      ),
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: StreamBuilder<
                                                  List<DonateRecord>>(
                                                stream: queryDonateRecord(
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
                                                            SpinKitChasingDots(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<DonateRecord>
                                                      textDonateRecordList =
                                                      snapshot.data;
                                                  // Return an empty Container when the document does not exist.
                                                  if (snapshot.data.isEmpty) {
                                                    return Container();
                                                  }
                                                  final textDonateRecord =
                                                      textDonateRecordList
                                                              .isNotEmpty
                                                          ? textDonateRecordList
                                                              .first
                                                          : null;
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      dateTimeFormat(
                                                          'd/M h:mm a',
                                                          columnDonateRecord
                                                              .prTime),
                                                      'Available',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Product Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                            StreamBuilder<List<DonateRecord>>(
                                              stream: queryDonateRecord(
                                                queryBuilder: (donateRecord) =>
                                                    donateRecord.where(
                                                        'quantity',
                                                        isGreaterThan: functions
                                                            .returnzero()),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: SpinKitChasingDots(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<DonateRecord>
                                                    textDonateRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final textDonateRecord =
                                                    textDonateRecordList
                                                            .isNotEmpty
                                                        ? textDonateRecordList
                                                            .first
                                                        : null;
                                                return Text(
                                                  columnDonateRecord.quantity
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily:
                                                            'Product Sans',
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                );
                                              },
                                            ),
                                            StreamBuilder<List<DonateRecord>>(
                                              stream: queryDonateRecord(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: SpinKitChasingDots(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<DonateRecord>
                                                    textDonateRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final textDonateRecord =
                                                    textDonateRecordList
                                                            .isNotEmpty
                                                        ? textDonateRecordList
                                                            .first
                                                        : null;
                                                return Text(
                                                  columnDonateRecord.status,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily:
                                                            'Product Sans',
                                                        color:
                                                            Color(0xFF3ACF24),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                );
                                              },
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
            ],
          ),
        ),
      ),
    );
  }
}
