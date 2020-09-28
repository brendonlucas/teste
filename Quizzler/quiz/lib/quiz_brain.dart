import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  int acertos = 0;
  double porcentagem = 0;

  List<Question> _questionBank = [
    Question("Você está vivo?", "true"),
    Question("E possivel cair para cima?", "talvez"),
    Question("1 kilo de algodão pesa mais q 1 kilo de arroz?", "false"),
    Question("A relatividade é relativa?", "true"),
    Question("O fêmur é um osso do braço?", "false"),
     // Talvez
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length) {
      _questionNumber++;
    }
  }
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }
  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length) {
      return true;
    } else {
      return false;
    }
  }
  void setPercent(){
    acertos += 1;
    int total = _questionBank.length ;
    int x = acertos * 100;
    porcentagem =  x / total;
  }
  double getPercentagem(){
    return porcentagem;
  }

  void reset() {
    porcentagem = 0;
    acertos = 0;
    _questionNumber = 0;
  }
}
