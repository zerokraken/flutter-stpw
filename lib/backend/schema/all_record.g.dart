// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllRecord> _$allRecordSerializer = new _$AllRecordSerializer();

class _$AllRecordSerializer implements StructuredSerializer<AllRecord> {
  @override
  final Iterable<Type> types = const [AllRecord, _$AllRecord];
  @override
  final String wireName = 'AllRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AllRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.editTime;
    if (value != null) {
      result
        ..add('edit_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createTime;
    if (value != null) {
      result
        ..add('create_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uploadImg;
    if (value != null) {
      result
        ..add('upload_img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.downloadImg;
    if (value != null) {
      result
        ..add('download_img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maps;
    if (value != null) {
      result
        ..add('maps')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AllRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'edit_time':
          result.editTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'create_time':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'upload_img':
          result.uploadImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'download_img':
          result.downloadImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'maps':
          result.maps = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AllRecord extends AllRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? time;
  @override
  final String? phoneNumber;
  @override
  final DateTime? editTime;
  @override
  final DateTime? createTime;
  @override
  final String? description;
  @override
  final String? userName;
  @override
  final String? createdBy;
  @override
  final String? uploadImg;
  @override
  final String? downloadImg;
  @override
  final LatLng? maps;
  @override
  final int? password;
  @override
  final DateTime? createdTime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AllRecord([void Function(AllRecordBuilder)? updates]) =>
      (new AllRecordBuilder()..update(updates))._build();

  _$AllRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.time,
      this.phoneNumber,
      this.editTime,
      this.createTime,
      this.description,
      this.userName,
      this.createdBy,
      this.uploadImg,
      this.downloadImg,
      this.maps,
      this.password,
      this.createdTime,
      this.ffRef})
      : super._();

  @override
  AllRecord rebuild(void Function(AllRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllRecordBuilder toBuilder() => new AllRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        time == other.time &&
        phoneNumber == other.phoneNumber &&
        editTime == other.editTime &&
        createTime == other.createTime &&
        description == other.description &&
        userName == other.userName &&
        createdBy == other.createdBy &&
        uploadImg == other.uploadImg &&
        downloadImg == other.downloadImg &&
        maps == other.maps &&
        password == other.password &&
        createdTime == other.createdTime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, editTime.hashCode);
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, uploadImg.hashCode);
    _$hash = $jc(_$hash, downloadImg.hashCode);
    _$hash = $jc(_$hash, maps.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('time', time)
          ..add('phoneNumber', phoneNumber)
          ..add('editTime', editTime)
          ..add('createTime', createTime)
          ..add('description', description)
          ..add('userName', userName)
          ..add('createdBy', createdBy)
          ..add('uploadImg', uploadImg)
          ..add('downloadImg', downloadImg)
          ..add('maps', maps)
          ..add('password', password)
          ..add('createdTime', createdTime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AllRecordBuilder implements Builder<AllRecord, AllRecordBuilder> {
  _$AllRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DateTime? _editTime;
  DateTime? get editTime => _$this._editTime;
  set editTime(DateTime? editTime) => _$this._editTime = editTime;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  String? _uploadImg;
  String? get uploadImg => _$this._uploadImg;
  set uploadImg(String? uploadImg) => _$this._uploadImg = uploadImg;

  String? _downloadImg;
  String? get downloadImg => _$this._downloadImg;
  set downloadImg(String? downloadImg) => _$this._downloadImg = downloadImg;

  LatLng? _maps;
  LatLng? get maps => _$this._maps;
  set maps(LatLng? maps) => _$this._maps = maps;

  int? _password;
  int? get password => _$this._password;
  set password(int? password) => _$this._password = password;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AllRecordBuilder() {
    AllRecord._initializeBuilder(this);
  }

  AllRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _time = $v.time;
      _phoneNumber = $v.phoneNumber;
      _editTime = $v.editTime;
      _createTime = $v.createTime;
      _description = $v.description;
      _userName = $v.userName;
      _createdBy = $v.createdBy;
      _uploadImg = $v.uploadImg;
      _downloadImg = $v.downloadImg;
      _maps = $v.maps;
      _password = $v.password;
      _createdTime = $v.createdTime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllRecord;
  }

  @override
  void update(void Function(AllRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllRecord build() => _build();

  _$AllRecord _build() {
    final _$result = _$v ??
        new _$AllRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            time: time,
            phoneNumber: phoneNumber,
            editTime: editTime,
            createTime: createTime,
            description: description,
            userName: userName,
            createdBy: createdBy,
            uploadImg: uploadImg,
            downloadImg: downloadImg,
            maps: maps,
            password: password,
            createdTime: createdTime,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
