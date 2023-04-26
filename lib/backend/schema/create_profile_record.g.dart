// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_profile_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreateProfileRecord> _$createProfileRecordSerializer =
    new _$CreateProfileRecordSerializer();

class _$CreateProfileRecordSerializer
    implements StructuredSerializer<CreateProfileRecord> {
  @override
  final Iterable<Type> types = const [
    CreateProfileRecord,
    _$CreateProfileRecord
  ];
  @override
  final String wireName = 'CreateProfileRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreateProfileRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(bool)])));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(bool)])));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.info;
    if (value != null) {
      result
        ..add('info')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
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
  CreateProfileRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreateProfileRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
          break;
        case 'state':
          result.state.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
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
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$CreateProfileRecord extends CreateProfileRecord {
  @override
  final String? name;
  @override
  final BuiltList<bool>? city;
  @override
  final BuiltList<bool>? state;
  @override
  final String? phone;
  @override
  final String? info;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CreateProfileRecord(
          [void Function(CreateProfileRecordBuilder)? updates]) =>
      (new CreateProfileRecordBuilder()..update(updates))._build();

  _$CreateProfileRecord._(
      {this.name,
      this.city,
      this.state,
      this.phone,
      this.info,
      this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.ffRef})
      : super._();

  @override
  CreateProfileRecord rebuild(
          void Function(CreateProfileRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateProfileRecordBuilder toBuilder() =>
      new CreateProfileRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateProfileRecord &&
        name == other.name &&
        city == other.city &&
        state == other.state &&
        phone == other.phone &&
        info == other.info &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateProfileRecord')
          ..add('name', name)
          ..add('city', city)
          ..add('state', state)
          ..add('phone', phone)
          ..add('info', info)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CreateProfileRecordBuilder
    implements Builder<CreateProfileRecord, CreateProfileRecordBuilder> {
  _$CreateProfileRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<bool>? _city;
  ListBuilder<bool> get city => _$this._city ??= new ListBuilder<bool>();
  set city(ListBuilder<bool>? city) => _$this._city = city;

  ListBuilder<bool>? _state;
  ListBuilder<bool> get state => _$this._state ??= new ListBuilder<bool>();
  set state(ListBuilder<bool>? state) => _$this._state = state;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _info;
  String? get info => _$this._info;
  set info(String? info) => _$this._info = info;

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

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CreateProfileRecordBuilder() {
    CreateProfileRecord._initializeBuilder(this);
  }

  CreateProfileRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _city = $v.city?.toBuilder();
      _state = $v.state?.toBuilder();
      _phone = $v.phone;
      _info = $v.info;
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateProfileRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateProfileRecord;
  }

  @override
  void update(void Function(CreateProfileRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateProfileRecord build() => _build();

  _$CreateProfileRecord _build() {
    _$CreateProfileRecord _$result;
    try {
      _$result = _$v ??
          new _$CreateProfileRecord._(
              name: name,
              city: _city?.build(),
              state: _state?.build(),
              phone: phone,
              info: info,
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'city';
        _city?.build();
        _$failedField = 'state';
        _state?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateProfileRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
