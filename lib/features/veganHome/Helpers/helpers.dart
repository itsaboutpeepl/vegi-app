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
