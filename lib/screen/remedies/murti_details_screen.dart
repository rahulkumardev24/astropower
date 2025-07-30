import 'package:flutter/material.dart';
import 'package:my_astro/constant/app_constant.dart';
import 'package:my_astro/screen/payment/select_payment_method_screen.dart';
import 'package:my_astro/widgets/product_info_card.dart';
import 'package:my_astro/widgets/simple_text_fill_button.dart';

class MurtiDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subTitle1;
  final String subTitle2;
  final String description;
  final String price;
  const MurtiDetailsScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
    required this.description,
    required this.price,
  });

  @override
  State<MurtiDetailsScreen> createState() => _MurtiDetailsScreenState();
}

class _MurtiDetailsScreenState extends State<MurtiDetailsScreen> {
  int? _openPanelIndex;
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
          SingleChildScrollView(
            child: Column(
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
                      SizedBox(height: size.height * 0.02),

                      /// OFFER Ends Time
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent.shade100.withValues(
                            alpha: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "lib/assets/icon/hourglass.png",
                                height: size.width * 0.06,
                              ),
                              Text(
                                "OFFER ends in 10h : 14m : 00s ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                              Image.asset(
                                "lib/assets/icon/hourglass.png",
                                height: size.width * 0.06,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),

                      /// product information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ProductInfoCard(
                              title: "FREE",
                              imagePath: "lib/assets/icon/fast-delivery.png",
                              subTitle: "DELIVERY",
                            ),
                          ),
                          SizedBox(width: size.width * 0.015),
                          Expanded(
                            child: ProductInfoCard(
                              title: "7 DAYS",
                              imagePath: "lib/assets/icon/time.png",
                              subTitle: "RETURN",
                            ),
                          ),
                          SizedBox(width: size.width * 0.015),
                          Expanded(
                            child: ProductInfoCard(
                              title: "100%",
                              imagePath: "lib/assets/icon/verify.png",
                              subTitle: "AUTHENTIC",
                            ),
                          ),
                          SizedBox(width: size.width * 0.015),
                          Expanded(
                            child: ProductInfoCard(
                              title: "ASTROPOWER",
                              imagePath: "lib/assets/image/newlogo.png",
                              subTitle: "VERIFIED",
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * 0.01),

                      /// descriptions
                      Text(
                        widget.description,
                        style: TextStyle(color: Colors.black38),
                      ),

                      SizedBox(height: size.height * 0.02),

                      /// feq Questions
                      SizedBox(
                        height: size.height * 0.6,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: AppConstant.faqQuestin.length,
                          itemBuilder: (context, index) {
                            final question = AppConstant.faqQuestin[index];

                            /// Expansion Tile
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.black38,
                                  ),
                                ),
                                child: ExpansionTile(
                                  childrenPadding: EdgeInsets.all(0),
                                  collapsedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  tilePadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    side: BorderSide.none,
                                  ),

                                  title: Text(question['title']!),
                                  children: [
                                    Divider(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(question['content']!),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: size.height * 0.15),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// --- Add to cart section --- ///
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        /// price
                        Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18),
                            Text(
                              widget.price,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        Text(
                          "₹${int.parse(widget.price) * 2}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.black45,
                            decorationThickness: 2,
                          ),
                        ),

                        SizedBox(width: 8),
                        Text(
                          "50% off",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text("(Incl. Taxes)"),
                      ],
                    ),

                    SizedBox(height: 4),

                    /// buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// add to cart button
                        Expanded(
                          child: SimpleTextFillButton(
                            btnText: "Add to Cart",
                            onPressed: () {},
                            backGroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: size.width * 0.15),
                        Expanded(
                          child: SimpleTextFillButton(
                            btnText: "Buy Now",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => SelectPaymentMethodScreen(
                                        amount: int.parse(widget.price),
                                        dialogTitle: '50% off on this product',
                                        cashBackAmount: '',
                                      ),
                                ),
                              );
                            },
                            backGroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
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
