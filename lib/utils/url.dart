import 'package:url_launcher/url_launcher_string.dart';
import 'package:vegan_liverpool/common/di/package_info.dart';
import 'package:vegan_liverpool/utils/constants.dart';

Future<void> launchUrl(
  String url, {
  LaunchMode mode = LaunchMode.externalApplication,
}) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(
      url,
      mode: mode,
    );
  } else {
    throw Exception('Could not launch $url');
  }
}

String whatsappAutofillNewMessage(String phoneNumber, String message) {
  final body = '$message'
      ' Version ${packageInfo.version},'
      ' Build ${packageInfo.buildNumber}';
  return 'whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(body)}';
}

const instaDMContactVegiSupportUrlButtonLabel = 'DM';

int _convert24HourTo12Hour(int hour) {
  // if (hour > 11) {
  //   return hour - 12;
  // }
  return hour % 12;
}

// todo: Populate from vegi backend
const whatsappContactVegiSupportOpens24HourClock = 17;
const whatsappContactVegiSupportCloses24HourClock = 21;
String whatsappContactVegiSupportUrlButtonLabel() {
  return 'Chat ' + (whatsappChatIsOutOfHours() ? 'offline' : 'now');
}

final whatsappContactVegiSupportUrl =
    whatsappAutofillNewMessage(VEGI_SUPPORT_PHONE_NUMBER, '');

bool whatsappChatIsOutOfHours() {
  final now = DateTime.now();
  return now.hour < whatsappContactVegiSupportOpens24HourClock ||
      now.hour >= whatsappContactVegiSupportCloses24HourClock;
}

String mailAutofillNewMessage(String to, String subject, String message) {
  final emailTo = Uri.encodeComponent(to);
  final emailSubject = Uri.encodeComponent(subject);
  final body = '$message'
      ' Version ${packageInfo.version},'
      ' Build ${packageInfo.buildNumber}';
  final mailString =
      'mailto:$emailTo?subject=$emailSubject&body=${Uri.encodeComponent(body)}';

  return mailString;
  // Uri mail = Uri.parse(mailString);
  // if (await launchUrl(mail)) {
  //     //email app opened
  // }else{
  //     //email app is not opened
  // }
}

final mailContactVegiSupport = mailAutofillNewMessage(
  VEGI_SUPPORT_EMAIL,
  Messages.newSupportRequestSubjectHeader,
  '',
);
