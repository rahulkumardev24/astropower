import 'package:flutter/material.dart';

class AstroChatCard extends StatefulWidget {
  final String image;
  final String name;
  final String language;
  final String oldPrice;
  final String orders;
  const AstroChatCard({
    super.key,
    required this.image,
    required this.name,
    required this.oldPrice,
    required this.orders,
    required this.language,
  });

  @override
  State<AstroChatCard> createState() => _AstroChatCardState();
}

class _AstroChatCardState extends State<AstroChatCard> {
  late Size mqData = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
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
                  children: [
                    Container(
                      height: mqData.height * 0.1,
                      width: mqData.height * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Color(0xfff0df1f)),
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    /// rating star
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.black45, size: 18),
                        Icon(Icons.star, color: Colors.black45, size: 18),
                        Icon(Icons.star, color: Colors.black45, size: 18),
                        Icon(Icons.star, color: Colors.black45, size: 18),
                        Icon(Icons.star, color: Colors.black45, size: 18),
                      ],
                    ),

                    Text(
                      "${widget.orders} orders",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ),

              /// right part
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// name
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),

                            /// verify icon
                            Icon(
                              Icons.verified_rounded,
                              color: Color(0xff88c445),
                              size: 21,
                            ),
                          ],
                        ),
                        Text(
                          "Tarot,Life Coach",
                          style: TextStyle(color: Colors.black45, fontSize: 14),
                        ),

                        /// language
                        Text(
                          widget.language,
                          style: TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                        Text(
                          "Exp- 3 Years",
                          style: TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(
                              "Free",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),

                            Text(
                              widget.oldPrice,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                                fontFamily: "primary",
                                decorationColor: Colors.black45,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// chat button
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(width: 2, color: Color(0xff619f83)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: Text(
                            "Chat",
                            style: TextStyle(
                              color: Color(0xff619f83),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
