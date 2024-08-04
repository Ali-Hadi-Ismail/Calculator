import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String value;
  final void Function() onPressed;
  final String isNumber;
  CalculatorButton(
    this.value,
    this.onPressed,
    this.isNumber,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10), // Margin around the button
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          value,
          style: TextStyle(fontSize: 14), // Text size
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Button radius
          ),
          // Button color
        ),
      ),
    );
  }
}
