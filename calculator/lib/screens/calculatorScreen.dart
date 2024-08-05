import 'dart:math';

import 'package:calculator/classes/buttons.dart';
import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';

class Calculatorscreen extends StatefulWidget {
  const Calculatorscreen({super.key});

  @override
  State<Calculatorscreen> createState() => _CalculatorscreenState();
}

class _CalculatorscreenState extends State<Calculatorscreen> {
  String result = "";

  @override
  void initState() {
    // TODO: implement initState
    result = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: Text(
                overflow: TextOverflow.ellipsis,
                result,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Color.fromARGB(129, 191, 191, 191),
            ),
          ),
          GridView.count(
            childAspectRatio: 1.05,
            crossAxisCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CalculatorButton("π", () {
                addCharToString("π");
              }, "se"),
              CalculatorButton("(", () {
                addCharToString("(");
              }, "se"),
              CalculatorButton(")", () {
                addCharToString(")");
              }, "se"),
              CalculatorButton(
                "back",
                () {
                  backButton();
                },
                "se",
                myIcon: Icons.backspace_outlined,
              ),
              CalculatorButton("C", () {
                setState(() {
                  result = "0";
                });
              }, "se"),
              CalculatorButton("+/-", () {
                negate();
              }, "se"),
              CalculatorButton("%", () {
                addCharToString("%");
              }, "se"),
              CalculatorButton("/", () {
                addCharToString('/', type: "op");
              }, "op"),
              // number 7
              CalculatorButton("7", () {
                setState(() {
                  result += "7";
                });
              }, "nu"),
              // number 8
              CalculatorButton("8", () {
                addCharToString("8");
              }, "nu"),
              // number 9
              CalculatorButton("9", () {
                addCharToString("9");
              }, "nu"),
              // operator 9
              CalculatorButton("*", () {
                addCharToString("*", type: "op");
              }, "op"),
              // number 4
              CalculatorButton("4", () {
                addCharToString("4");
              }, "nu"),
              // number 5
              CalculatorButton("5", () {
                addCharToString("5");
              }, "nu"),
              // number 6
              CalculatorButton("6", () {
                addCharToString("6");
              }, "nu"),
              // number -
              CalculatorButton("-", () {
                addCharToString("-", type: "op");
              }, "op"),
              // number 1
              CalculatorButton("1", () {
                addCharToString("1");
              }, "nu"),
              // number 2
              CalculatorButton("2", () {
                addCharToString("2");
              }, "nu"),
              // number 3
              CalculatorButton("3", () {
                addCharToString("3");
              }, "nu"),
              CalculatorButton("+", () {
                addCharToString("+", type: "op");
              }, "op"),
              CalculatorButton("^", () {
                addCharToString("^");
              }, "se"),
              // number 0
              CalculatorButton("0", () {
                addCharToString("0");
              }, "nu"),
              CalculatorButton(".", () {
                addCharToString(".");
              }, "se"),
              CalculatorButton("=", () {
                // Evaluate the expression
                equalEvaluation();
              }, "eq"),
            ],
          )
        ],
      ),
    );
  }

  void negate() {
    if (result[0] == "-") {
      setState(() {
        result = result.substring(1);
      });
    } else {
      String s = "";
      s += "-";
      s += result;
      setState(() {
        result = s;
      });
    }
  }

  void addCharToString(String text, {type}) {
    if (result == "0" || result == "Error" || result == "") {
      setState(() {
        result = "";
        result += text;
      });
    } else if ((result[result.length - 1] == '/' ||
            result[result.length - 1] == '*' ||
            result[result.length - 1] == '-' ||
            result[result.length - 1] == '+') &&
        type == "op") {
      String s = result.substring(0, result.length - 1);
      setState(() {
        result = s + text;
      });
    } else {
      setState(() {
        result += text;
      });
    }
  }

  void backButton() {
    setState(() {
      result = result.substring(0, result.length - 1);
    });
  }

  void equalEvaluation() {
    if (result.contains("π")) {
      result = result.replaceAll("π", pi.toString());
    }
    try {
      Expression exp = Expression(result);
      String s = exp.eval()!.toStringAsFixed(2);
      result = s;
      if (result.contains(".")) {
        while (result[result.length - 1] == '0') {
          result = result.substring(0, result.length - 1);
        }
        if (result[result.length - 1] == ".") {
          result = result.substring(0, result.length - 1);
        }
        setState(() {
          result = result;
        });
      }
    } catch (e) {
      setState(() {
        result = 'Error';
      });
    }
  }
}
