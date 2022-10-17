// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'swap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TradeInfo _$TradeInfoFromJson(Map<String, dynamic> json) {
  return _TradeInfo.fromJson(json);
}

/// @nodoc
mixin _$TradeInfo {
  String get inputAmount => throw _privateConstructorUsedError;
  String get outputAmount => throw _privateConstructorUsedError;
  List<String> get route => throw _privateConstructorUsedError;
  String get inputToken => throw _privateConstructorUsedError;
  String get outputToken => throw _privateConstructorUsedError;
  String get executionPrice => throw _privateConstructorUsedError;
  String get nextMidPrice => throw _privateConstructorUsedError;
  String get priceImpact => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TradeInfoCopyWith<TradeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeInfoCopyWith<$Res> {
  factory $TradeInfoCopyWith(TradeInfo value, $Res Function(TradeInfo) then) =
      _$TradeInfoCopyWithImpl<$Res, TradeInfo>;
  @useResult
  $Res call(
      {String inputAmount,
      String outputAmount,
      List<String> route,
      String inputToken,
      String outputToken,
      String executionPrice,
      String nextMidPrice,
      String priceImpact});
}

/// @nodoc
class _$TradeInfoCopyWithImpl<$Res, $Val extends TradeInfo>
    implements $TradeInfoCopyWith<$Res> {
  _$TradeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputAmount = null,
    Object? outputAmount = null,
    Object? route = null,
    Object? inputToken = null,
    Object? outputToken = null,
    Object? executionPrice = null,
    Object? nextMidPrice = null,
    Object? priceImpact = null,
  }) {
    return _then(_value.copyWith(
      inputAmount: null == inputAmount
          ? _value.inputAmount
          : inputAmount // ignore: cast_nullable_to_non_nullable
              as String,
      outputAmount: null == outputAmount
          ? _value.outputAmount
          : outputAmount // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inputToken: null == inputToken
          ? _value.inputToken
          : inputToken // ignore: cast_nullable_to_non_nullable
              as String,
      outputToken: null == outputToken
          ? _value.outputToken
          : outputToken // ignore: cast_nullable_to_non_nullable
              as String,
      executionPrice: null == executionPrice
          ? _value.executionPrice
          : executionPrice // ignore: cast_nullable_to_non_nullable
              as String,
      nextMidPrice: null == nextMidPrice
          ? _value.nextMidPrice
          : nextMidPrice // ignore: cast_nullable_to_non_nullable
              as String,
      priceImpact: null == priceImpact
          ? _value.priceImpact
          : priceImpact // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TradeInfoCopyWith<$Res> implements $TradeInfoCopyWith<$Res> {
  factory _$$_TradeInfoCopyWith(
          _$_TradeInfo value, $Res Function(_$_TradeInfo) then) =
      __$$_TradeInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String inputAmount,
      String outputAmount,
      List<String> route,
      String inputToken,
      String outputToken,
      String executionPrice,
      String nextMidPrice,
      String priceImpact});
}

/// @nodoc
class __$$_TradeInfoCopyWithImpl<$Res>
    extends _$TradeInfoCopyWithImpl<$Res, _$_TradeInfo>
    implements _$$_TradeInfoCopyWith<$Res> {
  __$$_TradeInfoCopyWithImpl(
      _$_TradeInfo _value, $Res Function(_$_TradeInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputAmount = null,
    Object? outputAmount = null,
    Object? route = null,
    Object? inputToken = null,
    Object? outputToken = null,
    Object? executionPrice = null,
    Object? nextMidPrice = null,
    Object? priceImpact = null,
  }) {
    return _then(_$_TradeInfo(
      inputAmount: null == inputAmount
          ? _value.inputAmount
          : inputAmount // ignore: cast_nullable_to_non_nullable
              as String,
      outputAmount: null == outputAmount
          ? _value.outputAmount
          : outputAmount // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inputToken: null == inputToken
          ? _value.inputToken
          : inputToken // ignore: cast_nullable_to_non_nullable
              as String,
      outputToken: null == outputToken
          ? _value.outputToken
          : outputToken // ignore: cast_nullable_to_non_nullable
              as String,
      executionPrice: null == executionPrice
          ? _value.executionPrice
          : executionPrice // ignore: cast_nullable_to_non_nullable
              as String,
      nextMidPrice: null == nextMidPrice
          ? _value.nextMidPrice
          : nextMidPrice // ignore: cast_nullable_to_non_nullable
              as String,
      priceImpact: null == priceImpact
          ? _value.priceImpact
          : priceImpact // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_TradeInfo implements _TradeInfo {
  _$_TradeInfo(
      {required this.inputAmount,
      required this.outputAmount,
      required this.route,
      required this.inputToken,
      required this.outputToken,
      required this.executionPrice,
      required this.nextMidPrice,
      required this.priceImpact});

  factory _$_TradeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_TradeInfoFromJson(json);

  @override
  final String inputAmount;
  @override
  final String outputAmount;
  @override
  final List<String> route;
  @override
  final String inputToken;
  @override
  final String outputToken;
  @override
  final String executionPrice;
  @override
  final String nextMidPrice;
  @override
  final String priceImpact;

  @override
  String toString() {
    return 'TradeInfo(inputAmount: $inputAmount, outputAmount: $outputAmount, route: $route, inputToken: $inputToken, outputToken: $outputToken, executionPrice: $executionPrice, nextMidPrice: $nextMidPrice, priceImpact: $priceImpact)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TradeInfo &&
            (identical(other.inputAmount, inputAmount) ||
                other.inputAmount == inputAmount) &&
            (identical(other.outputAmount, outputAmount) ||
                other.outputAmount == outputAmount) &&
            const DeepCollectionEquality().equals(other.route, route) &&
            (identical(other.inputToken, inputToken) ||
                other.inputToken == inputToken) &&
            (identical(other.outputToken, outputToken) ||
                other.outputToken == outputToken) &&
            (identical(other.executionPrice, executionPrice) ||
                other.executionPrice == executionPrice) &&
            (identical(other.nextMidPrice, nextMidPrice) ||
                other.nextMidPrice == nextMidPrice) &&
            (identical(other.priceImpact, priceImpact) ||
                other.priceImpact == priceImpact));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      inputAmount,
      outputAmount,
      const DeepCollectionEquality().hash(route),
      inputToken,
      outputToken,
      executionPrice,
      nextMidPrice,
      priceImpact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TradeInfoCopyWith<_$_TradeInfo> get copyWith =>
      __$$_TradeInfoCopyWithImpl<_$_TradeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TradeInfoToJson(
      this,
    );
  }
}

abstract class _TradeInfo implements TradeInfo {
  factory _TradeInfo(
      {required final String inputAmount,
      required final String outputAmount,
      required final List<String> route,
      required final String inputToken,
      required final String outputToken,
      required final String executionPrice,
      required final String nextMidPrice,
      required final String priceImpact}) = _$_TradeInfo;

  factory _TradeInfo.fromJson(Map<String, dynamic> json) =
      _$_TradeInfo.fromJson;

  @override
  String get inputAmount;
  @override
  String get outputAmount;
  @override
  List<String> get route;
  @override
  String get inputToken;
  @override
  String get outputToken;
  @override
  String get executionPrice;
  @override
  String get nextMidPrice;
  @override
  String get priceImpact;
  @override
  @JsonKey(ignore: true)
  _$$_TradeInfoCopyWith<_$_TradeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapCallParameters _$SwapCallParametersFromJson(Map<String, dynamic> json) {
  return _SwapCallParameters.fromJson(json);
}

/// @nodoc
mixin _$SwapCallParameters {
  String get methodName => throw _privateConstructorUsedError;
  List<dynamic> get args => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  Map<String, dynamic> get rawTxn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SwapCallParametersCopyWith<SwapCallParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapCallParametersCopyWith<$Res> {
  factory $SwapCallParametersCopyWith(
          SwapCallParameters value, $Res Function(SwapCallParameters) then) =
      _$SwapCallParametersCopyWithImpl<$Res, SwapCallParameters>;
  @useResult
  $Res call(
      {String methodName,
      List<dynamic> args,
      String value,
      Map<String, dynamic> rawTxn});
}

/// @nodoc
class _$SwapCallParametersCopyWithImpl<$Res, $Val extends SwapCallParameters>
    implements $SwapCallParametersCopyWith<$Res> {
  _$SwapCallParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodName = null,
    Object? args = null,
    Object? value = null,
    Object? rawTxn = null,
  }) {
    return _then(_value.copyWith(
      methodName: null == methodName
          ? _value.methodName
          : methodName // ignore: cast_nullable_to_non_nullable
              as String,
      args: null == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      rawTxn: null == rawTxn
          ? _value.rawTxn
          : rawTxn // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SwapCallParametersCopyWith<$Res>
    implements $SwapCallParametersCopyWith<$Res> {
  factory _$$_SwapCallParametersCopyWith(_$_SwapCallParameters value,
          $Res Function(_$_SwapCallParameters) then) =
      __$$_SwapCallParametersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String methodName,
      List<dynamic> args,
      String value,
      Map<String, dynamic> rawTxn});
}

/// @nodoc
class __$$_SwapCallParametersCopyWithImpl<$Res>
    extends _$SwapCallParametersCopyWithImpl<$Res, _$_SwapCallParameters>
    implements _$$_SwapCallParametersCopyWith<$Res> {
  __$$_SwapCallParametersCopyWithImpl(
      _$_SwapCallParameters _value, $Res Function(_$_SwapCallParameters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodName = null,
    Object? args = null,
    Object? value = null,
    Object? rawTxn = null,
  }) {
    return _then(_$_SwapCallParameters(
      methodName: null == methodName
          ? _value.methodName
          : methodName // ignore: cast_nullable_to_non_nullable
              as String,
      args: null == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      rawTxn: null == rawTxn
          ? _value.rawTxn
          : rawTxn // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SwapCallParameters implements _SwapCallParameters {
  _$_SwapCallParameters(
      {required this.methodName,
      required this.args,
      required this.value,
      required this.rawTxn});

  factory _$_SwapCallParameters.fromJson(Map<String, dynamic> json) =>
      _$$_SwapCallParametersFromJson(json);

  @override
  final String methodName;
  @override
  final List<dynamic> args;
  @override
  final String value;
  @override
  final Map<String, dynamic> rawTxn;

  @override
  String toString() {
    return 'SwapCallParameters(methodName: $methodName, args: $args, value: $value, rawTxn: $rawTxn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SwapCallParameters &&
            (identical(other.methodName, methodName) ||
                other.methodName == methodName) &&
            const DeepCollectionEquality().equals(other.args, args) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality().equals(other.rawTxn, rawTxn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      methodName,
      const DeepCollectionEquality().hash(args),
      value,
      const DeepCollectionEquality().hash(rawTxn));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SwapCallParametersCopyWith<_$_SwapCallParameters> get copyWith =>
      __$$_SwapCallParametersCopyWithImpl<_$_SwapCallParameters>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SwapCallParametersToJson(
      this,
    );
  }
}

abstract class _SwapCallParameters implements SwapCallParameters {
  factory _SwapCallParameters(
      {required final String methodName,
      required final List<dynamic> args,
      required final String value,
      required final Map<String, dynamic> rawTxn}) = _$_SwapCallParameters;

  factory _SwapCallParameters.fromJson(Map<String, dynamic> json) =
      _$_SwapCallParameters.fromJson;

  @override
  String get methodName;
  @override
  List<dynamic> get args;
  @override
  String get value;
  @override
  Map<String, dynamic> get rawTxn;
  @override
  @JsonKey(ignore: true)
  _$$_SwapCallParametersCopyWith<_$_SwapCallParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapRequestBody _$SwapRequestBodyFromJson(Map<String, dynamic> json) {
  return _SwapRequestBody.fromJson(json);
}

/// @nodoc
mixin _$SwapRequestBody {
  String get currencyIn => throw _privateConstructorUsedError;
  String get currencyOut => throw _privateConstructorUsedError;
  String get amountIn => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SwapRequestBodyCopyWith<SwapRequestBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapRequestBodyCopyWith<$Res> {
  factory $SwapRequestBodyCopyWith(
          SwapRequestBody value, $Res Function(SwapRequestBody) then) =
      _$SwapRequestBodyCopyWithImpl<$Res, SwapRequestBody>;
  @useResult
  $Res call(
      {String currencyIn,
      String currencyOut,
      String amountIn,
      String recipient});
}

/// @nodoc
class _$SwapRequestBodyCopyWithImpl<$Res, $Val extends SwapRequestBody>
    implements $SwapRequestBodyCopyWith<$Res> {
  _$SwapRequestBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyIn = null,
    Object? currencyOut = null,
    Object? amountIn = null,
    Object? recipient = null,
  }) {
    return _then(_value.copyWith(
      currencyIn: null == currencyIn
          ? _value.currencyIn
          : currencyIn // ignore: cast_nullable_to_non_nullable
              as String,
      currencyOut: null == currencyOut
          ? _value.currencyOut
          : currencyOut // ignore: cast_nullable_to_non_nullable
              as String,
      amountIn: null == amountIn
          ? _value.amountIn
          : amountIn // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SwapRequestBodyCopyWith<$Res>
    implements $SwapRequestBodyCopyWith<$Res> {
  factory _$$_SwapRequestBodyCopyWith(
          _$_SwapRequestBody value, $Res Function(_$_SwapRequestBody) then) =
      __$$_SwapRequestBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String currencyIn,
      String currencyOut,
      String amountIn,
      String recipient});
}

/// @nodoc
class __$$_SwapRequestBodyCopyWithImpl<$Res>
    extends _$SwapRequestBodyCopyWithImpl<$Res, _$_SwapRequestBody>
    implements _$$_SwapRequestBodyCopyWith<$Res> {
  __$$_SwapRequestBodyCopyWithImpl(
      _$_SwapRequestBody _value, $Res Function(_$_SwapRequestBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyIn = null,
    Object? currencyOut = null,
    Object? amountIn = null,
    Object? recipient = null,
  }) {
    return _then(_$_SwapRequestBody(
      currencyIn: null == currencyIn
          ? _value.currencyIn
          : currencyIn // ignore: cast_nullable_to_non_nullable
              as String,
      currencyOut: null == currencyOut
          ? _value.currencyOut
          : currencyOut // ignore: cast_nullable_to_non_nullable
              as String,
      amountIn: null == amountIn
          ? _value.amountIn
          : amountIn // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SwapRequestBody implements _SwapRequestBody {
  _$_SwapRequestBody(
      {this.currencyIn = '',
      this.currencyOut = '',
      this.amountIn = '',
      this.recipient = ''});

  factory _$_SwapRequestBody.fromJson(Map<String, dynamic> json) =>
      _$$_SwapRequestBodyFromJson(json);

  @override
  @JsonKey()
  final String currencyIn;
  @override
  @JsonKey()
  final String currencyOut;
  @override
  @JsonKey()
  final String amountIn;
  @override
  @JsonKey()
  final String recipient;

  @override
  String toString() {
    return 'SwapRequestBody(currencyIn: $currencyIn, currencyOut: $currencyOut, amountIn: $amountIn, recipient: $recipient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SwapRequestBody &&
            (identical(other.currencyIn, currencyIn) ||
                other.currencyIn == currencyIn) &&
            (identical(other.currencyOut, currencyOut) ||
                other.currencyOut == currencyOut) &&
            (identical(other.amountIn, amountIn) ||
                other.amountIn == amountIn) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currencyIn, currencyOut, amountIn, recipient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SwapRequestBodyCopyWith<_$_SwapRequestBody> get copyWith =>
      __$$_SwapRequestBodyCopyWithImpl<_$_SwapRequestBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SwapRequestBodyToJson(
      this,
    );
  }
}

abstract class _SwapRequestBody implements SwapRequestBody {
  factory _SwapRequestBody(
      {final String currencyIn,
      final String currencyOut,
      final String amountIn,
      final String recipient}) = _$_SwapRequestBody;

  factory _SwapRequestBody.fromJson(Map<String, dynamic> json) =
      _$_SwapRequestBody.fromJson;

  @override
  String get currencyIn;
  @override
  String get currencyOut;
  @override
  String get amountIn;
  @override
  String get recipient;
  @override
  @JsonKey(ignore: true)
  _$$_SwapRequestBodyCopyWith<_$_SwapRequestBody> get copyWith =>
      throw _privateConstructorUsedError;
}
