// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fullfilmentMethods.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FullfilmentMethods _$FullfilmentMethodsFromJson(Map<String, dynamic> json) {
  return _FullfilmentMethods.fromJson(json);
}

/// @nodoc
mixin _$FullfilmentMethods {
  Map<String, dynamic>? get collectionMethod =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get deliveryMethod =>
      throw _privateConstructorUsedError;
  List<Map<String, String>> get collectionSlots =>
      throw _privateConstructorUsedError;
  List<Map<String, String>> get deliverySlots =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FullfilmentMethodsCopyWith<FullfilmentMethods> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullfilmentMethodsCopyWith<$Res> {
  factory $FullfilmentMethodsCopyWith(
          FullfilmentMethods value, $Res Function(FullfilmentMethods) then) =
      _$FullfilmentMethodsCopyWithImpl<$Res, FullfilmentMethods>;
  @useResult
  $Res call(
      {Map<String, dynamic>? collectionMethod,
      Map<String, dynamic>? deliveryMethod,
      List<Map<String, String>> collectionSlots,
      List<Map<String, String>> deliverySlots});
}

/// @nodoc
class _$FullfilmentMethodsCopyWithImpl<$Res, $Val extends FullfilmentMethods>
    implements $FullfilmentMethodsCopyWith<$Res> {
  _$FullfilmentMethodsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionMethod = freezed,
    Object? deliveryMethod = freezed,
    Object? collectionSlots = null,
    Object? deliverySlots = null,
  }) {
    return _then(_value.copyWith(
      collectionMethod: freezed == collectionMethod
          ? _value.collectionMethod
          : collectionMethod // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      deliveryMethod: freezed == deliveryMethod
          ? _value.deliveryMethod
          : deliveryMethod // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      collectionSlots: null == collectionSlots
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      deliverySlots: null == deliverySlots
          ? _value.deliverySlots
          : deliverySlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FullfilmentMethodsCopyWith<$Res>
    implements $FullfilmentMethodsCopyWith<$Res> {
  factory _$$_FullfilmentMethodsCopyWith(_$_FullfilmentMethods value,
          $Res Function(_$_FullfilmentMethods) then) =
      __$$_FullfilmentMethodsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic>? collectionMethod,
      Map<String, dynamic>? deliveryMethod,
      List<Map<String, String>> collectionSlots,
      List<Map<String, String>> deliverySlots});
}

/// @nodoc
class __$$_FullfilmentMethodsCopyWithImpl<$Res>
    extends _$FullfilmentMethodsCopyWithImpl<$Res, _$_FullfilmentMethods>
    implements _$$_FullfilmentMethodsCopyWith<$Res> {
  __$$_FullfilmentMethodsCopyWithImpl(
      _$_FullfilmentMethods _value, $Res Function(_$_FullfilmentMethods) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionMethod = freezed,
    Object? deliveryMethod = freezed,
    Object? collectionSlots = null,
    Object? deliverySlots = null,
  }) {
    return _then(_$_FullfilmentMethods(
      collectionMethod: freezed == collectionMethod
          ? _value.collectionMethod
          : collectionMethod // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      deliveryMethod: freezed == deliveryMethod
          ? _value.deliveryMethod
          : deliveryMethod // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      collectionSlots: null == collectionSlots
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      deliverySlots: null == deliverySlots
          ? _value.deliverySlots
          : deliverySlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_FullfilmentMethods extends _FullfilmentMethods {
  _$_FullfilmentMethods(
      {required this.collectionMethod,
      required this.deliveryMethod,
      required this.collectionSlots,
      required this.deliverySlots})
      : super._();

  factory _$_FullfilmentMethods.fromJson(Map<String, dynamic> json) =>
      _$$_FullfilmentMethodsFromJson(json);

  @override
  final Map<String, dynamic>? collectionMethod;
  @override
  final Map<String, dynamic>? deliveryMethod;
  @override
  final List<Map<String, String>> collectionSlots;
  @override
  final List<Map<String, String>> deliverySlots;

  @override
  String toString() {
    return 'FullfilmentMethods(collectionMethod: $collectionMethod, deliveryMethod: $deliveryMethod, collectionSlots: $collectionSlots, deliverySlots: $deliverySlots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullfilmentMethods &&
            const DeepCollectionEquality()
                .equals(other.collectionMethod, collectionMethod) &&
            const DeepCollectionEquality()
                .equals(other.deliveryMethod, deliveryMethod) &&
            const DeepCollectionEquality()
                .equals(other.collectionSlots, collectionSlots) &&
            const DeepCollectionEquality()
                .equals(other.deliverySlots, deliverySlots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(collectionMethod),
      const DeepCollectionEquality().hash(deliveryMethod),
      const DeepCollectionEquality().hash(collectionSlots),
      const DeepCollectionEquality().hash(deliverySlots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullfilmentMethodsCopyWith<_$_FullfilmentMethods> get copyWith =>
      __$$_FullfilmentMethodsCopyWithImpl<_$_FullfilmentMethods>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FullfilmentMethodsToJson(
      this,
    );
  }
}

abstract class _FullfilmentMethods extends FullfilmentMethods {
  factory _FullfilmentMethods(
          {required final Map<String, dynamic>? collectionMethod,
          required final Map<String, dynamic>? deliveryMethod,
          required final List<Map<String, String>> collectionSlots,
          required final List<Map<String, String>> deliverySlots}) =
      _$_FullfilmentMethods;
  _FullfilmentMethods._() : super._();

  factory _FullfilmentMethods.fromJson(Map<String, dynamic> json) =
      _$_FullfilmentMethods.fromJson;

  @override
  Map<String, dynamic>? get collectionMethod;
  @override
  Map<String, dynamic>? get deliveryMethod;
  @override
  List<Map<String, String>> get collectionSlots;
  @override
  List<Map<String, String>> get deliverySlots;
  @override
  @JsonKey(ignore: true)
  _$$_FullfilmentMethodsCopyWith<_$_FullfilmentMethods> get copyWith =>
      throw _privateConstructorUsedError;
}
