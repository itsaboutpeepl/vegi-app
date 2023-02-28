import 'package:flutter/services.dart';

// ~ https://www.kindacode.com/article/flutter-copy-to-clipboard-example-without-any-plugins/

Future<void> copyToClipboard(String? text) async {
  return Clipboard.setData(ClipboardData(text: text));
}

Future<String?> fetchClipboardMostRecent() async {
  final ClipboardData? _data = await Clipboard.getData('text/plain');
  return _data?.text;
}
