import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'donor_markers_record.g.dart';

abstract class DonorMarkersRecord
    implements Built<DonorMarkersRecord, DonorMarkersRecordBuilder> {
  static Serializer<DonorMarkersRecord> get serializer =>
      _$donorMarkersRecordSerializer;

  @nullable
  String get name;

  @nullable
  LatLng get location;

  @nullable
  @BuiltValueField(wireName: 'ex_date')
  DateTime get exDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DonorMarkersRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('donor_markers');

  static Stream<DonorMarkersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DonorMarkersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DonorMarkersRecord._();
  factory DonorMarkersRecord(
          [void Function(DonorMarkersRecordBuilder) updates]) =
      _$DonorMarkersRecord;

  static DonorMarkersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDonorMarkersRecordData({
  String name,
  LatLng location,
  DateTime exDate,
}) =>
    serializers.toFirestore(
        DonorMarkersRecord.serializer,
        DonorMarkersRecord((d) => d
          ..name = name
          ..location = location
          ..exDate = exDate));
