import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'requests_markers_record.g.dart';

abstract class RequestsMarkersRecord
    implements Built<RequestsMarkersRecord, RequestsMarkersRecordBuilder> {
  static Serializer<RequestsMarkersRecord> get serializer =>
      _$requestsMarkersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'org_name')
  String get orgName;

  @nullable
  LatLng get location;

  @nullable
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RequestsMarkersRecordBuilder builder) =>
      builder..orgName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requests_markers');

  static Stream<RequestsMarkersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RequestsMarkersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  RequestsMarkersRecord._();
  factory RequestsMarkersRecord(
          [void Function(RequestsMarkersRecordBuilder) updates]) =
      _$RequestsMarkersRecord;

  static RequestsMarkersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRequestsMarkersRecordData({
  String orgName,
  LatLng location,
  DateTime date,
}) =>
    serializers.toFirestore(
        RequestsMarkersRecord.serializer,
        RequestsMarkersRecord((r) => r
          ..orgName = orgName
          ..location = location
          ..date = date));
