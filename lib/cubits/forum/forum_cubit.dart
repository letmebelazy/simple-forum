import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:simple_forum/models/article.dart';
part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  ForumCubit() : super(ForumState.initial());

  void addArticle(Article article) {
    List<Article> tempList = state.articles;
    tempList.add(article);
    emit(state.copyWith(articles: tempList));
  }

  void deleteArticle(int index) {
    List<Article> tempList = state.articles;
    tempList.removeAt(index);
    emit(state.copyWith(articles: tempList));
  }

  void changeCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void editTitle(int index, String title) {
    List<Article> tempList = state.articles;
    tempList[index].title = title;
    emit(state.copyWith(articles: tempList));
  }

  void editContent(int index, String content) {
    List<Article> tempList = state.articles;
    tempList[index].content = content;
    emit(state.copyWith(articles: tempList));
  }

  void toggleIsEdited(int index) {
    List<Article> tempList = state.articles;
    tempList[index].isEdited = true;
    emit(state.copyWith(articles: tempList));
  }

  void setEditedAt(int index) {
    List<Article> tempList = state.articles;
    tempList[index].editedAt = DateFormat('yyyy-MM-dd HH-mm').format(DateTime.now());
    emit(state.copyWith(articles: tempList));
  }
}
