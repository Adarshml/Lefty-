import '../backend/backend.dart';
import '../donate_details/donate_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrgHomeCopyWidget extends StatefulWidget {
  const OrgHomeCopyWidget({Key key}) : super(key: key);

  @override
  _OrgHomeCopyWidgetState createState() => _OrgHomeCopyWidgetState();
}

class _OrgHomeCopyWidgetState extends State<OrgHomeCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
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
                child: StreamBuilder<List<DonateRecord>>(
                  stream: queryDonateRecord(),
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
                    List<DonateRecord> columnDonateRecordList = snapshot.data;
                    return Column(
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
                                  Image.asset(
                                    'assets/images/-undraw_conversation_re_c26v@2x.png',
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
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
                                                  columnDonateRecord.foodName,
                                                  'oi',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF090F13),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
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
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
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
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
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