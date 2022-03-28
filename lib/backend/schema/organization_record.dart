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
  @BuiltValueField(wireName: 'org_password')
  String get orgPassword;

  @nullable
  @BuiltValueField(wireName: 'org_confirm_password')
  String get orgConfirmPassword;

  @nullable
  @BuiltValueField(wireName: 'org_regid')
  int get orgRegid;

  @nullable
  @BuiltValueField(wireName: 'org_phone_number')
  double get orgPhoneNumber;

  @nullable
  @BuiltValueField(wireName: 'org_photo_url')
  String get orgPhotoUrl;

  @nullable
  @BuiltValueField(wireName: 'org_created_time')
  DateTime get orgCreatedTime;

  @nullable
  @BuiltValueField(wireName: 'org_about')
  String get orgAbout;

  @nullable
  DocumentReference get users;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrganizationRecordBuilder builder) => builder
    ..orgName = ''
    ..orgEmail = ''
    ..orgPassword = ''
    ..orgConfirmPassword = ''
    ..orgRegid = 0
    ..orgPhoneNumber = 0.0
    ..orgPhotoUrl = ''
    ..orgAbout = '';

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
  String orgPassword,
  String orgConfirmPassword,
  int orgRegid,
  double orgPhoneNumber,
  String orgPhotoUrl,
  DateTime orgCreatedTime,
  String orgAbout,
  DocumentReference users,
}) =>
    serializers.toFirestore(
        OrganizationRecord.serializer,
        OrganizationRecord((o) => o
          ..orgName = orgName
          ..orgEmail = orgEmail
          ..orgPassword = orgPassword
          ..orgConfirmPassword = orgConfirmPassword
          ..orgRegid = orgRegid
          ..orgPhoneNumber = orgPhoneNumber
          ..orgPhotoUrl = orgPhotoUrl
          ..orgCreatedTime = orgCreatedTime
          ..orgAbout = orgAbout
          ..users = users));
