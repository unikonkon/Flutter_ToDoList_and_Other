import 'package:flutter/material.dart';

class MyCalculatorPage extends StatefulWidget {
  const MyCalculatorPage({super.key, required this.title});
  final String title;

  @override
  _MyCalculatorPageState createState() => _MyCalculatorPageState();
}

class _MyCalculatorPageState extends State<MyCalculatorPage> {
  late String answer;
  late String answerTemp;
  late String inputFull;
  late String operator;
  late bool calculateMode;

  @override
  void initState() {
    answer = "0";
    operator = "";
    answerTemp = "";
    inputFull = "";
    calculateMode = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffecf0f1),
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        elevation: 1,
      ),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[Answer(), NumPad()],
      )),
    );
  }

  Widget Answer() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Color(0xffdbdbdb),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(inputFull + " " + operator, style: TextStyle(fontSize: 18)),
              Text(answer,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  Widget NumPad() {
    return Container(
      color: Color.fromARGB(255, 227, 225, 225),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(children: <Widget>[
            NumberButton("CE", numberButton: false, onTap: () {
              clearAnswer();
            }),
            NumberButton("C", numberButton: false, onTap: () {
              clearAll();
            }),
            NumberButton("=", numberButton: false, onTap: () {
              calculate();
            }),
            NumberButton("÷", numberButton: false, onTap: () {
              addOperatorToAnswer("÷");
            }),
          ]),
          Row(children: <Widget>[
            NumberButton("7", onTap: () {
              addNumberToAnswer(7);
            }),
            NumberButton("8", onTap: () {
              addNumberToAnswer(8);
            }),
            NumberButton("9", onTap: () {
              addNumberToAnswer(9);
            }),
            NumberButton("×", numberButton: false, onTap: () {
              addOperatorToAnswer("×");
            }),
          ]),
          Row(children: <Widget>[
            NumberButton("4", onTap: () {
              addNumberToAnswer(4);
            }),
            NumberButton("5", onTap: () {
              addNumberToAnswer(5);
            }),
            NumberButton("6", onTap: () {
              addNumberToAnswer(6);
            }),
            NumberButton("−", numberButton: false, onTap: () {
              addOperatorToAnswer("-");
            }),
          ]),
          Row(children: <Widget>[
            NumberButton("1", onTap: () {
              addNumberToAnswer(1);
            }),
            NumberButton("2", onTap: () {
              addNumberToAnswer(2);
            }),
            NumberButton("3", onTap: () {
              addNumberToAnswer(3);
            }),
            NumberButton("+", numberButton: false, onTap: () {
              addOperatorToAnswer("+");
            }),
          ]),
          Row(children: <Widget>[
            NumberButton(".", numberButton: false, onTap: () {
              addDotToAnswer();
            }),
            NumberButton("0", onTap: () {
              addNumberToAnswer(0);
            }),
            NumberButton("⌫", numberButton: false, onTap: () {
              removeAnswerLast();
            }),
            NumberButton("minus", numberButton: false, onTap: () {
              toggleNegative();
            }),
          ]),
        ],
      ),
    );
  }

  void toggleNegative() {
    setState(() {
      if (answer.contains("-")) {
        answer = answer.replaceAll("-", "");
      } else {
        answer = "-" + answer;
      }
    });
  }

  void clearAnswer() {
    setState(() {
      answer = "0";
    });
  }

  void clearAll() {
    setState(() {
      answer = "0";
      inputFull = "";
      calculateMode = false;
      operator = "";
    });
  }

  void calculate() {
    setState(
      () {
        if (calculateMode) {
          bool decimalMode = false;
          double value = 0;
          if (answer.contains(".") || answerTemp.contains(".")) {
            decimalMode = true;
          }

          if (operator == "+") {
            value = (double.parse(answerTemp) + double.parse(answer));
          } else if (operator == "-") {
            value = (double.parse(answerTemp) - double.parse(answer));
          } else if (operator == "×") {
            value = (double.parse(answerTemp) * double.parse(answer));
          } else if (operator == "÷") {
            value = (double.parse(answerTemp) / double.parse(answer));
          }

          if (!decimalMode) {
            answer = value.toInt().toString();
          } else {
            answer = value.toString();
          }

          calculateMode = false;
          operator = "";
          answerTemp = "";
          inputFull = "";
        }
      },
    );
  }

  void addOperatorToAnswer(String op) {
    setState(() {
      if (answer != "0" && !calculateMode) {
        calculateMode = true;
        answerTemp = answer;
        inputFull += operator + " " + answerTemp;
        operator = op;
        answer = "0";
      } else if (calculateMode) {
        if (answer.isNotEmpty) {
          calculate();
          answerTemp = answer;
          inputFull = "";
          operator = "";
        } else {
          operator = op;
        }
      }
    });
  }

  void addDotToAnswer() {
    setState(() {
      if (!answer.contains(".")) {
        answer = answer + ".";
      }
    });
  }

  void addNumberToAnswer(int number) {
    setState(() {
      if (number == 0 && answer == "0") {
        // Not do anything.
      } else if (number != 0 && answer == "0") {
        answer = number.toString();
      } else {
        answer += number.toString();
      }
    });
  }

  void removeAnswerLast() {
    if (answer == "0") {
      // Not do anything.
    } else {
      setState(() {
        if (answer.length > 1) {
          answer = answer.substring(0, answer.length - 1);
          if (answer.length == 1 && (answer == "." || answer == "-")) {
            answer = "0";
          }
        } else {
          answer = "0";
        }
      });
    }
  }

  Widget NumberButton(String str,
      {required Function() onTap, bool numberButton = true}) {
    Widget widget;
    if (numberButton) {
      widget = Container(
        margin: const EdgeInsets.all(1),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.blue,
            child: Container(
              height: 70,
              child: Center(
                child: Text(
                  str,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      widget = Container(
        margin: const EdgeInsets.all(1),
        child: Material(
          color: Color.fromARGB(255, 232, 240, 242),
          child: InkWell(
            onTap: onTap,
            splashColor: Color.fromARGB(255, 83, 142, 191),
            child: Container(
              height: 70,
              child: Center(
                child: Text(
                  str,
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Expanded(child: widget);
  }
}
