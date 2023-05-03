// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'past_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PastOrderState _$PastOrderStateFromJson(Map<String, dynamic> json) {
  return _PastOrderState.fromJson(json);
}

/// @nodoc
mixin _$PastOrderState {
  DateTime get lastRefreshTime => throw _privateConstructorUsedError;
  List<Order> get listOfScheduledOrders => throw _privateConstructorUsedError;
  List<Order> get listOfOngoingOrders => throw _privateConstructorUsedError;
  List<Order> get allPastOrders => throw _privateConstructorUsedError;
  List<Transaction> get transactionHistory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PastOrderStateCopyWith<PastOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PastOrderStateCopyWith<$Res> {
  factory $PastOrderStateCopyWith(
          PastOrderState value, $Res Function(PastOrderState) then) =
      _$PastOrderStateCopyWithImpl<$Res, PastOrderState>;
  @useResult
  $Res call(
      {DateTime lastRefreshTime,
      List<Order> listOfScheduledOrders,
      List<Order> listOfOngoingOrders,
      List<Order> allPastOrders,
      List<Transaction> transactionHistory});
}

/// @nodoc
class _$PastOrderStateCopyWithImpl<$Res, $Val extends PastOrderState>
    implements $PastOrderStateCopyWith<$Res> {
  _$PastOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastRefreshTime = null,
    Object? listOfScheduledOrders = null,
    Object? listOfOngoingOrders = null,
    Object? allPastOrders = null,
    Object? transactionHistory = null,
  }) {
    return _then(_value.copyWith(
      lastRefreshTime: null == lastRefreshTime
          ? _value.lastRefreshTime
          : lastRefreshTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      listOfScheduledOrders: null == listOfScheduledOrders
          ? _value.listOfScheduledOrders
          : listOfScheduledOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      listOfOngoingOrders: null == listOfOngoingOrders
          ? _value.listOfOngoingOrders
          : listOfOngoingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      allPastOrders: null == allPastOrders
          ? _value.allPastOrders
          : allPastOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      transactionHistory: null == transactionHistory
          ? _value.transactionHistory
          : transactionHistory // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PastOrderStateCopyWith<$Res>
    implements $PastOrderStateCopyWith<$Res> {
  factory _$$_PastOrderStateCopyWith(
          _$_PastOrderState value, $Res Function(_$_PastOrderState) then) =
      __$$_PastOrderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime lastRefreshTime,
      List<Order> listOfScheduledOrders,
      List<Order> listOfOngoingOrders,
      List<Order> allPastOrders,
      List<Transaction> transactionHistory});
}

/// @nodoc
class __$$_PastOrderStateCopyWithImpl<$Res>
    extends _$PastOrderStateCopyWithImpl<$Res, _$_PastOrderState>
    implements _$$_PastOrderStateCopyWith<$Res> {
  __$$_PastOrderStateCopyWithImpl(
      _$_PastOrderState _value, $Res Function(_$_PastOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastRefreshTime = null,
    Object? listOfScheduledOrders = null,
    Object? listOfOngoingOrders = null,
    Object? allPastOrders = null,
    Object? transactionHistory = null,
  }) {
    return _then(_$_PastOrderState(
      lastRefreshTime: null == lastRefreshTime
          ? _value.lastRefreshTime
          : lastRefreshTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      listOfScheduledOrders: null == listOfScheduledOrders
          ? _value.listOfScheduledOrders
          : listOfScheduledOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      listOfOngoingOrders: null == listOfOngoingOrders
          ? _value.listOfOngoingOrders
          : listOfOngoingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      allPastOrders: null == allPastOrders
          ? _value.allPastOrders
          : allPastOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      transactionHistory: null == transactionHistory
          ? _value.transactionHistory
          : transactionHistory // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_PastOrderState extends _PastOrderState {
  _$_PastOrderState(
      {required this.lastRefreshTime,
      this.listOfScheduledOrders = const [],
      this.listOfOngoingOrders = const [],
      this.allPastOrders = const [],
      this.transactionHistory = const []})
      : super._();

  factory _$_PastOrderState.fromJson(Map<String, dynamic> json) =>
      _$$_PastOrderStateFromJson(json);

  @override
  final DateTime lastRefreshTime;
  @override
  @JsonKey()
  final List<Order> listOfScheduledOrders;
  @override
  @JsonKey()
  final List<Order> listOfOngoingOrders;
  @override
  @JsonKey()
  final List<Order> allPastOrders;
  @override
  @JsonKey()
  final List<Transaction> transactionHistory;

  @override
  String toString() {
    return 'PastOrderState(lastRefreshTime: $lastRefreshTime, listOfScheduledOrders: $listOfScheduledOrders, listOfOngoingOrders: $listOfOngoingOrders, allPastOrders: $allPastOrders, transactionHistory: $transactionHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PastOrderState &&
            (identical(other.lastRefreshTime, lastRefreshTime) ||
                other.lastRefreshTime == lastRefreshTime) &&
            const DeepCollectionEquality()
                .equals(other.listOfScheduledOrders, listOfScheduledOrders) &&
            const DeepCollectionEquality()
                .equals(other.listOfOngoingOrders, listOfOngoingOrders) &&
            const DeepCollectionEquality()
                .equals(other.allPastOrders, allPastOrders) &&
            const DeepCollectionEquality()
                .equals(other.transactionHistory, transactionHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastRefreshTime,
      const DeepCollectionEquality().hash(listOfScheduledOrders),
      const DeepCollectionEquality().hash(listOfOngoingOrders),
      const DeepCollectionEquality().hash(allPastOrders),
      const DeepCollectionEquality().hash(transactionHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PastOrderStateCopyWith<_$_PastOrderState> get copyWith =>
      __$$_PastOrderStateCopyWithImpl<_$_PastOrderState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PastOrderStateToJson(
      this,
    );
  }
}

abstract class _PastOrderState extends PastOrderState {
  factory _PastOrderState(
      {required final DateTime lastRefreshTime,
      final List<Order> listOfScheduledOrders,
      final List<Order> listOfOngoingOrders,
      final List<Order> allPastOrders,
      final List<Transaction> transactionHistory}) = _$_PastOrderState;
  _PastOrderState._() : super._();

  factory _PastOrderState.fromJson(Map<String, dynamic> json) =
      _$_PastOrderState.fromJson;

  @override
  DateTime get lastRefreshTime;
  @override
  List<Order> get listOfScheduledOrders;
  @override
  List<Order> get listOfOngoingOrders;
  @override
  List<Order> get allPastOrders;
  @override
  List<Transaction> get transactionHistory;
  @override
  @JsonKey(ignore: true)
  _$$_PastOrderStateCopyWith<_$_PastOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
