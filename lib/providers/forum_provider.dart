import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_forum/models/article.dart';

class ForumProvider extends ChangeNotifier {
  List<Article> articles = [];
  int currentIndex = 0;

  void addArticle(Article article) {
    articles.add(article);
    notifyListeners();
  }

  void deleteArticle(int index) {
    articles.removeAt(index);
    notifyListeners();
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void editTitle(int index, String title) {
    articles[index].title = title;
    notifyListeners();
  }

  void editContent(int index, String content) {
    articles[index].content = content;
    notifyListeners();
  }

  void toggleIsEdited(int index) {
    articles[index].isEdited = true;
    notifyListeners();
  }

  void setEditedAt(int index) {
    articles[index].editedAt = DateFormat('yyyy-MM-dd HH-mm').format(DateTime.now());
  }
}