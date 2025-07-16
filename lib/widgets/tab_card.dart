import 'package:flutter/material.dart';

class TabCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final bool isSelected;
  final VoidCallback onTap;
  const TabCard({
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
            border: Border.all(
              width: 1,
              color: isSelected ? Color(0xfff0df1f) : Colors.white,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Icon(icon, color: iconColor),
                SizedBox(width: 4),
                Text(title , style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
