import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:vegan_liverpool/constants/enums.dart';

class BiometricUtils {
  static Future<BiometricAuth> getAvailableBiometrics({
    BiometricType type = BiometricType.fingerprint,
  }) async {
    final List<BiometricType> availableBiometrics =
        await LocalAuthentication().getAvailableBiometrics();
    if (availableBiometrics.contains(BiometricType.face)) {
      return BiometricAuth.faceID;
    } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
      return BiometricAuth.touchID;
    }
    return BiometricAuth.none;
  }

  static Future<bool> authenticateIsAvailable() async {
    final localAuth = LocalAuthentication();
    final isAvailable = await localAuth.canCheckBiometrics;
    final isDeviceSupported = await localAuth.isDeviceSupported();
    return isAvailable && isDeviceSupported;
  }

  static Future<void> showDefaultPopupCheckBiometricAuth({
    String message = '',
    required void Function(bool) callback,
    void Function()? noHardWare,
    void Function()? permanentLockOut,
    void Function()? authFailed,
    void Function()? defaultFailureCallback,
    bool stickyAuth = false,
  }) async {
    final localAuth = LocalAuthentication();

    try {
      final bool result = await localAuth.authenticate(
        localizedReason: message,
      );
      callback.call(result);
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        noHardWare != null ? noHardWare() : defaultFailureCallback?.call();
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        permanentLockOut != null
            ? permanentLockOut()
            : defaultFailureCallback?.call();
      } else {
        authFailed != null ? authFailed() : defaultFailureCallback?.call();
      }
    }
  }

  static String getBiometricString(
    BiometricAuth? type,
  ) {
    switch (type) {
      case BiometricAuth.faceID:
        return 'Face ID';
      case BiometricAuth.touchID:
        return 'Touch ID';
      case BiometricAuth.pincode:
        return '';
      case BiometricAuth.none:
        return '';
      case null:
        return '';
    }
  }
}
