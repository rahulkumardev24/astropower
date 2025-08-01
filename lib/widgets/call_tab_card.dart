import 'package:flutter/material.dart';
import 'package:my_astro/helper/custom_text_style.dart';

class CallTabCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final bool isSelected;
  final VoidCallback onTap;
  const CallTabCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: isSelected ? Color(0xffff9ecb) : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Icon(icon, color: iconColor),
                SizedBox(width: 4),
                Text(title, style: myTextStyle14(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
