part of 'forum_cubit.dart';

class ForumState extends Equatable {
  final List<Article> articles;
  final int currentIndex;

  ForumState({
    required this.articles,
    required this.currentIndex,
  });

  factory ForumState.initial() {
    return ForumState(
      articles: [],
      currentIndex: 0,
    );
  }

  @override
  List<Object> get props => [articles, currentIndex];

  @override
  String toString() =>
      'ForumState(articles: $articles, currentIndex: $currentIndex)';

  ForumState copyWith({
    List<Article>? articles,
    int? currentIndex,
  }) {
    return ForumState(
      articles: articles ?? this.articles,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
