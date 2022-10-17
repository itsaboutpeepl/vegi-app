import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:redux_persist/redux_persist.dart';

class SecureStorage implements StorageEngine {
  SecureStorage(this.flutterSecureStorage);
  FlutterSecureStorage flutterSecureStorage;

  @override
  Future<Uint8List> load() async {
    final data = await flutterSecureStorage.read(key: 'data');
    return stringToUint8List(data)!;
  }

  @override
  Future<void> save(Uint8List? data) async {
    await flutterSecureStorage.write(
      key: "data",
      value: uint8ListToString(
        data,
      ),
    );
  }
}
