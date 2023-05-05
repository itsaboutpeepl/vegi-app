// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'getOrdersResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetOrdersResponse _$GetOrdersResponseFromJson(Map<String, dynamic> json) {
  return _GetOrdersResponse.fromJson(json);
}

/// @nodoc
mixin _$GetOrdersResponse {
  List<Order> get ongoingOrders => throw _privateConstructorUsedError;
  List<Order> get scheduledOrders => throw _privateConstructorUsedError;
  List<Order> get pastOrders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOrdersResponseCopyWith<GetOrdersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOrdersResponseCopyWith<$Res> {
  factory $GetOrdersResponseCopyWith(
          GetOrdersResponse value, $Res Function(GetOrdersResponse) then) =
      _$GetOrdersResponseCopyWithImpl<$Res, GetOrdersResponse>;
  @useResult
  $Res call(
      {List<Order> ongoingOrders,
      List<Order> scheduledOrders,
      List<Order> pastOrders});
}

/// @nodoc
class _$GetOrdersResponseCopyWithImpl<$Res, $Val extends GetOrdersResponse>
    implements $GetOrdersResponseCopyWith<$Res> {
  _$GetOrdersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ongoingOrders = null,
    Object? scheduledOrders = null,
    Object? pastOrders = null,
  }) {
    return _then(_value.copyWith(
      ongoingOrders: null == ongoingOrders
          ? _value.ongoingOrders
          : ongoingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      scheduledOrders: null == scheduledOrders
          ? _value.scheduledOrders
          : scheduledOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      pastOrders: null == pastOrders
          ? _value.pastOrders
          : pastOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetOrdersResponseCopyWith<$Res>
    implements $GetOrdersResponseCopyWith<$Res> {
  factory _$$_GetOrdersResponseCopyWith(_$_GetOrdersResponse value,
          $Res Function(_$_GetOrdersResponse) then) =
      __$$_GetOrdersResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Order> ongoingOrders,
      List<Order> scheduledOrders,
      List<Order> pastOrders});
}

/// @nodoc
class __$$_GetOrdersResponseCopyWithImpl<$Res>
    extends _$GetOrdersResponseCopyWithImpl<$Res, _$_GetOrdersResponse>
    implements _$$_GetOrdersResponseCopyWith<$Res> {
  __$$_GetOrdersResponseCopyWithImpl(
      _$_GetOrdersResponse _value, $Res Function(_$_GetOrdersResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ongoingOrders = null,
    Object? scheduledOrders = null,
    Object? pastOrders = null,
  }) {
    return _then(_$_GetOrdersResponse(
      ongoingOrders: null == ongoingOrders
          ? _value.ongoingOrders
          : ongoingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      scheduledOrders: null == scheduledOrders
          ? _value.scheduledOrders
          : scheduledOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      pastOrders: null == pastOrders
          ? _value.pastOrders
          : pastOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_GetOrdersResponse extends _GetOrdersResponse {
  _$_GetOrdersResponse(
      {required this.ongoingOrders,
      required this.scheduledOrders,
      required this.pastOrders})
      : super._();

  factory _$_GetOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetOrdersResponseFromJson(json);

  @override
  final List<Order> ongoingOrders;
  @override
  final List<Order> scheduledOrders;
  @override
  final List<Order> pastOrders;

  @override
  String toString() {
    return 'GetOrdersResponse(ongoingOrders: $ongoingOrders, scheduledOrders: $scheduledOrders, pastOrders: $pastOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetOrdersResponse &&
            const DeepCollectionEquality()
                .equals(other.ongoingOrders, ongoingOrders) &&
            const DeepCollectionEquality()
                .equals(other.scheduledOrders, scheduledOrders) &&
            const DeepCollectionEquality()
                .equals(other.pastOrders, pastOrders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ongoingOrders),
      const DeepCollectionEquality().hash(scheduledOrders),
      const DeepCollectionEquality().hash(pastOrders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetOrdersResponseCopyWith<_$_GetOrdersResponse> get copyWith =>
      __$$_GetOrdersResponseCopyWithImpl<_$_GetOrdersResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetOrdersResponseToJson(
      this,
    );
  }
}

abstract class _GetOrdersResponse extends GetOrdersResponse {
  factory _GetOrdersResponse(
      {required final List<Order> ongoingOrders,
      required final List<Order> scheduledOrders,
      required final List<Order> pastOrders}) = _$_GetOrdersResponse;
  _GetOrdersResponse._() : super._();

  factory _GetOrdersResponse.fromJson(Map<String, dynamic> json) =
      _$_GetOrdersResponse.fromJson;

  @override
  List<Order> get ongoingOrders;
  @override
  List<Order> get scheduledOrders;
  @override
  List<Order> get pastOrders;
  @override
  @JsonKey(ignore: true)
  _$$_GetOrdersResponseCopyWith<_$_GetOrdersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
