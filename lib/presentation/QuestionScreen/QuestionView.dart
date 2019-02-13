import 'package:flutter_exam/model/question.dart';

abstract class QuestionView {
  openDetailScreen(int position);

  showQuestions(List<Question> question);

  showLoading();

  hideLoading();

  showError();
}