import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_astro/constant/app_constant.dart';
import 'package:my_astro/helper/custom_text_style.dart';
import '../widgets/review_card.dart';

class AstrologerProfileScreen extends StatefulWidget {
  final String imagePath;
  final String name;
  final String language;
  final String experience;
  final String specialist;
  final String price;
  const AstrologerProfileScreen({
    super.key,
    required this.imagePath,
    required this.name,
    required this.language,
    required this.experience,
    required this.specialist,
    required this.price,
  });

  @override
  State<AstrologerProfileScreen> createState() =>
      _AstrologerProfileScreenState();
}

class _AstrologerProfileScreenState extends State<AstrologerProfileScreen> {
  final message =
      "Meet Laliteshwar, a compassionate Vedic Astrologer in India, committed to helping clients with his spirit-guided readings. Upholding Astrology ethics, he works towards bringing stability to lives. Laliteshwar offers clarity and profound insights, empowering clients with spiritual knowledge about surrounding energies. Services encompass Marriage Consultation, Career and Business, Love and Relationship, Wealth and Property, with easy and effective remedies";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      /// app bar
      appBar: AppBar(
        title: Text(
          "Profile",
          style: myTextStyle18(
            fontWeight: FontWeight.w100,
            textColor: Colors.white,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2, color: Colors.white70),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  Image.asset(
                    "lib/assets/icon/whatsapp.png",
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Share",
                    style: myTextStyle16(
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      backgroundColor: Colors.white,

      /// body
      body: Column(
        children: [
          /// Scrollable content (profile section)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// profile sections
                  _userCard(
                    size: size,
                    imagePath: widget.imagePath,
                    name: widget.name,
                    specialist: widget.specialist,
                    language: widget.language,
                    experience: widget.experience,
                    price: widget.price,
                  ),
                  SizedBox(height: 16),
                  _expendableText(context: context, message: message),
                  SizedBox(height: 16),

                  /// user view
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("User Reviews", style: myTextStyle18()),
                      GestureDetector(
                        onTap: () {
                          showReviewBottomSheet(context: context, size: size);
                        },
                        child: Text(
                          "View All",
                          style: myTextStyle14(textColor: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: AppConstant.reviewData.length,
                    itemBuilder: (context, index) {
                      final revData = AppConstant.reviewData[index];
                      return ReviewCard(
                        name: revData['name'],
                        review: revData['review'],
                        reply: revData['reply'],
                        rating: revData['rating'],
                      );
                    },
                  ),

                  GestureDetector(
                    onTap: () {
                      showReviewBottomSheet(context: context, size: size);
                    },
                    child: Text(
                      "See all reviews",
                      style: myTextStyle16(
                        fontWeight: FontWeight.bold,
                        textColor: Color(0xff268e5f),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  _callCard(
                    title: "Chat with Assistant",
                    icon: Icons.support_agent_rounded,
                  ),
                  _callCard(title: "Video Call", icon: CupertinoIcons.videocam),
                  SizedBox(height: 12),

                  /// send gift section
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.gift,
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Gift to Assistant",
                                    style: myTextStyle18(
                                      textColor: Colors.grey.shade900,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.info_outline_rounded,
                                    color: Colors.grey.shade500,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.currency_rupee_rounded, size: 18),
                                  Text("14", style: myTextStyle18()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          height: size.height * 0.35,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: AppConstant.gift.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                ),
                            itemBuilder: (context, index) {
                              final giftData = AppConstant.gift[index];
                              return _giftCard(
                                title: giftData['giftName'],
                                imagePath: giftData['imagePath'],
                                price: giftData['price'],
                                size: size,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Fixed bottom call buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CupertinoIcons.chat_bubble_2_fill,
                          color: Color(0xff268e5f),
                        ),

                        Expanded(
                          child: Center(
                            child: Text(
                              "Chat",
                              style: myTextStyle14(
                                textColor: Color(0xff268e5f),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.phone_fill,
                          color: Color(0xff268e5f),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Call",
                              style: myTextStyle14(
                                textColor: Color(0xff268e5f),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  /// widgets
  Widget _userCard({
    required Size size,
    required String imagePath,
    required String name,
    required String specialist,
    required String language,
    required String experience,
    required String price,
  }) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                /// left -- profile, star, orders
                Column(
                  children: [
                    /// profile
                    Container(
                      height: size.width * 0.18,
                      width: size.width * 0.18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.pinkAccent),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    /// star
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.grey.shade700, size: 16),
                        Icon(Icons.star, color: Colors.grey.shade700, size: 16),
                        Icon(Icons.star, color: Colors.grey.shade700, size: 16),
                        Icon(Icons.star, color: Colors.grey.shade700, size: 16),
                        Icon(Icons.star, color: Colors.grey.shade700, size: 16),
                      ],
                    ),

                    /// orders
                    Text(
                      "20421 orders",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade700,
                        fontFamily: "primary",
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12),

                /// right
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// -- name, verified, follow
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              /// name
                              Text(name, style: myTextStyle16()),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Icon(
                                  Icons.verified,
                                  size: 18,
                                  color: Colors.green,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 3,
                                  ),
                                  child: Text(
                                    "Follow",
                                    style: myTextStyle12(
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Icon(Icons.more_vert_rounded),
                        ],
                      ),
                      Text(
                        specialist,
                        style: myTextStyle12(textColor: Colors.grey.shade600),
                      ),

                      /// language
                      Text(
                        language,
                        style: myTextStyle14(textColor: Colors.grey.shade600),
                      ),

                      /// exp
                      Text(
                        experience,
                        style: myTextStyle12(textColor: Colors.grey.shade600),
                      ),

                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.indianRupeeSign,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: price,
                                  style: myTextStyle14(
                                    fontWeight: FontWeight.bold,
                                    textColor: Colors.grey.shade700,
                                  ),
                                ),
                                TextSpan(
                                  text: "/min",
                                  style: myTextStyle14(
                                    textColor: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.chat_bubble_2,
                      color: Colors.grey.shade700,
                    ),
                    SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "45K ",
                            style: myTextStyle16(
                              fontWeight: FontWeight.bold,
                              textColor: Colors.grey.shade700,
                            ),
                          ),
                          TextSpan(
                            text: "mins",
                            style: myTextStyle16(
                              textColor: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 21,
                  child: VerticalDivider(
                    thickness: 2,
                    color: Colors.grey.shade300,
                  ),
                ),

                Row(
                  children: [
                    Icon(
                      CupertinoIcons.phone_fill,
                      color: Colors.grey.shade700,
                    ),
                    SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "45K ",
                            style: myTextStyle16(
                              fontWeight: FontWeight.bold,
                              textColor: Colors.grey.shade700,
                            ),
                          ),
                          TextSpan(
                            text: "mins",
                            style: myTextStyle16(
                              textColor: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _callCard({required String title, required IconData icon}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.grey.shade600),
                SizedBox(width: 12),
                Text(
                  title,
                  style: myTextStyle16(textColor: Colors.grey.shade900),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey.shade700),
          ],
        ),
      ),
    );
  }

  Widget _expendableText({
    required BuildContext context,
    required String message,
  }) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
        child: ExpandableText(
          message,
          style: myTextStyle14(textColor: Colors.grey.shade700),
          expandText: 'show more',
          collapseText: "show less",
          maxLines: 2,
          linkColor: Colors.blue,
          animation: true,
          collapseOnTextTap: true,
          hashtagStyle: myTextStyle14(textColor: Color(0xFF30B6F9)),
        ),
      ),
    );
  }

  /// review bottom sheet
  void showReviewBottomSheet({
    required BuildContext context,
    required Size size,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: size.height * 0.8,

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 21),

                  /// navigation section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_rounded),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Rating and Reviews",
                            style: myTextStyle16(
                              textColor: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Most helpful",
                            style: myTextStyle14(
                              textColor: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.sort_rounded),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 21),

                  /// Rating sections
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: Colors.black26),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        /// left part -> star, orders
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "4.85",
                                style: myTextStyle36(
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              SizedBox(height: 8),

                              /// star
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  5,
                                  (i) => Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                  Text("7604 orders", style: myTextStyle14()),
                                ],
                              ),
                            ],
                          ),
                        ),

                        /// Right -> review
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 4,
                            ),
                            child: Column(
                              children: List.generate(5, (index) {
                                int star = 5 - index;

                                /// Custom progress values for 5, 4, 3, 2, 1 stars
                                final List<double> starProgress = [
                                  0.8,
                                  0.5,
                                  0.3,
                                  0.1,
                                  0.25,
                                ];

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          star.toString(),
                                          style: myTextStyle18(
                                            fontWeight: FontWeight.bold,
                                            textColor: Colors.grey.shade700,
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 6,
                                        child: LinearProgressIndicator(
                                          value: starProgress[index],
                                          minHeight: 12,
                                          borderRadius: BorderRadius.circular(
                                            21,
                                          ),
                                          backgroundColor: Colors.grey.shade300,
                                          color:
                                              star == 5
                                                  ? Colors.greenAccent.shade400
                                                  : star == 4
                                                  ? Colors.blue
                                                  : star == 3
                                                  ? Colors.amber
                                                  : star == 2
                                                  ? Colors.orange
                                                  : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: AppConstant.reviewData.length,
                    itemBuilder: (context, index) {
                      final revData = AppConstant.reviewData[index];
                      return ReviewCard(
                        name: revData['name'],
                        review: revData['review'],
                        reply: revData['reply'],
                        rating: revData['rating'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _giftCard({
    required String title,
    required String imagePath,
    required String price,
    required Size size,
  }) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: size.width * 0.08,
            width: size.width * 0.08,
            fit: BoxFit.cover,
          ),
          Text(title, style: myTextStyle14(textColor: Colors.grey.shade600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.currency_rupee_rounded, size: 16),
              Text(price, style: myTextStyle14(fontWeight: FontWeight.w100)),
            ],
          ),
        ],
      ),
    );
  }
}
