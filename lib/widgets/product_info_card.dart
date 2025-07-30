import 'package:flutter/material.dart';

class ProductInfoCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;

  const ProductInfoCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.subTitle,

  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: size.width * 0.05,
              width: size.width * 0.05,
              fit: BoxFit.cover,
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              title,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              subTitle,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
