import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/model/question.dart';

class DetailQuestionPage extends StatefulWidget {

  final int position;
  final String question;
  final String correctA;
  final String incorrectA1;
  final String incorrectA2;
  final String incorrectA3;

  DetailQuestionPage({this.position, this.question, this.correctA , this.incorrectA1, this.incorrectA2, this.incorrectA3});

  @override
  _DetailQuestionPageState createState() => _DetailQuestionPageState();
}

class _DetailQuestionPageState extends State<DetailQuestionPage> {

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("La respuesta es....."),
          content: new Text("CORRECTA!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog2() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("La respuesta es....."),
          content: new Text("INCORRECTA!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: Text("Pregunta"),
          centerTitle: true,
        ),
        body: new Container(
          child: new Column(

            children: <Widget>[
              new Text(widget.question,
            style: new TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),),

              new RaisedButton(
                child: new Text(widget.correctA),
                color:  Colors.blueAccent[600],
                onPressed: _showDialog,

              ),

              new RaisedButton(
                child: new Text(widget.incorrectA1),
                color:  Colors.blueAccent[600],
                onPressed: _showDialog2,
              ),

              new RaisedButton(
                child: new Text(widget.incorrectA3),
                color:  Colors.blueAccent[600],
                onPressed: _showDialog2,
              ),

              new RaisedButton(
                child: new Text(widget.incorrectA2),
                color:  Colors.blueAccent[600],
                onPressed: _showDialog2,
              ),


            ],
          ),
        ),
        );

  }
}