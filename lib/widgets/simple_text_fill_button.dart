import 'package:flutter/material.dart';

class SimpleTextFillButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  final Color backGroundColor;
  final Color foregroundColor ;

  const SimpleTextFillButton({
    super.key,
    required this.btnText,
    required this.onPressed,
    required this.backGroundColor,
    required this.foregroundColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backGroundColor ,
      foregroundColor: foregroundColor ,
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))
      ),

      onPressed: onPressed,
      child: Text(btnText),
    );
  }
}
