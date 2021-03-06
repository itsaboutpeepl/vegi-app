// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transak.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransakPlugin _$TransakPluginFromJson(Map<String, dynamic> json) {
  return _TransakPlugin.fromJson(json);
}

/// @nodoc
mixin _$TransakPlugin {
  String get name => throw _privateConstructorUsedError;
  String? get widgetUrl => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransakPluginCopyWith<TransakPlugin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransakPluginCopyWith<$Res> {
  factory $TransakPluginCopyWith(
          TransakPlugin value, $Res Function(TransakPlugin) then) =
      _$TransakPluginCopyWithImpl<$Res>;
  $Res call({String name, String? widgetUrl, String type, bool isActive});
}

/// @nodoc
class _$TransakPluginCopyWithImpl<$Res>
    implements $TransakPluginCopyWith<$Res> {
  _$TransakPluginCopyWithImpl(this._value, this._then);

  final TransakPlugin _value;
  // ignore: unused_field
  final $Res Function(TransakPlugin) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? widgetUrl = freezed,
    Object? type = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      widgetUrl: widgetUrl == freezed
          ? _value.widgetUrl
          : widgetUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TransakPluginCopyWith<$Res>
    implements $TransakPluginCopyWith<$Res> {
  factory _$$_TransakPluginCopyWith(
          _$_TransakPlugin value, $Res Function(_$_TransakPlugin) then) =
      __$$_TransakPluginCopyWithImpl<$Res>;
  @override
  $Res call({String name, String? widgetUrl, String type, bool isActive});
}

/// @nodoc
class __$$_TransakPluginCopyWithImpl<$Res>
    extends _$TransakPluginCopyWithImpl<$Res>
    implements _$$_TransakPluginCopyWith<$Res> {
  __$$_TransakPluginCopyWithImpl(
      _$_TransakPlugin _value, $Res Function(_$_TransakPlugin) _then)
      : super(_value, (v) => _then(v as _$_TransakPlugin));

  @override
  _$_TransakPlugin get _value => super._value as _$_TransakPlugin;

  @override
  $Res call({
    Object? name = freezed,
    Object? widgetUrl = freezed,
    Object? type = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_TransakPlugin(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      widgetUrl: widgetUrl == freezed
          ? _value.widgetUrl
          : widgetUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_TransakPlugin
    with DiagnosticableTreeMixin, Plugin
    implements _TransakPlugin {
  _$_TransakPlugin(
      {this.name = 'transak',
      this.widgetUrl,
      this.type = 'deposit',
      this.isActive = false});

  factory _$_TransakPlugin.fromJson(Map<String, dynamic> json) =>
      _$$_TransakPluginFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final String? widgetUrl;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransakPlugin(name: $name, widgetUrl: $widgetUrl, type: $type, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransakPlugin'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('widgetUrl', widgetUrl))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransakPlugin &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.widgetUrl, widgetUrl) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(widgetUrl),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  _$$_TransakPluginCopyWith<_$_TransakPlugin> get copyWith =>
      __$$_TransakPluginCopyWithImpl<_$_TransakPlugin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransakPluginToJson(this);
  }
}

abstract class _TransakPlugin implements TransakPlugin, Plugin {
  factory _TransakPlugin(
      {final String name,
      final String? widgetUrl,
      final String type,
      final bool isActive}) = _$_TransakPlugin;

  factory _TransakPlugin.fromJson(Map<String, dynamic> json) =
      _$_TransakPlugin.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get widgetUrl => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  bool get isActive => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TransakPluginCopyWith<_$_TransakPlugin> get copyWith =>
      throw _privateConstructorUsedError;
}
