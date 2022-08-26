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
  List<OrderDetails> get listOfScheduledOrders =>
      throw _privateConstructorUsedError;
  List<OrderDetails> get listOfOngoingOrders =>
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
      _$PastOrderStateCopyWithImpl<$Res>;
  $Res call(
      {List<OrderDetails> listOfScheduledOrders,
      List<OrderDetails> listOfOngoingOrders});
}

/// @nodoc
class _$PastOrderStateCopyWithImpl<$Res>
    implements $PastOrderStateCopyWith<$Res> {
  _$PastOrderStateCopyWithImpl(this._value, this._then);

  final PastOrderState _value;
  // ignore: unused_field
  final $Res Function(PastOrderState) _then;

  @override
  $Res call({
    Object? listOfScheduledOrders = freezed,
    Object? listOfOngoingOrders = freezed,
  }) {
    return _then(_value.copyWith(
      listOfScheduledOrders: listOfScheduledOrders == freezed
          ? _value.listOfScheduledOrders
          : listOfScheduledOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderDetails>,
      listOfOngoingOrders: listOfOngoingOrders == freezed
          ? _value.listOfOngoingOrders
          : listOfOngoingOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderDetails>,
    ));
  }
}

/// @nodoc
abstract class _$$_PastOrderStateCopyWith<$Res>
    implements $PastOrderStateCopyWith<$Res> {
  factory _$$_PastOrderStateCopyWith(
          _$_PastOrderState value, $Res Function(_$_PastOrderState) then) =
      __$$_PastOrderStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<OrderDetails> listOfScheduledOrders,
      List<OrderDetails> listOfOngoingOrders});
}

/// @nodoc
class __$$_PastOrderStateCopyWithImpl<$Res>
    extends _$PastOrderStateCopyWithImpl<$Res>
    implements _$$_PastOrderStateCopyWith<$Res> {
  __$$_PastOrderStateCopyWithImpl(
      _$_PastOrderState _value, $Res Function(_$_PastOrderState) _then)
      : super(_value, (v) => _then(v as _$_PastOrderState));

  @override
  _$_PastOrderState get _value => super._value as _$_PastOrderState;

  @override
  $Res call({
    Object? listOfScheduledOrders = freezed,
    Object? listOfOngoingOrders = freezed,
  }) {
    return _then(_$_PastOrderState(
      listOfScheduledOrders: listOfScheduledOrders == freezed
          ? _value.listOfScheduledOrders
          : listOfScheduledOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderDetails>,
      listOfOngoingOrders: listOfOngoingOrders == freezed
          ? _value.listOfOngoingOrders
          : listOfOngoingOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderDetails>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_PastOrderState extends _PastOrderState {
  _$_PastOrderState(
      {this.listOfScheduledOrders = const [],
      this.listOfOngoingOrders = const []})
      : super._();

  factory _$_PastOrderState.fromJson(Map<String, dynamic> json) =>
      _$$_PastOrderStateFromJson(json);

  @override
  @JsonKey()
  final List<OrderDetails> listOfScheduledOrders;
  @override
  @JsonKey()
  final List<OrderDetails> listOfOngoingOrders;

  @override
  String toString() {
    return 'PastOrderState(listOfScheduledOrders: $listOfScheduledOrders, listOfOngoingOrders: $listOfOngoingOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PastOrderState &&
            const DeepCollectionEquality()
                .equals(other.listOfScheduledOrders, listOfScheduledOrders) &&
            const DeepCollectionEquality()
                .equals(other.listOfOngoingOrders, listOfOngoingOrders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(listOfScheduledOrders),
      const DeepCollectionEquality().hash(listOfOngoingOrders));

  @JsonKey(ignore: true)
  @override
  _$$_PastOrderStateCopyWith<_$_PastOrderState> get copyWith =>
      __$$_PastOrderStateCopyWithImpl<_$_PastOrderState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PastOrderStateToJson(this);
  }
}

abstract class _PastOrderState extends PastOrderState {
  factory _PastOrderState(
      {final List<OrderDetails> listOfScheduledOrders,
      final List<OrderDetails> listOfOngoingOrders}) = _$_PastOrderState;
  _PastOrderState._() : super._();

  factory _PastOrderState.fromJson(Map<String, dynamic> json) =
      _$_PastOrderState.fromJson;

  @override
  List<OrderDetails> get listOfScheduledOrders =>
      throw _privateConstructorUsedError;
  @override
  List<OrderDetails> get listOfOngoingOrders =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PastOrderStateCopyWith<_$_PastOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
