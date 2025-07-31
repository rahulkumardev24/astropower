import 'package:flutter/material.dart';
import 'package:my_astro/helper/custom_text_style.dart';

class SimpleTextFillButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  final Color backGroundColor;
  final Color foregroundColor;
  final double verticalPadding;
  final Color textColor ;

  const SimpleTextFillButton({
    super.key,
    required this.btnText,
    required this.onPressed,
    required this.backGroundColor,
    required this.foregroundColor,
    this.verticalPadding = 0.0,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      ),

      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Text(btnText, style: myTextStyle18(textColor:textColor )),
      ),
    );
  }
}
