import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/articles/categoryArticles.dart';

part 'news_state.freezed.dart';
part 'news_state.g.dart';

@immutable
@freezed
class NewsState with _$NewsState {
  const NewsState._();

  @JsonSerializable()
  factory NewsState({
    required List<String> categoryNames,
    required List<CategoryArticles> articles,
    required int currentTabIndex,
  }) = _NewsState;

  factory NewsState.initial() => NewsState(
        categoryNames: [],
        articles: [],
        currentTabIndex: 0,
      );

  factory NewsState.fromJson(dynamic json) => _$NewsStateFromJson(json);
}

class NewsStateConverter
    implements JsonConverter<NewsState, Map<String, dynamic>?> {
  const NewsStateConverter();

  @override
  NewsState fromJson(Map<String, dynamic>? json) =>
      json != null ? NewsState.fromJson(json) : NewsState.initial();

  @override
  Map<String, dynamic> toJson(NewsState instance) => instance.toJson();
}
