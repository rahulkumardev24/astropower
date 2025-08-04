import 'package:flutter/material.dart';
import 'package:my_astro/helper/custom_text_style.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;
  final String reply;
  final int rating;

  const ReviewCard({
    super.key,
    required this.name,
    required this.review,
    required this.reply,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Name and 3-dot menu
            Row(
              children: [
                Image.asset("lib/assets/icon/avatar.png", height: 40),
                SizedBox(width: 12),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        name,
                        style: myTextStyle16(fontWeight: FontWeight.w100),
                      ),
                      Icon(Icons.more_vert_sharp, color: Colors.grey.shade700),
                    ],
                  ),
                ),

                /// name
              ],
            ),

            /// Stars
            Row(
              children: List.generate(
                5,
                (i) => Icon(
                  Icons.star,
                  color: i < rating ? Colors.amber : Colors.grey.shade300,
                  size: 18,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// Review text
            Text(review, style: myTextStyle12(textColor: Colors.grey.shade600)),

            const SizedBox(height: 12),

            /// Reply section
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Laliteshwar", style: myTextStyle12()),
                  Text(
                    reply,
                    style: myTextStyle12(textColor: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
