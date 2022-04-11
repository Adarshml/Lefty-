import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'request_food_record.g.dart';

abstract class RequestFoodRecord
    implements Built<RequestFoodRecord, RequestFoodRecordBuilder> {
  static Serializer<RequestFoodRecord> get serializer =>
      _$requestFoodRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'r_date')
  DateTime get rDate;

  @nullable
  @BuiltValueField(wireName: 'r_quantity')
  int get rQuantity;

  @nullable
  @BuiltValueField(wireName: 'requested_by')
  DocumentReference get requestedBy;

  @nullable
  DocumentReference get orgnameref;

  @nullable
  @BuiltValueField(wireName: 'request_description')
  String get requestDescription;

  @nullable
  @BuiltValueField(wireName: 'request_location')
  LatLng get requestLocation;

  @nullable
  @BuiltValueField(wireName: 'req_by')
  String get reqBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RequestFoodRecordBuilder builder) => builder
    ..rQuantity = 0
    ..requestDescription = ''
    ..reqBy = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requestFood');

  static Stream<RequestFoodRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RequestFoodRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  RequestFoodRecord._();
  factory RequestFoodRecord([void Function(RequestFoodRecordBuilder) updates]) =
      _$RequestFoodRecord;

  static RequestFoodRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRequestFoodRecordData({
  DateTime rDate,
  int rQuantity,
  DocumentReference requestedBy,
  DocumentReference orgnameref,
  String requestDescription,
  LatLng requestLocation,
  String reqBy,
}) =>
    serializers.toFirestore(
        RequestFoodRecord.serializer,
        RequestFoodRecord((r) => r
          ..rDate = rDate
          ..rQuantity = rQuantity
          ..requestedBy = requestedBy
          ..orgnameref = orgnameref
          ..requestDescription = requestDescription
          ..requestLocation = requestLocation
          ..reqBy = reqBy));
