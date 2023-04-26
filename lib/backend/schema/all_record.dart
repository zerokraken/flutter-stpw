import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'all_record.g.dart';

abstract class AllRecord implements Built<AllRecord, AllRecordBuilder> {
  static Serializer<AllRecord> get serializer => _$allRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  DateTime? get time;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'edit_time')
  DateTime? get editTime;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  String? get description;

  @BuiltValueField(wireName: 'user_name')
  String? get userName;

  @BuiltValueField(wireName: 'created_by')
  String? get createdBy;

  @BuiltValueField(wireName: 'upload_img')
  String? get uploadImg;

  @BuiltValueField(wireName: 'download_img')
  String? get downloadImg;

  LatLng? get maps;

  int? get password;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AllRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..description = ''
    ..userName = ''
    ..createdBy = ''
    ..uploadImg = ''
    ..downloadImg = ''
    ..password = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('All');

  static Stream<AllRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AllRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static AllRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => AllRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..time = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..editTime = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['edit_time']))
          ..createTime = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['create_time']))
          ..description = snapshot.data['description']
          ..userName = snapshot.data['user_name']
          ..createdBy = snapshot.data['created_by']
          ..uploadImg = snapshot.data['upload_img']
          ..downloadImg = snapshot.data['download_img']
          ..maps = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..password = snapshot.data['password']?.round()
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..ffRef = AllRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AllRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'All',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  AllRecord._();
  factory AllRecord([void Function(AllRecordBuilder) updates]) = _$AllRecord;

  static AllRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAllRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? time,
  String? phoneNumber,
  DateTime? editTime,
  DateTime? createTime,
  String? description,
  String? userName,
  String? createdBy,
  String? uploadImg,
  String? downloadImg,
  LatLng? maps,
  int? password,
  DateTime? createdTime,
}) {
  final firestoreData = serializers.toFirestore(
    AllRecord.serializer,
    AllRecord(
      (a) => a
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..time = time
        ..phoneNumber = phoneNumber
        ..editTime = editTime
        ..createTime = createTime
        ..description = description
        ..userName = userName
        ..createdBy = createdBy
        ..uploadImg = uploadImg
        ..downloadImg = downloadImg
        ..maps = maps
        ..password = password
        ..createdTime = createdTime,
    ),
  );

  return firestoreData;
}
