import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({
    Key? key,
    required this.url,
    required this.title,
    this.onPageStarted,
  }) : super(key: key);
  final String url;
  final String title;
  final void Function(String)? onPageStarted;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: title,
      resizeToAvoidBottomInset: !Platform.isIOS,
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}
