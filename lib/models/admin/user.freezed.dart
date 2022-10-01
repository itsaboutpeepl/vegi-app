// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isSuperAdmin => throw _privateConstructorUsedError;
  String get firebaseSessionToken => throw _privateConstructorUsedError;
  num? get vendor => throw _privateConstructorUsedError;
  String get vendorRole => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String phone,
      String email,
      String name,
      bool isSuperAdmin,
      String firebaseSessionToken,
      num? vendor,
      String vendorRole});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? isSuperAdmin = freezed,
    Object? firebaseSessionToken = freezed,
    Object? vendor = freezed,
    Object? vendorRole = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSuperAdmin: isSuperAdmin == freezed
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      firebaseSessionToken: firebaseSessionToken == freezed
          ? _value.firebaseSessionToken
          : firebaseSessionToken // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as num?,
      vendorRole: vendorRole == freezed
          ? _value.vendorRole
          : vendorRole // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String phone,
      String email,
      String name,
      bool isSuperAdmin,
      String firebaseSessionToken,
      num? vendor,
      String vendorRole});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? isSuperAdmin = freezed,
    Object? firebaseSessionToken = freezed,
    Object? vendor = freezed,
    Object? vendorRole = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSuperAdmin: isSuperAdmin == freezed
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      firebaseSessionToken: firebaseSessionToken == freezed
          ? _value.firebaseSessionToken
          : firebaseSessionToken // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as num?,
      vendorRole: vendorRole == freezed
          ? _value.vendorRole
          : vendorRole // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {required this.id,
      required this.phone,
      this.email = '',
      this.name = '',
      this.isSuperAdmin = false,
      this.firebaseSessionToken = '',
      this.vendor = null,
      this.vendorRole = ''})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final String phone;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final bool isSuperAdmin;
  @override
  @JsonKey()
  final String firebaseSessionToken;
  @override
  @JsonKey()
  final num? vendor;
  @override
  @JsonKey()
  final String vendorRole;

  @override
  String toString() {
    return 'User(id: $id, phone: $phone, email: $email, name: $name, isSuperAdmin: $isSuperAdmin, firebaseSessionToken: $firebaseSessionToken, vendor: $vendor, vendorRole: $vendorRole)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.isSuperAdmin, isSuperAdmin) &&
            const DeepCollectionEquality()
                .equals(other.firebaseSessionToken, firebaseSessionToken) &&
            const DeepCollectionEquality().equals(other.vendor, vendor) &&
            const DeepCollectionEquality()
                .equals(other.vendorRole, vendorRole));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isSuperAdmin),
      const DeepCollectionEquality().hash(firebaseSessionToken),
      const DeepCollectionEquality().hash(vendor),
      const DeepCollectionEquality().hash(vendorRole));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {required final String id,
      required final String phone,
      final String email,
      final String name,
      final bool isSuperAdmin,
      final String firebaseSessionToken,
      final num? vendor,
      final String vendorRole}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get isSuperAdmin => throw _privateConstructorUsedError;
  @override
  String get firebaseSessionToken => throw _privateConstructorUsedError;
  @override
  num? get vendor => throw _privateConstructorUsedError;
  @override
  String get vendorRole => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
