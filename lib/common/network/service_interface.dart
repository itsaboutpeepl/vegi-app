// import 'package:chopper/chopper.dart'; // flutter pub run build_runner build --delete-conflicting-outputs

import 'package:logging/logging.dart';

import 'custom_stack_trace.dart';

abstract class TSerializable {
  TSerializable();

  TSerializable.fromJson(Map<String, dynamic> json);

  static final log = Logger('TSerializable');

  Map<String, dynamic> toJson();

  // static T deepCopy<T extends TSerializable>(T tSerializableInst) =>
  //     T.fromJson(toJson());

  static Map<String, T> getJsonMapValue<T extends TSerializable>(
      Map<String, dynamic> json,
      String fieldName,
      T Function(Map<String, dynamic> a, {bool shouldThrow}) fromJsonFactory,
      {Map<String, T>? defaultVal,
      bool shouldThrow = true}) {
    try {
      json = _defaultJson(json, fieldName,
          defaultVal: defaultVal, shouldThrow: shouldThrow);
      return json[fieldName] == null ||
              (json[fieldName] as Map<String, dynamic>).isEmpty
          ? defaultVal!
          : (json[fieldName] as Map<String, dynamic>).map((key, value) =>
              MapEntry(key, fromJsonFactory(value, shouldThrow: shouldThrow)));
    } on JsonParseException catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a Map<String, $T> but got $json',
            fieldName: '${err.fieldName}.$fieldName');
      }
    } catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a Map<String, $T> but got $json',
            fieldName: fieldName);
      }
    }
    return defaultVal;
  }

  static List<T> getJsonListValue<T extends TSerializable>(
      Map<String, dynamic> json,
      String fieldName,
      T Function(Map<String, dynamic> a, {bool shouldThrow}) fromJsonFactory,
      {List<T>? defaultVal,
      bool shouldThrow = true}) {
    try {
      json = _defaultJson(json, fieldName,
          defaultVal: defaultVal ?? <T>[], shouldThrow: shouldThrow);
      assert(json[fieldName] is List);
      return json[fieldName] == null || (json[fieldName] as List).isEmpty
          ? defaultVal!
          : (json[fieldName] as List)
              .map((j) => fromJsonFactory(j, shouldThrow: shouldThrow))
              .toList();
      // return (json.containsKey(fieldName) &&
      //             ((json[fieldName] ?? []) as List).isNotEmpty
      //         ? (json[fieldName] as List)
      //             .map((j) => modelType.fromJson(j))
      //             .toList()
      //         : const <ItemModel>[])
    } on JsonParseException catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a List<$T> but got $json',
            fieldName: '${err.fieldName}.$fieldName');
      }
    } catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a List<$T> but got $json',
            fieldName: fieldName);
      }
    }
    return defaultVal;
  }

  static Map<String, List<T>> getJsonMapListValue<T extends TSerializable>(
      Map<String, dynamic> json,
      String fieldName,
      T Function(Map<String, dynamic> a, {bool shouldThrow}) fromJsonFactory,
      {Map<String, List<T>>? defaultVal,
      bool shouldThrow = true}) {
    try {
      json = _defaultJson(json, fieldName,
          defaultVal: defaultVal ?? <String, List<T>>{},
          shouldThrow: shouldThrow);
      return json[fieldName] == null ||
              (json[fieldName] as Map<String, dynamic>).isEmpty ||
              (json[fieldName] is! Map<String, List>)
          ? defaultVal!
          : (json[fieldName] as Map<String, List>).map((key, value) => MapEntry(
              key,
              value
                  .map((v) => fromJsonFactory(v as Map<String, dynamic>,
                      shouldThrow: shouldThrow))
                  .toList()));
    } on JsonParseException catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a Map<String, List<$T>> but got $json',
            fieldName: '${err.fieldName}.$fieldName');
      }
    } catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a Map<String, List<$T>> but got $json',
            fieldName: fieldName);
      }
    }
    return defaultVal;
  }

  static T getJsonValue<T extends TSerializable>(
      Map<String, dynamic> json,
      String fieldName,
      T Function(Map<String, dynamic> a, {bool shouldThrow}) fromJsonFactory,
      {T? defaultVal,
      bool shouldThrow = true}) {
    try {
      json = _defaultJson(json, fieldName,
          defaultVal: defaultVal, shouldThrow: shouldThrow);
      // assert(json[fieldName] is! List);
      return json[fieldName] == null
          ? defaultVal!
          : fromJsonFactory(json[fieldName], shouldThrow: shouldThrow);
    } on JsonParseException catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a $T but got $json',
            fieldName: '${err.fieldName}.$fieldName');
      }
    } catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a $T but got $json',
            fieldName: fieldName);
      }
    }
    return defaultVal;
  }

  static T getJsonValTypeValue<T>(Map<String, dynamic> json, String fieldName,
      {T? defaultVal, bool shouldThrow = true}) {
    try {
      json = _defaultJson(json, fieldName,
          defaultVal: defaultVal, shouldThrow: shouldThrow);
      assert(json.containsKey(fieldName));
      json[fieldName] ??= defaultVal;
      // assert(json[fieldName] is T); // BUG: Dont check type as type is _JsonMap
      if (json[fieldName] != null && json[fieldName] is! T) {
        json[fieldName] = Map<String, dynamic>.from(json[fieldName]);
      }
      return (json[fieldName] ?? defaultVal);
    } on JsonParseException catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a $T but got $json',
            fieldName: '${err.fieldName}.$fieldName');
      }
    } catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a $T but got $json',
            fieldName: fieldName);
      }
    }

    return defaultVal;
  }

  static Map<String, TVal> getJsonMapValTypeValue<TVal>(
      Map<String, dynamic> json, String fieldName,
      {Map<String, TVal>? defaultVal, bool shouldThrow = true}) {
    try {
      json = _defaultJson(json, fieldName,
          defaultVal: defaultVal, shouldThrow: shouldThrow);
      assert(json.containsKey(fieldName));
      json[fieldName] ??= defaultVal;
      // assert(json[fieldName] is T); // BUG: Dont check type as type is _JsonMap
      if (json[fieldName] != null && json[fieldName] is! Map<String, TVal>) {
        json[fieldName] = Map<String, TVal>.from(json[fieldName]);
      }
      return (json[fieldName] ?? defaultVal);
    } on JsonParseException catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a Map<String, $TVal> but got $json',
            fieldName: '${err.fieldName}.$fieldName');
      }
    } catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a Map<String, $TVal> but got $json',
            fieldName: fieldName);
      }
    }
    return defaultVal;
  }

  static T getJsonValTypeTryParseValue<T>(
      Map<String, dynamic> json, String fieldName,
      {required T? Function(String jsonVal) parser,
      T? defaultVal,
      bool shouldThrow = true}) {
    try {
      json = _defaultJson(json, fieldName,
          defaultVal: defaultVal, shouldThrow: shouldThrow);
      assert(json.containsKey(fieldName));
      json[fieldName] ??= defaultVal;
      // assert(json[fieldName] is T); // BUG: Dont check type as type is _JsonMap
      if (json[fieldName] != null && json[fieldName] is! String) {
        json[fieldName] = Map<String, dynamic>.from(json[fieldName]);
      } else {
        json[fieldName] = parser(json[fieldName]) ?? defaultVal;
      }
      return (json[fieldName] ?? defaultVal);
    } on JsonParseException catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a $T but got $json',
            fieldName: '${err.fieldName}.$fieldName');
      }
    } catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a $T but got $json',
            fieldName: fieldName);
      }
    }
    return defaultVal;
  }

  static T getJsonValueFromChain<T extends TSerializable>(
      Map<String, dynamic> json,
      List<String> fieldNames,
      T Function(Map<String, dynamic> a, {bool shouldThrow}) fromJsonFactory,
      {T? defaultVal,
      bool shouldThrow = true}) {
    dynamic out = json;
    try {
      assert(fieldNames.isNotEmpty);

      for (String fieldName in fieldNames) {
        out ??= <String, dynamic>{fieldName: null};
        out = out[fieldName];
      }
      assert(out != null || defaultVal != null);
      return out == null
          ? defaultVal!
          : fromJsonFactory(out, shouldThrow: shouldThrow);
    } on JsonParseException catch (err) {
      var fieldNameJ = fieldNames.join('.');
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldNameJ, \n\twanted a $T but got $json',
            fieldName: '${err.fieldName}.$fieldNameJ');
      }
    } catch (err) {
      var fieldNameJ = fieldNames.join('.');
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldNameJ with value: $out',
            fieldName: fieldNameJ);
      }
    }
    return defaultVal;
  }

  static List<T> getJsonListValueFromChain<T extends TSerializable>(
      Map<String, dynamic> json,
      List<String> fieldNames,
      T Function(Map<String, dynamic> a, {bool shouldThrow}) fromJsonFactory,
      {List<T>? defaultVal,
      bool shouldThrow = true}) {
    try {
      assert(fieldNames.isNotEmpty);
      dynamic out = json;
      for (String fieldName in fieldNames) {
        out ??= <String, dynamic>{fieldName: null};
        out = out[fieldName];
      }
      assert(out != null || defaultVal != null);
      if (out != null) {
        assert(out is List);
      }
      return out == null
          ? defaultVal!
          : (out as List)
              .map((j) => fromJsonFactory(j, shouldThrow: shouldThrow))
              .toList();
    } on JsonParseException catch (err) {
      var fieldNameJ = fieldNames.join('.');
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldNameJ, \n\twanted a List<$T> but got $json',
            fieldName: '${err.fieldName}.$fieldNameJ');
      }
    } catch (err) {
      var fieldNameJ = fieldNames.join('.');
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldNameJ, \n\twanted a List<$T> but got $json',
            fieldName: fieldNameJ);
      }
    }
    return defaultVal;
  }

  static T getJsonValTypeValueFromChain<T>(
      Map<String, dynamic> json, List<String> fieldNames,
      {T? defaultVal, bool shouldThrow = true}) {
    try {
      assert(fieldNames.isNotEmpty);
      dynamic out = json;
      for (String fieldName in fieldNames) {
        out ??= <String, dynamic>{fieldName: null};
        out = out[fieldName];
      }
      out ??= defaultVal;
      return out;
    } on JsonParseException catch (err) {
      var fieldNameJ = fieldNames.join('.');
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldNameJ, \n\twanted a $T but got $json',
            fieldName: '${err.fieldName}.$fieldNameJ');
      }
    } catch (err) {
      var fieldNameJ = fieldNames.join('.');
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldNameJ, \n\twanted a $T but got $json',
            fieldName: fieldNameJ);
      }
    }
    return defaultVal;
  }

  static Map<String, dynamic> _defaultJson(
      Map<String, dynamic> json, String fieldName,
      {dynamic defaultVal, bool shouldThrow = true}) {
    try {
      if (defaultVal == null) {
        assert(json.containsKey(fieldName));
      } else {
        if (!json.containsKey(fieldName)) {
          json[fieldName] = defaultVal;
        }
      }
      return json;
    } on JsonParseException catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a Map<String, dynamic> but got $json',
            fieldName: '${err.fieldName}.$fieldName');
      }
    } catch (err) {
      if (defaultVal == null || shouldThrow) {
        throw JsonParseException(
            'Unable to pass json of fieldName: $fieldName, \n\twanted a Map<String, dynamic> but got $json',
            fieldName: fieldName);
      }
    }
    return <String, dynamic>{};
  }
}

abstract class ServiceInterface<T extends TSerializable> {
  Future<Iterable<T>> loadService();
}

class JsonParseException implements Exception {
  late CustomTrace programInfo;

  JsonParseException(this.message, {required this.fieldName}) : super() {
    programInfo = CustomTrace(StackTrace.current);
  }

  static final log = Logger('JsonParseException');

  final String fieldName;
  final String message;

  String get errMsg => """JsonParseException: $message
  Source file: ${programInfo.fileName}, 
  current line of code since the instanciation/creation of the custom trace object: ${programInfo.lineNumber}, 
  even the column(yay!): ${programInfo.columnNumber}""";
}
