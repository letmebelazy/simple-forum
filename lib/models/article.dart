class Article {
  String title;
  String content;
  String createdAt;
  bool isEdited = false;
  String? editedAt;

  Article(this.title, this.content, this.createdAt);
}