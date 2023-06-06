// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'createOrderResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateOrderResponse _$CreateOrderResponseFromJson(Map<String, dynamic> json) {
  return _CreateOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderResponse {
  int get orderId => throw _privateConstructorUsedError;
  OrderCreationStatus get orderCreationStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: Order.fromJson, toJson: orderToJson)
  Order get order => throw _privateConstructorUsedError;
  StripePaymentIntent get stripePaymentIntent =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOrderResponseCopyWith<CreateOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderResponseCopyWith<$Res> {
  factory $CreateOrderResponseCopyWith(
          CreateOrderResponse value, $Res Function(CreateOrderResponse) then) =
      _$CreateOrderResponseCopyWithImpl<$Res, CreateOrderResponse>;
  @useResult
  $Res call(
      {int orderId,
      OrderCreationStatus orderCreationStatus,
      @JsonKey(fromJson: Order.fromJson, toJson: orderToJson) Order order,
      StripePaymentIntent stripePaymentIntent});

  $OrderCopyWith<$Res> get order;
  $StripePaymentIntentCopyWith<$Res> get stripePaymentIntent;
}

/// @nodoc
class _$CreateOrderResponseCopyWithImpl<$Res, $Val extends CreateOrderResponse>
    implements $CreateOrderResponseCopyWith<$Res> {
  _$CreateOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderCreationStatus = null,
    Object? order = null,
    Object? stripePaymentIntent = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderCreationStatus: null == orderCreationStatus
          ? _value.orderCreationStatus
          : orderCreationStatus // ignore: cast_nullable_to_non_nullable
              as OrderCreationStatus,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      stripePaymentIntent: null == stripePaymentIntent
          ? _value.stripePaymentIntent
          : stripePaymentIntent // ignore: cast_nullable_to_non_nullable
              as StripePaymentIntent,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StripePaymentIntentCopyWith<$Res> get stripePaymentIntent {
    return $StripePaymentIntentCopyWith<$Res>(_value.stripePaymentIntent,
        (value) {
      return _then(_value.copyWith(stripePaymentIntent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateOrderResponseCopyWith<$Res>
    implements $CreateOrderResponseCopyWith<$Res> {
  factory _$$_CreateOrderResponseCopyWith(_$_CreateOrderResponse value,
          $Res Function(_$_CreateOrderResponse) then) =
      __$$_CreateOrderResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int orderId,
      OrderCreationStatus orderCreationStatus,
      @JsonKey(fromJson: Order.fromJson, toJson: orderToJson) Order order,
      StripePaymentIntent stripePaymentIntent});

  @override
  $OrderCopyWith<$Res> get order;
  @override
  $StripePaymentIntentCopyWith<$Res> get stripePaymentIntent;
}

/// @nodoc
class __$$_CreateOrderResponseCopyWithImpl<$Res>
    extends _$CreateOrderResponseCopyWithImpl<$Res, _$_CreateOrderResponse>
    implements _$$_CreateOrderResponseCopyWith<$Res> {
  __$$_CreateOrderResponseCopyWithImpl(_$_CreateOrderResponse _value,
      $Res Function(_$_CreateOrderResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderCreationStatus = null,
    Object? order = null,
    Object? stripePaymentIntent = null,
  }) {
    return _then(_$_CreateOrderResponse(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderCreationStatus: null == orderCreationStatus
          ? _value.orderCreationStatus
          : orderCreationStatus // ignore: cast_nullable_to_non_nullable
              as OrderCreationStatus,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      stripePaymentIntent: null == stripePaymentIntent
          ? _value.stripePaymentIntent
          : stripePaymentIntent // ignore: cast_nullable_to_non_nullable
              as StripePaymentIntent,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_CreateOrderResponse extends _CreateOrderResponse {
  _$_CreateOrderResponse(
      {required this.orderId,
      required this.orderCreationStatus,
      @JsonKey(fromJson: Order.fromJson, toJson: orderToJson)
          required this.order,
      required this.stripePaymentIntent})
      : super._();

  factory _$_CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CreateOrderResponseFromJson(json);

  @override
  final int orderId;
  @override
  final OrderCreationStatus orderCreationStatus;
  @override
  @JsonKey(fromJson: Order.fromJson, toJson: orderToJson)
  final Order order;
  @override
  final StripePaymentIntent stripePaymentIntent;

  @override
  String toString() {
    return 'CreateOrderResponse(orderId: $orderId, orderCreationStatus: $orderCreationStatus, order: $order, stripePaymentIntent: $stripePaymentIntent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateOrderResponse &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderCreationStatus, orderCreationStatus) ||
                other.orderCreationStatus == orderCreationStatus) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.stripePaymentIntent, stripePaymentIntent) ||
                other.stripePaymentIntent == stripePaymentIntent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, orderId, orderCreationStatus, order, stripePaymentIntent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateOrderResponseCopyWith<_$_CreateOrderResponse> get copyWith =>
      __$$_CreateOrderResponseCopyWithImpl<_$_CreateOrderResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateOrderResponseToJson(
      this,
    );
  }
}

abstract class _CreateOrderResponse extends CreateOrderResponse {
  factory _CreateOrderResponse(
          {required final int orderId,
          required final OrderCreationStatus orderCreationStatus,
          @JsonKey(fromJson: Order.fromJson, toJson: orderToJson)
              required final Order order,
          required final StripePaymentIntent stripePaymentIntent}) =
      _$_CreateOrderResponse;
  _CreateOrderResponse._() : super._();

  factory _CreateOrderResponse.fromJson(Map<String, dynamic> json) =
      _$_CreateOrderResponse.fromJson;

  @override
  int get orderId;
  @override
  OrderCreationStatus get orderCreationStatus;
  @override
  @JsonKey(fromJson: Order.fromJson, toJson: orderToJson)
  Order get order;
  @override
  StripePaymentIntent get stripePaymentIntent;
  @override
  @JsonKey(ignore: true)
  _$$_CreateOrderResponseCopyWith<_$_CreateOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
