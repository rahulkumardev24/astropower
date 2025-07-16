import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_astro/constant/app_constant.dart';
import 'package:my_astro/widgets/carousel_slider.dart';
import '../widgets/astro_chat_card.dart';
import '../widgets/tab_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Size size;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatBottomSheet();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,

        /// --- app bar --- ///
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xfff0df1f),
          flexibleSpace: _appBar(size),
        ),

        backgroundColor: Colors.white,

        /// --- body --- ///
        body: Column(
          children: [
            SizedBox(height: size.height * 0.01),

            /// tab bar
            SizedBox(
              height: size.height * 0.05,
              child: ListView.builder(
                itemCount: AppConstant.tabData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final tabData = AppConstant.tabData[index];
                  return TabCard(
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

            const SizedBox(height: 10),

            /// here we call slider
            MyCarouselSlider(),

            /// tab content
            /// chat user in list view
            Expanded(
              child: ListView.builder(
                itemCount: AppConstant.chatData.length,
                itemBuilder: (context, index) {
                  final data = AppConstant.chatData[index];
                  return AstroChatCard(
                    image: data['image'],
                    name: data['name'],
                    oldPrice: data['oldPrice'],
                    orders: data["orders"],
                    language: data["language"],
                  );
                },
              ),
            ),
          ],
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
            Icon(Icons.menu, size: 27),
            const SizedBox(width: 8),
            Text(
              "Chat with Astrologer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(child: SizedBox(width: size.width)),

            /// Rupee Box
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2, color: Colors.black54),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2,
                ),
                child: Row(
                  children: [
                    Icon(Icons.currency_rupee_rounded, size: 15),
                    Text("0"),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),

            Icon(CupertinoIcons.search, size: 27),
            SizedBox(width: 12),
            Icon(Icons.filter_alt_rounded, size: 27),
          ],
        ),
      ),
    );
  }

  /// bottom Sheet
  PersistentBottomSheetController chatBottomSheet() {
    return _scaffoldKey.currentState!.showBottomSheet(
      backgroundColor: Colors.transparent,

      (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: size.height * 0.12,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border.all(width: 2, color: Color(0xfff0df1f)),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "lib/assets/image/chat_welcome.png",
                        height: size.width * 0.2,
                        width: size.width * 0.2,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Chat for FREE",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "We'll connect you with the best astrologer instantly",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),

                                /// Free chat Button
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                  color: Color(0xfff0df1f),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Free Chat"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// close button
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close, size: 16, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
