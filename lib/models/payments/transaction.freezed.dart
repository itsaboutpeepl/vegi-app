// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  num get amount => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  GreenBeanToken get rewards => throw _privateConstructorUsedError;
  PaymentStatus get paymentStatus => throw _privateConstructorUsedError;
  DateTime get paymentCreatedTimeStamp => throw _privateConstructorUsedError;
  DateTime get paymentCompletedTimeStamp => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get payerId => throw _privateConstructorUsedError;
  PaymentNetworkType get paymentNetworkType =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {num amount,
      Currency currency,
      GreenBeanToken rewards,
      PaymentStatus paymentStatus,
      DateTime paymentCreatedTimeStamp,
      DateTime paymentCompletedTimeStamp,
      String receiverId,
      String payerId,
      PaymentNetworkType paymentNetworkType});

  $GreenBeanTokenCopyWith<$Res> get rewards;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? rewards = null,
    Object? paymentStatus = null,
    Object? paymentCreatedTimeStamp = null,
    Object? paymentCompletedTimeStamp = null,
    Object? receiverId = null,
    Object? payerId = null,
    Object? paymentNetworkType = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      rewards: null == rewards
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as GreenBeanToken,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentCreatedTimeStamp: null == paymentCreatedTimeStamp
          ? _value.paymentCreatedTimeStamp
          : paymentCreatedTimeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentCompletedTimeStamp: null == paymentCompletedTimeStamp
          ? _value.paymentCompletedTimeStamp
          : paymentCompletedTimeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      payerId: null == payerId
          ? _value.payerId
          : payerId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNetworkType: null == paymentNetworkType
          ? _value.paymentNetworkType
          : paymentNetworkType // ignore: cast_nullable_to_non_nullable
              as PaymentNetworkType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GreenBeanTokenCopyWith<$Res> get rewards {
    return $GreenBeanTokenCopyWith<$Res>(_value.rewards, (value) {
      return _then(_value.copyWith(rewards: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num amount,
      Currency currency,
      GreenBeanToken rewards,
      PaymentStatus paymentStatus,
      DateTime paymentCreatedTimeStamp,
      DateTime paymentCompletedTimeStamp,
      String receiverId,
      String payerId,
      PaymentNetworkType paymentNetworkType});

  @override
  $GreenBeanTokenCopyWith<$Res> get rewards;
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$_Transaction>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? rewards = null,
    Object? paymentStatus = null,
    Object? paymentCreatedTimeStamp = null,
    Object? paymentCompletedTimeStamp = null,
    Object? receiverId = null,
    Object? payerId = null,
    Object? paymentNetworkType = null,
  }) {
    return _then(_$_Transaction(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      rewards: null == rewards
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as GreenBeanToken,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentCreatedTimeStamp: null == paymentCreatedTimeStamp
          ? _value.paymentCreatedTimeStamp
          : paymentCreatedTimeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentCompletedTimeStamp: null == paymentCompletedTimeStamp
          ? _value.paymentCompletedTimeStamp
          : paymentCompletedTimeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      payerId: null == payerId
          ? _value.payerId
          : payerId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNetworkType: null == paymentNetworkType
          ? _value.paymentNetworkType
          : paymentNetworkType // ignore: cast_nullable_to_non_nullable
              as PaymentNetworkType,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Transaction extends _Transaction {
  _$_Transaction(
      {required this.amount,
      required this.currency,
      required this.rewards,
      required this.paymentStatus,
      required this.paymentCreatedTimeStamp,
      required this.paymentCompletedTimeStamp,
      required this.receiverId,
      required this.payerId,
      required this.paymentNetworkType})
      : super._();

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  final num amount;
  @override
  final Currency currency;
  @override
  final GreenBeanToken rewards;
  @override
  final PaymentStatus paymentStatus;
  @override
  final DateTime paymentCreatedTimeStamp;
  @override
  final DateTime paymentCompletedTimeStamp;
  @override
  final String receiverId;
  @override
  final String payerId;
  @override
  final PaymentNetworkType paymentNetworkType;

  @override
  String toString() {
    return 'Transaction(amount: $amount, currency: $currency, rewards: $rewards, paymentStatus: $paymentStatus, paymentCreatedTimeStamp: $paymentCreatedTimeStamp, paymentCompletedTimeStamp: $paymentCompletedTimeStamp, receiverId: $receiverId, payerId: $payerId, paymentNetworkType: $paymentNetworkType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.rewards, rewards) || other.rewards == rewards) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(
                    other.paymentCreatedTimeStamp, paymentCreatedTimeStamp) ||
                other.paymentCreatedTimeStamp == paymentCreatedTimeStamp) &&
            (identical(other.paymentCompletedTimeStamp,
                    paymentCompletedTimeStamp) ||
                other.paymentCompletedTimeStamp == paymentCompletedTimeStamp) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.payerId, payerId) || other.payerId == payerId) &&
            (identical(other.paymentNetworkType, paymentNetworkType) ||
                other.paymentNetworkType == paymentNetworkType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      currency,
      rewards,
      paymentStatus,
      paymentCreatedTimeStamp,
      paymentCompletedTimeStamp,
      receiverId,
      payerId,
      paymentNetworkType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(
      this,
    );
  }
}

abstract class _Transaction extends Transaction {
  factory _Transaction(
      {required final num amount,
      required final Currency currency,
      required final GreenBeanToken rewards,
      required final PaymentStatus paymentStatus,
      required final DateTime paymentCreatedTimeStamp,
      required final DateTime paymentCompletedTimeStamp,
      required final String receiverId,
      required final String payerId,
      required final PaymentNetworkType paymentNetworkType}) = _$_Transaction;
  _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  num get amount;
  @override
  Currency get currency;
  @override
  GreenBeanToken get rewards;
  @override
  PaymentStatus get paymentStatus;
  @override
  DateTime get paymentCreatedTimeStamp;
  @override
  DateTime get paymentCompletedTimeStamp;
  @override
  String get receiverId;
  @override
  String get payerId;
  @override
  PaymentNetworkType get paymentNetworkType;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
