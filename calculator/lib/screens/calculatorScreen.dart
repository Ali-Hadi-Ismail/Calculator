import 'package:calculator/classes/buttons.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.red,
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
          GridView.count(
            childAspectRatio: 1.05,
            crossAxisCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CalculatorButton("pie", () {}, "se"),
              CalculatorButton("ruler", () {}, "se"),
              CalculatorButton("restart", () {}, "se"),
              CalculatorButton("back", () {}, "se"),
              CalculatorButton("C", () {}, "se"),
              CalculatorButton("+/-", () {}, "se"),
              CalculatorButton("%", () {}, "op"),
              CalculatorButton("/", () {}, "op"),
              CalculatorButton("7", () {}, "nu"),
              CalculatorButton("8", () {}, "nu"),
              CalculatorButton("9", () {}, "nu"),
              CalculatorButton("*", () {}, "nu"),
              CalculatorButton("4", () {}, "nu"),
              CalculatorButton("5", () {}, "nu"),
              CalculatorButton("6", () {}, "nu"),
              CalculatorButton("-", () {}, "op"),
              CalculatorButton("1", () {}, "nu"),
              CalculatorButton("2", () {}, "nu"),
              CalculatorButton("3", () {}, "nu"),
              CalculatorButton("+", () {}, "op"),
              CalculatorButton("( )", () {}, "nu"),
              CalculatorButton("0", () {}, "nu"),
              CalculatorButton(".", () {}, "nu"),
              CalculatorButton("=", () {}, "eq"),
            ],
          )
        ],
      ),
    );
  }
}
// declare enum & use it
