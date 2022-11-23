class ViewItem {
  ViewItem({
    required this.name,
    required this.totalPriceFormatted,
    required this.chosenOptions,
  });

  final String name;
  final String totalPriceFormatted;
  final Iterable<String> chosenOptions;
}
