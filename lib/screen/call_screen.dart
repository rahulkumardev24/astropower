import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_astro/helper/custom_text_style.dart';
import 'package:my_astro/screen/payment/add_money_screen.dart';
import 'package:my_astro/screen/payment/select_payment_method_screen.dart';
import '../constant/app_constant.dart';
import '../widgets/app_drawer.dart';
import '../widgets/astro_call_card.dart';
import '../widgets/call_tab_card.dart';
import '../widgets/poster_carousel_slider.dart';
import '../widgets/recommended_call_card.dart';
import '../widgets/sort_filter_bottom_sheet.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey.shade200,

        /// --- app bar --- ///
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.pinkAccent,
          flexibleSpace: _appBar(size),
        ),
        drawer: AppDrawer(),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01),

              /// slider
              PosterCarouselSlider(
                height: size.height * 0.25,
                imagePaths: [
                  "lib/assets/banner/call_banner_1.jpg",
                  "lib/assets/banner/call_banner_2.jpg",
                  "lib/assets/banner/call_banner_2.jpg",
                ],
                onPressActions: [
                  () {
                    print("First poster tapped");
                  },
                  () {
                    print("Second poster tapped");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => SelectPaymentMethodScreen(
                              amount: 100,
                              dialogTitle:
                                  "Get ₹100 cashback on recharge of RS 100",
                            ),
                      ),
                    );
                  },
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => SelectPaymentMethodScreen(
                              amount: 100,
                              dialogTitle:
                                  "Get ₹100 cashback on recharge of RS 100",
                            ),
                      ),
                    );

                    print("Third poster tapped");
                  },
                ],
              ),

              SizedBox(height: size.height * 0.01),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore Insights for",
                      style: myTextStyle18(fontWeight: FontWeight.bold),
                    ),

                    /// filter icon
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => const SortFilterBottomSheet(),
                        );
                      },
                      child: Icon(Icons.filter_alt_rounded, size: 27),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),

              /// tab bar
              SizedBox(
                height: size.height * 0.05,
                child: ListView.builder(
                  itemCount: AppConstant.tabData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final tabData = AppConstant.tabData[index];
                    return CallTabCard(
                      title: tabData['title'],
                      icon: tabData['icon'],
                      iconColor: tabData['iconColor'],
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      isSelected: selectedIndex == index,
                    );
                  },
                ),
              ),

              /// tab content
              /// chat user in list view
              /// First 5 vertical cards
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AppConstant.callData.length,
                itemBuilder: (context, index) {
                  final data = AppConstant.callData[index];
                  return AstroCallCard(
                    image: data['image'],
                    name: data['name'],
                    oldPrice: data['oldPrice'],
                    orders: data["orders"],
                    onlineStatus: data["onlineStatus"] ?? false,
                    newPrice: data["newPrice"],
                  );
                },
              ),

              /// Recommended Section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended for you",
                      style: myTextStyle18(
                        fontWeight: FontWeight.bold,
                        textColor: Colors.grey.shade600,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstant.callData.length,
                  itemBuilder: (context, index) {
                    final data = AppConstant.callData[index];
                    return RecommendedCallCard(
                      image: data['image'],
                      name: data['name'],
                      newPrice: data["newPrice"],
                    );
                  },
                ),
              ),
              SizedBox(height: 21),
            ],
          ),
        ),
      ),
    );
  }

  /// --- app bar widget --- ///
  Widget _appBar(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => _scaffoldKey.currentState!.openDrawer(),
              child: Icon(Icons.menu, size: 27, color: Colors.white),
            ),
            const SizedBox(width: 8),
            Text(
              "Call with Astrologer",
              style: myTextStyle16(textColor: Colors.white),
            ),
            Expanded(child: SizedBox(width: size.width)),

            /// Rupee Box
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(width: 2, color: Colors.white60),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AddMoneyScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.currency_rupee_rounded,
                        size: 18,
                        color: Colors.white70,
                      ),
                      Text(
                        "0",
                        style: myTextStyle16(textColor: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),

            Icon(CupertinoIcons.search, size: 27, color: Colors.white),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
