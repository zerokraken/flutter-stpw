import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'register_record.g.dart';

abstract class RegisterRecord
    implements Built<RegisterRecord, RegisterRecordBuilder> {
  static Serializer<RegisterRecord> get serializer =>
      _$registerRecordSerializer;

  String? get name;

  String? get city;

  String? get state;

  int? get phone;

  String? get bio;

  String? get img;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RegisterRecordBuilder builder) => builder
    ..name = ''
    ..city = ''
    ..state = ''
    ..phone = 0
    ..bio = ''
    ..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('register');

  static Stream<RegisterRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RegisterRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static RegisterRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RegisterRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..city = snapshot.data['city']
          ..state = snapshot.data['state']
          ..phone = snapshot.data['phone']?.round()
          ..bio = snapshot.data['bio']
          ..img = snapshot.data['img']
          ..ffRef = RegisterRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RegisterRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'register',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  RegisterRecord._();
  factory RegisterRecord([void Function(RegisterRecordBuilder) updates]) =
      _$RegisterRecord;

  static RegisterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRegisterRecordData({
  String? name,
  String? city,
  String? state,
  int? phone,
  String? bio,
  String? img,
}) {
  final firestoreData = serializers.toFirestore(
    RegisterRecord.serializer,
    RegisterRecord(
      (r) => r
        ..name = name
        ..city = city
        ..state = state
        ..phone = phone
        ..bio = bio
        ..img = img,
    ),
  );

  return firestoreData;
}
