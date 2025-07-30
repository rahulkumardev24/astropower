import 'package:flutter/material.dart';

@immutable
class MyTextButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  final double textSize;
  final Color? backGroundColor;
  const MyTextButton({
    super.key,
    required this.btnText,
    required this.onPressed,
    this.textSize = 18,
    this.backGroundColor = Colors.pinkAccent,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: backGroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          btnText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
