import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw Exception('Could not launch $url');
  }
}
