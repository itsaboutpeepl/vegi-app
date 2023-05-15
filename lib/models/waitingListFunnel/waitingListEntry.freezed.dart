// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'waitingListEntry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WaitingListEntry _$WaitingListEntryFromJson(Map<String, dynamic> json) {
  return _WaitingListEntry.fromJson(json);
}

/// @nodoc
mixin _$WaitingListEntry {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get onboarded => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  bool get emailUpdates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WaitingListEntryCopyWith<WaitingListEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaitingListEntryCopyWith<$Res> {
  factory $WaitingListEntryCopyWith(
          WaitingListEntry value, $Res Function(WaitingListEntry) then) =
      _$WaitingListEntryCopyWithImpl<$Res, WaitingListEntry>;
  @useResult
  $Res call(
      {int id,
      String email,
      bool onboarded,
      String origin,
      String userType,
      int order,
      bool emailUpdates});
}

/// @nodoc
class _$WaitingListEntryCopyWithImpl<$Res, $Val extends WaitingListEntry>
    implements $WaitingListEntryCopyWith<$Res> {
  _$WaitingListEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? onboarded = null,
    Object? origin = null,
    Object? userType = null,
    Object? order = null,
    Object? emailUpdates = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      onboarded: null == onboarded
          ? _value.onboarded
          : onboarded // ignore: cast_nullable_to_non_nullable
              as bool,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      emailUpdates: null == emailUpdates
          ? _value.emailUpdates
          : emailUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WaitingListEntryCopyWith<$Res>
    implements $WaitingListEntryCopyWith<$Res> {
  factory _$$_WaitingListEntryCopyWith(
          _$_WaitingListEntry value, $Res Function(_$_WaitingListEntry) then) =
      __$$_WaitingListEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      bool onboarded,
      String origin,
      String userType,
      int order,
      bool emailUpdates});
}

/// @nodoc
class __$$_WaitingListEntryCopyWithImpl<$Res>
    extends _$WaitingListEntryCopyWithImpl<$Res, _$_WaitingListEntry>
    implements _$$_WaitingListEntryCopyWith<$Res> {
  __$$_WaitingListEntryCopyWithImpl(
      _$_WaitingListEntry _value, $Res Function(_$_WaitingListEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? onboarded = null,
    Object? origin = null,
    Object? userType = null,
    Object? order = null,
    Object? emailUpdates = null,
  }) {
    return _then(_$_WaitingListEntry(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      onboarded: null == onboarded
          ? _value.onboarded
          : onboarded // ignore: cast_nullable_to_non_nullable
              as bool,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      emailUpdates: null == emailUpdates
          ? _value.emailUpdates
          : emailUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_WaitingListEntry extends _WaitingListEntry {
  _$_WaitingListEntry(
      {required this.id,
      required this.email,
      required this.onboarded,
      required this.origin,
      required this.userType,
      required this.order,
      required this.emailUpdates})
      : super._();

  factory _$_WaitingListEntry.fromJson(Map<String, dynamic> json) =>
      _$$_WaitingListEntryFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final bool onboarded;
  @override
  final String origin;
  @override
  final String userType;
  @override
  final int order;
  @override
  final bool emailUpdates;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WaitingListEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.onboarded, onboarded) ||
                other.onboarded == onboarded) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.emailUpdates, emailUpdates) ||
                other.emailUpdates == emailUpdates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, onboarded, origin, userType, order, emailUpdates);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WaitingListEntryCopyWith<_$_WaitingListEntry> get copyWith =>
      __$$_WaitingListEntryCopyWithImpl<_$_WaitingListEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WaitingListEntryToJson(
      this,
    );
  }
}

abstract class _WaitingListEntry extends WaitingListEntry {
  factory _WaitingListEntry(
      {required final int id,
      required final String email,
      required final bool onboarded,
      required final String origin,
      required final String userType,
      required final int order,
      required final bool emailUpdates}) = _$_WaitingListEntry;
  _WaitingListEntry._() : super._();

  factory _WaitingListEntry.fromJson(Map<String, dynamic> json) =
      _$_WaitingListEntry.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  bool get onboarded;
  @override
  String get origin;
  @override
  String get userType;
  @override
  int get order;
  @override
  bool get emailUpdates;
  @override
  @JsonKey(ignore: true)
  _$$_WaitingListEntryCopyWith<_$_WaitingListEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
