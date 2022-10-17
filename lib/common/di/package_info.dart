import 'package:injectable/injectable.dart';
import 'package:package_info/package_info.dart';
import 'package:vegan_liverpool/common/di/di.dart';

@module
abstract class PackageInfoDi {
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
}

final PackageInfo packageInfo = getIt<PackageInfo>();
