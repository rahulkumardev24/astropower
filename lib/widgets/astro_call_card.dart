import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_astro/helper/custom_text_style.dart';

class AstroCallCard extends StatefulWidget {
  final String image;
  final String name;
  final String oldPrice;
  final String orders;
  final bool onlineStatus;
  final String newPrice;
  final VoidCallback onPress;
  const AstroCallCard({
    super.key,
    required this.image,
    required this.name,
    required this.oldPrice,
    required this.orders,
    required this.onlineStatus,
    required this.newPrice,
    required this.onPress,
  });

  @override
  State<AstroCallCard> createState() => _AstroChatCardState();
}

class _AstroChatCardState extends State<AstroCallCard> {
  late Size mqData = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: GestureDetector(
        onTap: widget.onPress,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                /// left part
                /// profile part
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: mqData.height * 0.1,
                            width: mqData.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Colors.pinkAccent,
                              ),
                              image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                            right: 5,
                            top: 10,
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color:
                                      widget.onlineStatus
                                          ? Colors.white
                                          : Colors.black87,
                                ),
                                color:
                                    widget.onlineStatus
                                        ? Color(0xff268e5f)
                                        : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),

                      /// rating star
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
                        "${widget.orders} session",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: "primary",
                          fontSize: 13,
                          color: Colors.grey.shade500,
                          decorationThickness: 1,
                          decorationColor: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),

                /// right part
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: myTextStyle18(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Tarot,Life Coach",
                                style: myTextStyle15(
                                  textColor: Colors.grey.shade600,
                                ),
                              ),
                              Text(
                                "8 Years exp.",
                                style: myTextStyle15(
                                  textColor: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  widget.newPrice == "Free"
                                      ? SizedBox()
                                      : Icon(
                                        FontAwesomeIcons.indianRupeeSign,
                                        size: 18,
                                        color: Color(0xff268e5f),
                                      ),

                                  /// new price
                                  Text(
                                    widget.newPrice,
                                    style: myTextStyle18(
                                      textColor: Color(0xff268e5f),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),

                                  /// old price
                                  Text(
                                    widget.oldPrice,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade500,
                                      fontFamily: "primary",
                                      decorationColor: Colors.grey.shade600,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                ],
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
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    side: BorderSide(
                                      width: 2,
                                      color:
                                          widget.onlineStatus
                                              ? Color(0xff268e5f)
                                              : Colors.grey.shade500,
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
                                            widget.onlineStatus
                                                ? Color(0xff268e5f)
                                                : Colors.grey.shade500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
