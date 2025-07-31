import 'package:flutter/material.dart';
import 'package:my_astro/screen/drawer/setting_screen.dart';
import '../helper/custom_text_style.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<AppDrawer> {
  late Size mqData = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: mqData.width * 0.85,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(height: 12),

            /// profile part
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          "lib/assets/image/profile.png",
                          height: mqData.height * 0.08,
                          width: mqData.height * 0.08,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Rahul",
                              style: myTextStyle15(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.edit_rounded, size: 15),
                          ],
                        ),
                        Text("+91-7970989057", style: myTextStyle15()),
                      ],
                    ),
                  ],
                ),

                /// Close button
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close_rounded, size: 32),
                ),
              ],
            ),

            SizedBox(height: mqData.height * 0.01),

            /// list view
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  /// list part
                  _drawerItem(
                    title: 'Home',
                    icon: Icons.home_filled,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'Book a Pooja',
                    icon: Icons.grass_outlined,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'Customer Support chat',
                    icon: Icons.support_agent_rounded,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'Wallet Transactions',
                    icon: Icons.account_balance_wallet_outlined,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'Redeem Gift Card',
                    icon: Icons.card_giftcard_rounded,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'Order History',
                    icon: Icons.history,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'AstroRemedy',
                    icon: Icons.store_rounded,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'Astrology Blog',
                    icon: Icons.book,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'Chat with Astrologers',
                    icon: Icons.chat_bubble_outline_rounded,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'AstroRemedy',
                    icon: Icons.store_rounded,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'My Following',
                    icon: Icons.person_search_rounded,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'Free Service',
                    icon: Icons.local_offer_outlined,
                    onTap: () {},
                  ),
                  _drawerItem(
                    title: 'Setting',
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingScreen()));
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("Also available on", style: myTextStyle15())],
              ),
            ),
            SizedBox(height: 11),

            /// social media icons
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  _socialMedia(imagePath: "lib/assets/icon/apple.png"),
                  _socialMedia(imagePath: "lib/assets/icon/globe.png"),
                  _socialMedia(imagePath: "lib/assets/icon/youtube (3).png"),
                  _socialMedia(imagePath: "lib/assets/icon/facebook (3).png"),
                  _socialMedia(imagePath: "lib/assets/icon/instagram (4).png"),
                  _socialMedia(imagePath: "lib/assets/icon/linkedin (5).png"),
                ],
              ),
            ),

            SizedBox(height: 11),

            /// version
            Text(
              "Version 1.1.359",
              style: myTextStyle15(
                textColor: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 11),
          ],
        ),
      ),
    );
  }

  /// Widgets
  Widget _drawerItem({
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return ListTile(
      visualDensity: VisualDensity(vertical: -4),
      title: Text(title, style: myTextStyle15(textColor: Colors.grey.shade600)),
      leading: Icon(icon , color: Colors.grey.shade600,),
      onTap: onTap,
    );
  }

  Widget _socialMedia({required String imagePath}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Image.asset(
        imagePath,
        height: mqData.height * 0.035,
        width: mqData.height * 0.035,
      ),
    );
  }
}
