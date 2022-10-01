import 'dart:core';

// https://dart.dev/guides/language/extension-methods
extension WordParsing on String {
  String toSentenceCaseFromCamelCase() => this.replaceAllMapped(
      RegExp(r'^([a-z])|[A-Z]'),
      (Match m) => m[1] == null ? " ${m[0]}" : m[1]!.toUpperCase());

  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}


// extension <extension name> on <type> {
//   (<member definition>)*
// }