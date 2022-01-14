import 'package:html/parser.dart';

String cFPrice(int price, {bool isPence = true}) {
  //isPence ? price = price ~/ 100 : price;
  return "£" + (price / 100).toString();
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}
