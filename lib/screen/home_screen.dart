import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_astro/helper/my_dialog.dart';
import 'package:my_astro/screen/payment/add_money_screen.dart';
import 'package:my_astro/widgets/app_drawer.dart';
import 'package:my_astro/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // app bar
        /// --- app bar --- ///
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: _appBar(size),
        ),
        drawer: AppDrawer(),

        /// ---- body ---- ////
        body: Column(
          children: [
            /// here we call search box
            SearchBox(),
          ],
        ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 27.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FloatingActionButton.extended(
                  elevation: 0,
                  backgroundColor: Color(0xff001080),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                  onPressed: () {},
                  label: Text(
                    "Chat with Astrologer",
                    style: TextStyle(color: Colors.white),
                  ),

                  icon: Icon(CupertinoIcons.chat_bubble, color: Colors.white),
                ),
              ),

              SizedBox(width: size.width * 0.05),

              Expanded(
                child: FloatingActionButton.extended(
                  elevation: 0,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                  label: Text(
                    "Talk to Astrologer",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(Icons.call),
                ),
              ),
            ],
          ),
        ),

        /// floating action  button
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
              child: Icon(Icons.menu, size: 27),
            ),
            const SizedBox(width: 8),

            Text(
              "Astropower",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(child: SizedBox(width: size.width)),

            /// wallet
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddMoneyScreen()),
                );
              },
              child: Icon(Icons.account_balance_wallet_outlined, size: 27),
            ),
            SizedBox(width: 12),

            /// language selection
            InkWell(
              onTap: () => MyDialog.languageDialog(context),
              child: Icon(Icons.translate_rounded, size: 27),
            ),
            SizedBox(width: 12),

            /// Notifications
            Icon(Icons.notifications, size: 27),
          ],
        ),
      ),
    );
  }
}
