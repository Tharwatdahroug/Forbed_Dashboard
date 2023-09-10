import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final double height;
  final double width;
  final double borderRadius;
  final Color colors;
  final Color colorwrite;

  MyButton(
      {required this.name,
      required this.onPressed,
      required this.colors,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.colorwrite});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        child: Text(
          name,
          style: TextStyle(color: colorwrite, fontSize: 20),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colors),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              // side: BorderSide(color: Colors.red)
            ))),
        onPressed: onPressed,
      ),
    );
  }
}
