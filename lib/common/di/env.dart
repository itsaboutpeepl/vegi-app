import 'package:vegan_liverpool/utils/constants.dart';

abstract class Env {
  static const dev = 'dev';
  static const test = 'test';
  static const qa = 'qa';
  static const prod = 'prod';
  static const activeEnv = ENV == 'development'
      ? dev
      : ENV == 'qa'
          ? qa
          : ENV == 'test'
              ? test
              : prod;
}
