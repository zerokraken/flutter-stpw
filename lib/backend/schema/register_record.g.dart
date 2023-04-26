// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegisterRecord> _$registerRecordSerializer =
    new _$RegisterRecordSerializer();

class _$RegisterRecordSerializer
    implements StructuredSerializer<RegisterRecord> {
  @override
  final Iterable<Type> types = const [RegisterRecord, _$RegisterRecord];
  @override
  final String wireName = 'RegisterRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RegisterRecord object,
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
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
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
  RegisterRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterRecordBuilder();

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
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
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

class _$RegisterRecord extends RegisterRecord {
  @override
  final String? name;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final int? phone;
  @override
  final String? bio;
  @override
  final String? img;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RegisterRecord([void Function(RegisterRecordBuilder)? updates]) =>
      (new RegisterRecordBuilder()..update(updates))._build();

  _$RegisterRecord._(
      {this.name,
      this.city,
      this.state,
      this.phone,
      this.bio,
      this.img,
      this.ffRef})
      : super._();

  @override
  RegisterRecord rebuild(void Function(RegisterRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterRecordBuilder toBuilder() =>
      new RegisterRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterRecord &&
        name == other.name &&
        city == other.city &&
        state == other.state &&
        phone == other.phone &&
        bio == other.bio &&
        img == other.img &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, img.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterRecord')
          ..add('name', name)
          ..add('city', city)
          ..add('state', state)
          ..add('phone', phone)
          ..add('bio', bio)
          ..add('img', img)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RegisterRecordBuilder
    implements Builder<RegisterRecord, RegisterRecordBuilder> {
  _$RegisterRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  int? _phone;
  int? get phone => _$this._phone;
  set phone(int? phone) => _$this._phone = phone;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RegisterRecordBuilder() {
    RegisterRecord._initializeBuilder(this);
  }

  RegisterRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _city = $v.city;
      _state = $v.state;
      _phone = $v.phone;
      _bio = $v.bio;
      _img = $v.img;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterRecord;
  }

  @override
  void update(void Function(RegisterRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterRecord build() => _build();

  _$RegisterRecord _build() {
    final _$result = _$v ??
        new _$RegisterRecord._(
            name: name,
            city: city,
            state: state,
            phone: phone,
            bio: bio,
            img: img,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
