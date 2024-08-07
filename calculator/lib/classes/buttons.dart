import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final value;
  final void Function() onPressed;
  //type : op se nu eq
  final String type;
  final myIcon;
  CalculatorButton(this.value, this.onPressed, this.type, {this.myIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10), // Margin around the button
      child: calc_button(),
    );
  }

  ElevatedButton calc_button() {
    if (type == "nu") {
      return ElevatedButton(
        onPressed: onPressed,
        child: textOrIcon(),
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Button radius
          ),
          // Button color
        ),
      );
    } else if (type == "op" || type == "eq") {
      return ElevatedButton(
        onPressed: onPressed,
        child: textOrIcon(),
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: Color.fromARGB(193, 216, 16, 16),

          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Button radius
          ),
          // Button color
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: textOrIcon(),
        style: ElevatedButton.styleFrom(
          elevation: 2,

          foregroundColor: Color.fromARGB(255, 214, 12, 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Button radius
          ),
          // Button color
        ),
      );
    }
  }

  Widget textOrIcon() {
    if (myIcon == null) {
      return Text(
        value,
        style: GoogleFonts.sarala(fontSize: 22),
      );
    } else {
      return Icon(myIcon);
    }
  }
}
