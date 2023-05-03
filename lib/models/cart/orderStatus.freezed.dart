// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'orderStatus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) {
  return _OrderStatus.fromJson(json);
}

/// @nodoc
mixin _$OrderStatus {
  RestaurantAcceptanceStatus get restaurantAcceptanceStatus =>
      throw _privateConstructorUsedError;
  OrderAcceptanceStatus get orderAcceptanceStatus =>
      throw _privateConstructorUsedError;
  OrderPaidStatus get paymentStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusCopyWith<OrderStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusCopyWith<$Res> {
  factory $OrderStatusCopyWith(
          OrderStatus value, $Res Function(OrderStatus) then) =
      _$OrderStatusCopyWithImpl<$Res, OrderStatus>;
  @useResult
  $Res call(
      {RestaurantAcceptanceStatus restaurantAcceptanceStatus,
      OrderAcceptanceStatus orderAcceptanceStatus,
      OrderPaidStatus paymentStatus});
}

/// @nodoc
class _$OrderStatusCopyWithImpl<$Res, $Val extends OrderStatus>
    implements $OrderStatusCopyWith<$Res> {
  _$OrderStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantAcceptanceStatus = null,
    Object? orderAcceptanceStatus = null,
    Object? paymentStatus = null,
  }) {
    return _then(_value.copyWith(
      restaurantAcceptanceStatus: null == restaurantAcceptanceStatus
          ? _value.restaurantAcceptanceStatus
          : restaurantAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as RestaurantAcceptanceStatus,
      orderAcceptanceStatus: null == orderAcceptanceStatus
          ? _value.orderAcceptanceStatus
          : orderAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as OrderAcceptanceStatus,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as OrderPaidStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderStatusCopyWith<$Res>
    implements $OrderStatusCopyWith<$Res> {
  factory _$$_OrderStatusCopyWith(
          _$_OrderStatus value, $Res Function(_$_OrderStatus) then) =
      __$$_OrderStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RestaurantAcceptanceStatus restaurantAcceptanceStatus,
      OrderAcceptanceStatus orderAcceptanceStatus,
      OrderPaidStatus paymentStatus});
}

/// @nodoc
class __$$_OrderStatusCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$_OrderStatus>
    implements _$$_OrderStatusCopyWith<$Res> {
  __$$_OrderStatusCopyWithImpl(
      _$_OrderStatus _value, $Res Function(_$_OrderStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantAcceptanceStatus = null,
    Object? orderAcceptanceStatus = null,
    Object? paymentStatus = null,
  }) {
    return _then(_$_OrderStatus(
      restaurantAcceptanceStatus: null == restaurantAcceptanceStatus
          ? _value.restaurantAcceptanceStatus
          : restaurantAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as RestaurantAcceptanceStatus,
      orderAcceptanceStatus: null == orderAcceptanceStatus
          ? _value.orderAcceptanceStatus
          : orderAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as OrderAcceptanceStatus,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as OrderPaidStatus,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_OrderStatus extends _OrderStatus {
  _$_OrderStatus(
      {required this.restaurantAcceptanceStatus,
      required this.orderAcceptanceStatus,
      required this.paymentStatus})
      : super._();

  factory _$_OrderStatus.fromJson(Map<String, dynamic> json) =>
      _$$_OrderStatusFromJson(json);

  @override
  final RestaurantAcceptanceStatus restaurantAcceptanceStatus;
  @override
  final OrderAcceptanceStatus orderAcceptanceStatus;
  @override
  final OrderPaidStatus paymentStatus;

  @override
  String toString() {
    return 'OrderStatus(restaurantAcceptanceStatus: $restaurantAcceptanceStatus, orderAcceptanceStatus: $orderAcceptanceStatus, paymentStatus: $paymentStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderStatus &&
            (identical(other.restaurantAcceptanceStatus,
                    restaurantAcceptanceStatus) ||
                other.restaurantAcceptanceStatus ==
                    restaurantAcceptanceStatus) &&
            (identical(other.orderAcceptanceStatus, orderAcceptanceStatus) ||
                other.orderAcceptanceStatus == orderAcceptanceStatus) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, restaurantAcceptanceStatus,
      orderAcceptanceStatus, paymentStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderStatusCopyWith<_$_OrderStatus> get copyWith =>
      __$$_OrderStatusCopyWithImpl<_$_OrderStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderStatusToJson(
      this,
    );
  }
}

abstract class _OrderStatus extends OrderStatus {
  factory _OrderStatus(
      {required final RestaurantAcceptanceStatus restaurantAcceptanceStatus,
      required final OrderAcceptanceStatus orderAcceptanceStatus,
      required final OrderPaidStatus paymentStatus}) = _$_OrderStatus;
  _OrderStatus._() : super._();

  factory _OrderStatus.fromJson(Map<String, dynamic> json) =
      _$_OrderStatus.fromJson;

  @override
  RestaurantAcceptanceStatus get restaurantAcceptanceStatus;
  @override
  OrderAcceptanceStatus get orderAcceptanceStatus;
  @override
  OrderPaidStatus get paymentStatus;
  @override
  @JsonKey(ignore: true)
  _$$_OrderStatusCopyWith<_$_OrderStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
