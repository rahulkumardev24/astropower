import 'package:flutter/material.dart';
import 'package:my_astro/helper/custom_text_style.dart';

class RecommendedCallCard extends StatefulWidget {
  final String image;
  final String name;
  final String newPrice;
  const RecommendedCallCard({
    super.key,
    required this.image,
    required this.name,
    required this.newPrice,
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// profile part

              Container(
                height: mqData.height * 0.1,
                width: mqData.height * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Color(0xfff0df1f),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Row(
                children: [

                  Icon(Icons.verified),

                  Text(
                    widget.name,
                    style: myTextStyle18(fontWeight: FontWeight.w300),
                  ),
                ],
              ) ,
              /// rating star
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                        size: 21,
                      ),
                      Text(
                        "4.5",
                        style: myTextStyle18(
                          fontWeight: FontWeight.bold,
                          textColor: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    "8 Years exp.",
                    style: myTextStyle15(
                      textColor: Colors.grey.shade600,
                    ),
                  ),

                ],
              ),

              /// new price
              Text(
                widget.newPrice,
                style: myTextStyle18(
                  textColor: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),


              /// chat button
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    side: BorderSide(
                      width: 1.5,
                      color: Colors.green.shade700

                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    child: Text(
                      "Call",
                      style: myTextStyle18(
                        fontWeight: FontWeight.w200,
                        textColor:
                         Colors.green.shade700

                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
