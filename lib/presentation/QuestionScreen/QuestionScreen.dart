import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/model/question.dart';
import 'package:flutter_exam/presentation/DetailedQuestionScreen/DetailedQuestionScreen.dart';
import 'package:flutter_exam/presentation/QuestionScreen/QuestionPresenter.dart';
import 'package:flutter_exam/presentation/QuestionScreen/QuestionView.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> implements QuestionView {
  QuestionPresenter _questionPresenter;
  List<Question> _questions = [];
  bool _isLoading = true;
  bool _isError = false;

  _QuestionScreenState() {
    _questionPresenter = QuestionPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _questionPresenter.fetchData();
  }


  @override
  showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  showError() {
    setState(() {
      _isError = true;
    });
  }

  @override
  showQuestions(List<Question> questions) {
    setState(() {
      this._questions = questions;
    });
  }

  buildBody() {
    if (_isLoading) {
      return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0),
            child: CircularProgressIndicator(),
          ));
    }
    else if (_isError) {
      return Center(child: Text("Ha habido un error"));
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _questionPresenter.fetchData();
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.help),
              title:
              Text(_questions[position].question ),
               //_questions[position].correctA
              //_questions[position].incorrectA
              onTap: () {
                _questionPresenter.elementClicked(position);
              },
            );
          },
          itemCount: _questions.length,
          reverse: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: new Text("Questions App")
        ),

        body: buildBody(),
    );
  }

  @override
  openDetailScreen(int position) {
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return DetailQuestionPage(position: position, question: _questions[position].question ,correctA: _questions[position].correctA, incorrectA1: _questions[position].incorrectA1 , incorrectA2: _questions[position].incorrectA2 , incorrectA3: _questions[position].incorrectA3 ,);
    }));
  }
}

