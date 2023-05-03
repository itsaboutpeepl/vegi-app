// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) {
  return _TransactionItem.fromJson(json);
}

/// @nodoc
mixin _$TransactionItem {
  @JsonKey(fromJson: toTS)
  DateTime get timestamp => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  @JsonKey(fromJson: objectIdFromJson)
  int get receiver => throw _privateConstructorUsedError;
  @JsonKey(fromJson: objectIdFromJson)
  int get payer => throw _privateConstructorUsedError;
  @JsonKey(fromJson: objectIdFromJson)
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionItemCopyWith<TransactionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionItemCopyWith<$Res> {
  factory $TransactionItemCopyWith(
          TransactionItem value, $Res Function(TransactionItem) then) =
      _$TransactionItemCopyWithImpl<$Res, TransactionItem>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: toTS) DateTime timestamp,
      num amount,
      Currency currency,
      @JsonKey(fromJson: objectIdFromJson) int receiver,
      @JsonKey(fromJson: objectIdFromJson) int payer,
      @JsonKey(fromJson: objectIdFromJson) int order});
}

/// @nodoc
class _$TransactionItemCopyWithImpl<$Res, $Val extends TransactionItem>
    implements $TransactionItemCopyWith<$Res> {
  _$TransactionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? amount = null,
    Object? currency = null,
    Object? receiver = null,
    Object? payer = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as int,
      payer: null == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionItemCopyWith<$Res>
    implements $TransactionItemCopyWith<$Res> {
  factory _$$_TransactionItemCopyWith(
          _$_TransactionItem value, $Res Function(_$_TransactionItem) then) =
      __$$_TransactionItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: toTS) DateTime timestamp,
      num amount,
      Currency currency,
      @JsonKey(fromJson: objectIdFromJson) int receiver,
      @JsonKey(fromJson: objectIdFromJson) int payer,
      @JsonKey(fromJson: objectIdFromJson) int order});
}

/// @nodoc
class __$$_TransactionItemCopyWithImpl<$Res>
    extends _$TransactionItemCopyWithImpl<$Res, _$_TransactionItem>
    implements _$$_TransactionItemCopyWith<$Res> {
  __$$_TransactionItemCopyWithImpl(
      _$_TransactionItem _value, $Res Function(_$_TransactionItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? amount = null,
    Object? currency = null,
    Object? receiver = null,
    Object? payer = null,
    Object? order = null,
  }) {
    return _then(_$_TransactionItem(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as int,
      payer: null == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_TransactionItem extends _TransactionItem {
  _$_TransactionItem(
      {@JsonKey(fromJson: toTS) required this.timestamp,
      required this.amount,
      required this.currency,
      @JsonKey(fromJson: objectIdFromJson) required this.receiver,
      @JsonKey(fromJson: objectIdFromJson) required this.payer,
      @JsonKey(fromJson: objectIdFromJson) required this.order})
      : super._();

  factory _$_TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionItemFromJson(json);

  @override
  @JsonKey(fromJson: toTS)
  final DateTime timestamp;
  @override
  final num amount;
  @override
  final Currency currency;
  @override
  @JsonKey(fromJson: objectIdFromJson)
  final int receiver;
  @override
  @JsonKey(fromJson: objectIdFromJson)
  final int payer;
  @override
  @JsonKey(fromJson: objectIdFromJson)
  final int order;

  @override
  String toString() {
    return 'TransactionItem(timestamp: $timestamp, amount: $amount, currency: $currency, receiver: $receiver, payer: $payer, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionItem &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.payer, payer) || other.payer == payer) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, amount, currency, receiver, payer, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionItemCopyWith<_$_TransactionItem> get copyWith =>
      __$$_TransactionItemCopyWithImpl<_$_TransactionItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionItemToJson(
      this,
    );
  }
}

abstract class _TransactionItem extends TransactionItem {
  factory _TransactionItem(
          {@JsonKey(fromJson: toTS) required final DateTime timestamp,
          required final num amount,
          required final Currency currency,
          @JsonKey(fromJson: objectIdFromJson) required final int receiver,
          @JsonKey(fromJson: objectIdFromJson) required final int payer,
          @JsonKey(fromJson: objectIdFromJson) required final int order}) =
      _$_TransactionItem;
  _TransactionItem._() : super._();

  factory _TransactionItem.fromJson(Map<String, dynamic> json) =
      _$_TransactionItem.fromJson;

  @override
  @JsonKey(fromJson: toTS)
  DateTime get timestamp;
  @override
  num get amount;
  @override
  Currency get currency;
  @override
  @JsonKey(fromJson: objectIdFromJson)
  int get receiver;
  @override
  @JsonKey(fromJson: objectIdFromJson)
  int get payer;
  @override
  @JsonKey(fromJson: objectIdFromJson)
  int get order;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionItemCopyWith<_$_TransactionItem> get copyWith =>
      throw _privateConstructorUsedError;
}
