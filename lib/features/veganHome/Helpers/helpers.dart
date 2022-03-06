import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:html/parser.dart';

String cFPrice(int price) {
  //isPence ? price = price ~/ 100 : price;
  return "£" + (price / 100).toStringAsFixed(2);
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}

String mapPreviewImage({required double latitude, required double longitude}) {
  return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=800x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=${dotenv.env['MAP_API_KEY']!}&style=feature:|element:|visibility:simplified';
}

String mapToString(Map<String, String> map) {
  DateTime startTime = DateTime.parse(map.entries.first.value);
  DateTime endTime = DateTime.parse(map.entries.last.value);

  return "${startTime.hour.toString()}:00 - ${endTime.hour.toString()}:00";
}

String formatDateForOrderObject(String date) {
  return date.replaceFirst("T", " ").replaceFirst(".000Z", "");
}
