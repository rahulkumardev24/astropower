import 'package:flutter/material.dart';
import 'package:my_astro/helper/custom_text_style.dart';

class RecommendedCallCard extends StatefulWidget {
  final String image;
  final String name;
  final String newPrice;
  final VoidCallback onPress ;
  const RecommendedCallCard({
    super.key,
    required this.image,
    required this.name,
    required this.newPrice,
    required this.onPress
  });

  @override
  State<RecommendedCallCard> createState() => _AstroChatCardState();
}

class _AstroChatCardState extends State<RecommendedCallCard> {
  late Size mqData = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: GestureDetector(
        onTap: widget.onPress,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// profile
                Container(
                  height: mqData.height * 0.12,
                  width: mqData.height * 0.12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.grey.shade400),
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),

                /// name
                Row(
                  children: [
                    Icon(Icons.verified, color: Color(0xff268e5f)),

                    Text(
                      widget.name,
                      style: myTextStyle18(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                /// rating star
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.grey.shade600, size: 21),
                        Text(
                          "4.5",
                          style: myTextStyle18(
                            fontWeight: FontWeight.bold,
                            textColor: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18, child: VerticalDivider(thickness: 2)),

                    Text(
                      "8 Years exp.",
                      style: myTextStyle15(textColor: Colors.grey.shade600),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                /// new price
                Text(
                  "${widget.newPrice}/min",
                  style: myTextStyle16(
                    textColor: Color(0xff268e5f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),

                /// chat button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(width: 2, color: Color(0xff268e5f)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Call",
                      style: myTextStyle18(
                        fontWeight: FontWeight.w200,
                        textColor: Color(0xff268e5f),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
