import 'package:html/parser.dart';

String cFPrice(int price, {bool isPence = false}) {
  isPence ? price = price ~/ 100 : price;
  return "£" + (price).toString();
}

String doublecFPrice(double price, {bool isPence = false}) {
  isPence ? price = price / 100 : price;
  return "£" + (price).toString();
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}
