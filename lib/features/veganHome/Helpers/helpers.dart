import 'package:html/parser.dart';

String cFPrice(double price) {
  return "£" + price.toString();
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}
