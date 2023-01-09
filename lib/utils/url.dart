import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchUrl(String url, {LaunchMode mode = LaunchMode.externalApplication}) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(
      url,
      mode:mode,
    );
  } else {
    throw Exception('Could not launch $url');
  }
}
