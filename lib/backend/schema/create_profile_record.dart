import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'create_profile_record.g.dart';

abstract class CreateProfileRecord
    implements Built<CreateProfileRecord, CreateProfileRecordBuilder> {
  static Serializer<CreateProfileRecord> get serializer =>
      _$createProfileRecordSerializer;

  String? get name;

  BuiltList<bool>? get city;

  BuiltList<bool>? get state;

  String? get phone;

  String? get info;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CreateProfileRecordBuilder builder) => builder
    ..name = ''
    ..city = ListBuilder()
    ..state = ListBuilder()
    ..phone = ''
    ..info = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('create_profile');

  static Stream<CreateProfileRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CreateProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CreateProfileRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CreateProfileRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..city = safeGet(() => ListBuilder(snapshot.data['city']))
          ..state = safeGet(() => ListBuilder(snapshot.data['state']))
          ..phone = snapshot.data['phone']
          ..info = snapshot.data['info']
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..ffRef = CreateProfileRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CreateProfileRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'create_profile',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CreateProfileRecord._();
  factory CreateProfileRecord(
          [void Function(CreateProfileRecordBuilder) updates]) =
      _$CreateProfileRecord;

  static CreateProfileRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCreateProfileRecordData({
  String? name,
  String? phone,
  String? info,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = serializers.toFirestore(
    CreateProfileRecord.serializer,
    CreateProfileRecord(
      (c) => c
        ..name = name
        ..city = null
        ..state = null
        ..phone = phone
        ..info = info
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber,
    ),
  );

  return firestoreData;
}
