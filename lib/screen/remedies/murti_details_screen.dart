import 'package:flutter/material.dart';
import 'package:my_astro/widgets/simple_text_fill_button.dart';

class MurtiDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subTitle1;
  final String subTitle2;
  const MurtiDetailsScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
  });

  @override
  State<MurtiDetailsScreen> createState() => _MurtiDetailsScreenState();
}

class _MurtiDetailsScreenState extends State<MurtiDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      /// --- app bar --- ///
      appBar: AppBar(
        title: Text("Product details"),
        actions: [
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 12),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1.5, color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  Icon(Icons.share, size: 16),
                  SizedBox(width: 6),
                  Text(
                    "Share",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 12),
        ],
      ),

      /// --- BODY --- ///
      body: Stack(
        children: [
          Column(
            children: [
              /// Image
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 5,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: Hero(
                      tag: widget.title,
                      child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 27,
                      ),
                    ),

                    /// sun title
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _chipData(
                          subTitle: widget.subTitle1,
                          subTitleColor: Colors.pinkAccent,
                        ),
                        _chipData(
                          subTitle: widget.subTitle2,
                          subTitleColor: Colors.pinkAccent.shade100,
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    /// rating & review
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            SizedBox(
                              height: 21,
                              child: VerticalDivider(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 6),
                        Text(
                          "1337 reviews",
                          style: TextStyle(
                            color: Colors.black,

                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: SizedBox(
              height: size.height * 0.1,
              width: size.width,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// add to cart button
                    SimpleTextFillButton(
                      btnText: "Add to Cart",
                      onPressed: () {},
                      backGroundColor: Colors.black, foregroundColor: Colors.white,
                    ),
                    SimpleTextFillButton(
                      btnText: "Buy Now",
                      onPressed: () {},
                      backGroundColor: Colors.pinkAccent, foregroundColor: Colors.white,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chipData({required String subTitle, required Color subTitleColor}) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: subTitleColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
          child: Row(
            children: [
              Icon(Icons.verified_user_rounded, color: Colors.white, size: 18),
              SizedBox(width: 4),
              Text(subTitle, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
