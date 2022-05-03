import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'donate_record.g.dart';

abstract class DonateRecord
    implements Built<DonateRecord, DonateRecordBuilder> {
  static Serializer<DonateRecord> get serializer => _$donateRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'food_name')
  String get foodName;

  @nullable
  @BuiltValueField(wireName: 'pickup_place')
  String get pickupPlace;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'donated_by')
  DocumentReference get donatedBy;

  @nullable
  @BuiltValueField(wireName: 'donated_at')
  DateTime get donatedAt;

  @nullable
  String get username;

  @nullable
  @BuiltValueField(wireName: 'donor_location')
  LatLng get donorLocation;

  @nullable
  @BuiltValueField(wireName: 'don_by')
  String get donBy;

  @nullable
  @BuiltValueField(wireName: 'pr_time')
  DateTime get prTime;

  @nullable
  @BuiltValueField(wireName: 'ex_time')
  DateTime get exTime;

  @nullable
  String get description;

  @nullable
  String get status;

  @nullable
  DocumentReference get mylistingref;

  @nullable
  @BuiltValueField(wireName: 'don_email')
  String get donEmail;

  @nullable
  int get quantity;

  @nullable
  @BuiltValueField(wireName: 'Foodimage_url')
  String get foodimageUrl;

  @nullable
  String get claimedby;

  @nullable
  int get initialquantity;

  @nullable
  @BuiltValueField(wireName: 'clymd_by')
  DocumentReference get clymdBy;

  @nullable
  BuiltList<LatLng> get donateMarkers;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DonateRecordBuilder builder) => builder
    ..foodName = ''
    ..pickupPlace = ''
    ..phoneNumber = ''
    ..username = ''
    ..donBy = ''
    ..description = ''
    ..status = ''
    ..donEmail = ''
    ..quantity = 0
    ..foodimageUrl = ''
    ..claimedby = ''
    ..initialquantity = 0
    ..donateMarkers = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('donate');

  static Stream<DonateRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DonateRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DonateRecord._();
  factory DonateRecord([void Function(DonateRecordBuilder) updates]) =
      _$DonateRecord;

  static DonateRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDonateRecordData({
  String foodName,
  String pickupPlace,
  String phoneNumber,
  DocumentReference donatedBy,
  DateTime donatedAt,
  String username,
  LatLng donorLocation,
  String donBy,
  DateTime prTime,
  DateTime exTime,
  String description,
  String status,
  DocumentReference mylistingref,
  String donEmail,
  int quantity,
  String foodimageUrl,
  String claimedby,
  int initialquantity,
  DocumentReference clymdBy,
}) =>
    serializers.toFirestore(
        DonateRecord.serializer,
        DonateRecord((d) => d
          ..foodName = foodName
          ..pickupPlace = pickupPlace
          ..phoneNumber = phoneNumber
          ..donatedBy = donatedBy
          ..donatedAt = donatedAt
          ..username = username
          ..donorLocation = donorLocation
          ..donBy = donBy
          ..prTime = prTime
          ..exTime = exTime
          ..description = description
          ..status = status
          ..mylistingref = mylistingref
          ..donEmail = donEmail
          ..quantity = quantity
          ..foodimageUrl = foodimageUrl
          ..claimedby = claimedby
          ..initialquantity = initialquantity
          ..clymdBy = clymdBy
          ..donateMarkers = null));
