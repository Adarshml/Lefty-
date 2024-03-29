import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get password;

  @nullable
  String get name;

  @nullable
  String get emailAddress;

  @nullable
  String get confirmpassword;

  @nullable
  String get bio;

  @nullable
  DocumentReference get fooddonate;

  @nullable
  DocumentReference get org;

  @nullable
  String get orgname;

  @nullable
  String get orgregid;

  @nullable
  String get orgemail;

  @nullable
  DocumentReference get requestFood;

  @nullable
  LatLng get location;

  @nullable
  @BuiltValueField(wireName: 'mylistingdnr_ref')
  DocumentReference get mylistingdnrRef;

  @nullable
  String get orgpicFromrUsers;

  @nullable
  String get orgCNfromusers;

  @nullable
  @BuiltValueField(wireName: 'org_address_usr')
  String get orgAddressUsr;

  @nullable
  @BuiltValueField(wireName: 'orgabout_usr')
  String get orgaboutUsr;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..password = ''
    ..name = ''
    ..emailAddress = ''
    ..confirmpassword = ''
    ..bio = ''
    ..orgname = ''
    ..orgregid = ''
    ..orgemail = ''
    ..orgpicFromrUsers = ''
    ..orgCNfromusers = ''
    ..orgAddressUsr = ''
    ..orgaboutUsr = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String password,
  String name,
  String emailAddress,
  String confirmpassword,
  String bio,
  DocumentReference fooddonate,
  DocumentReference org,
  String orgname,
  String orgregid,
  String orgemail,
  DocumentReference requestFood,
  LatLng location,
  DocumentReference mylistingdnrRef,
  String orgpicFromrUsers,
  String orgCNfromusers,
  String orgAddressUsr,
  String orgaboutUsr,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..password = password
          ..name = name
          ..emailAddress = emailAddress
          ..confirmpassword = confirmpassword
          ..bio = bio
          ..fooddonate = fooddonate
          ..org = org
          ..orgname = orgname
          ..orgregid = orgregid
          ..orgemail = orgemail
          ..requestFood = requestFood
          ..location = location
          ..mylistingdnrRef = mylistingdnrRef
          ..orgpicFromrUsers = orgpicFromrUsers
          ..orgCNfromusers = orgCNfromusers
          ..orgAddressUsr = orgAddressUsr
          ..orgaboutUsr = orgaboutUsr));
