
import 'dart:convert';
import 'package:flutter_exam/model/question.dart';
import 'package:flutter_exam/presentation/QuestionScreen/QuestionView.dart';
import 'package:http/http.dart' as network;

class QuestionPresenter {
  QuestionView _view;

  QuestionPresenter(this._view);

  fetchData() async {
    _view.showLoading();
    network.Response response =
    await network.get('https://opentdb.com/api.php?amount=10');
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      List<Question> questions = jsonBody['results'].map<Question>((element) {
        String question = element['question'];
        String correctA = element['correct_answer'];
        List<String> incorrectAFromJson = new List <String>.from(element['incorrect_answers']);
       // List<String> incorrectList = new List<String>.from(incorrectAFromJson);
        //print("Contenido de la lista de preguntas incorrectas" + incorrectList.toString());
          print(incorrectAFromJson);
          String incorrectA1 = incorrectAFromJson[0].toString();
          String incorrectA2 = incorrectAFromJson[0].toString();
          String incorrectA3 = incorrectAFromJson[0].toString();
          return Question(question, correctA, incorrectA1, incorrectA2, incorrectA3);
      }).toList();
      _view.showQuestions(questions);
    } else {
      _view.showError();
    }
    _view.hideLoading();
  }

  elementClicked(int position) {
    _view.openDetailScreen(position);
  }


}
