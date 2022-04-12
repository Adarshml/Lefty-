import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'organization_record.g.dart';

abstract class OrganizationRecord
    implements Built<OrganizationRecord, OrganizationRecordBuilder> {
  static Serializer<OrganizationRecord> get serializer =>
      _$organizationRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'org_name')
  String get orgName;

  @nullable
  @BuiltValueField(wireName: 'org_email')
  String get orgEmail;

  @nullable
  @BuiltValueField(wireName: 'org_phone_number')
  double get orgPhoneNumber;

  @nullable
  @BuiltValueField(wireName: 'org_about')
  String get orgAbout;

  @nullable
  @BuiltValueField(wireName: 'org_address')
  String get orgAddress;

  @nullable
  @BuiltValueField(wireName: 'org_photo')
  String get orgPhoto;

  @nullable
  DocumentReference get rf;

  @nullable
  @BuiltValueField(wireName: 'users_ref')
  DocumentReference get usersRef;

  @nullable
  @BuiltValueField(wireName: 'org_regid')
  String get orgRegid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrganizationRecordBuilder builder) => builder
    ..orgName = ''
    ..orgEmail = ''
    ..orgPhoneNumber = 0.0
    ..orgAbout = ''
    ..orgAddress = ''
    ..orgPhoto = ''
    ..orgRegid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organization');

  static Stream<OrganizationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrganizationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrganizationRecord._();
  factory OrganizationRecord(
          [void Function(OrganizationRecordBuilder) updates]) =
      _$OrganizationRecord;

  static OrganizationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrganizationRecordData({
  String orgName,
  String orgEmail,
  double orgPhoneNumber,
  String orgAbout,
  String orgAddress,
  String orgPhoto,
  DocumentReference rf,
  DocumentReference usersRef,
  String orgRegid,
}) =>
    serializers.toFirestore(
        OrganizationRecord.serializer,
        OrganizationRecord((o) => o
          ..orgName = orgName
          ..orgEmail = orgEmail
          ..orgPhoneNumber = orgPhoneNumber
          ..orgAbout = orgAbout
          ..orgAddress = orgAddress
          ..orgPhoto = orgPhoto
          ..rf = rf
          ..usersRef = usersRef
          ..orgRegid = orgRegid));
