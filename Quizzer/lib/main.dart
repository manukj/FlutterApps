import 'package:ask_me/questions.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Quizebrain.dart';
int correct = 0;
int wrong= 0;

List<Icon> scorekeeper = [

];



Quizebrain qb = Quizebrain([
  Question('Some cats are actually allergic to humans', true),
  Question('You can lead a cow down stairs but not up stairs.', false),
  Question('Approximately one quarter of human bones are in the feet.', true),
  Question('A slug\'s blood is green.', true),
  Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
  Question('It is illegal to pee in the Ocean in Portugal.', true),
  Question('No piece of square dry paper can be folded in half more than 7 times.', false),
  Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
  Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
  Question('The total surface area of two human lungs is approximately 70 square metres.', true),
  Question('Google was originally called \"Backrub\".', true),
  Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
  Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
]);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quize",
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: Quize(),
      ),
    );
  }
}

class Quize extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Quize> {

  void checkAnswer(bool user_answer)
  {
    setState(() {
      if(user_answer == qb.getAnswer())
      {
        correct++;
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      }
      else
      {
        wrong++;
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

    });

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              qb.getQuestion(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
               if(qb.getNext() < 0)
                 {
                   Alert(context: context, title: "Quize fininshed", desc: "Correct answer $correct \n Wrong answer $wrong").show();
                   setState(() {
                     scorekeeper.clear();
                   });
                 }
               else
                 checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(qb.getNext() < 0)
                  {
                    Alert(context: context, title: "Done", desc: "Quize fininshed").show();
                    setState(() {
                      scorekeeper.clear();
                    });
                  }
                  else
                    checkAnswer(true);
                });
//The user picked true.
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: scorekeeper),
        )
      ],
    );
  }
}
