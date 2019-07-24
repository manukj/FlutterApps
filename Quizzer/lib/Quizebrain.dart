import 'package:ask_me/questions.dart';

class Quizebrain{

  List<Question> _questions = [];
  int _question_number = 0;
  Quizebrain(List<Question> qs)
  {
    _questions = qs;
  }

  int getNext()
  {
    if(_question_number < _questions.length -1 )
      {
        _question_number++;
        return _question_number;
      }
    _question_number = 0;
    return -1;
  }

  String getQuestion()
  {
    return _questions[_question_number].question;
  }

  bool getAnswer()
  {
    return _questions[_question_number].answer;
  }
}