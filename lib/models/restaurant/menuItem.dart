import 'package:freezed_annotation/freezed_annotation.dart';

part 'menuItem.freezed.dart';
part 'menuItem.g.dart';

@freezed
class MenuItem with _$MenuItem {
  const MenuItem._();

  @JsonSerializable()
  factory MenuItem({
    required String name,
    required List<String> imageURLs,
    required String category,
    required double price,
    required String description,
    required Map<String, double> options,
  }) = _MenuItem;

  factory MenuItem.fromJson(dynamic json) => _$MenuItemFromJson(json);

  String get formattedPrice => "£" + this.price.toString();
}
