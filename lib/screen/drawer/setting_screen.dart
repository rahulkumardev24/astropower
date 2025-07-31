import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:my_astro/helper/custom_text_style.dart';
import 'package:my_astro/helper/my_dialog.dart';
import 'package:my_astro/widgets/simple_text_fill_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final String selectedLanguage = "English";
  final _themeController = ValueNotifier<bool>(false);
  final _privacyController = ValueNotifier<bool>(true);
  final _astroMallChatController = ValueNotifier<bool>(true);
  final _liveEventsController = ValueNotifier<bool>(true);

  void _showPrivacyBottomSheet(BuildContext context, Size size) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(21),
          topRight: Radius.circular(21),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/image/3d-lock.png",
                    height: size.height * 0.03,
                    width: size.height * 0.03,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Manage Your Privacy!",
                    style: myTextStyle21(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(height: 21),

              /// Privacy Items
              _bottomPrivacyItem(
                imagePath: 'lib/assets/image/chat (6).png',
                title:
                    'Restrict astrologers from accessing your chat after the chat ends',
                size: size,
              ),
              const SizedBox(height: 16),
              _bottomPrivacyItem(
                imagePath: 'lib/assets/image/download (1).png',
                title:
                    'Restrict astrologers from downloading the images you shared',
                size: size,
              ),
              const SizedBox(height: 16),
              _bottomPrivacyItem(
                imagePath: 'lib/assets/image/qr-code.png',
                title:
                    'Restrict astrologers from taking screenshots of your chat',
                size: size,
              ),
              const SizedBox(height: 16),
              _bottomPrivacyItem(
                imagePath: 'lib/assets/image/mobile.png',
                title:
                    'Restrict astrologers from accessing your call recording',
                size: size,
              ),
              const SizedBox(height: 24),

              /// Bottom Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SimpleTextFillButton(
                      btnText: "SKIP",
                      onPressed: () => Navigator.pop(context),
                      backGroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  SizedBox(width: size.width * 0.1),
                  Expanded(
                    child: SimpleTextFillButton(
                      btnText: "SUBMIT",
                      onPressed: () => Navigator.pop(context),
                      backGroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 21),
            ],
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (!await canLaunchUrl(uri)) {
        throw 'Could not launch $url';
      }
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Could not open the link: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      /// --- Appbar --- ///
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          style: myTextStyle21(
            fontWeight: FontWeight.bold,
            textColor: Colors.grey.shade600,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notifications",
                      style: myTextStyle18(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Astromall chat",
                          style: myTextStyle12(
                            textColor: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 21.0),
                          child: AdvancedSwitch(
                            controller: _astroMallChatController,
                            activeColor: Colors.pinkAccent,
                            inactiveColor: Colors.grey.shade200,
                            initialValue: true,
                            borderRadius: BorderRadius.all(
                              const Radius.circular(15),
                            ),
                            width: 40.0,
                            height: 20.0,
                            enabled: true,
                            disabledOpacity: 0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    /// Live Events
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Live Events",
                          style: myTextStyle12(
                            textColor: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 21.0),
                          child: AdvancedSwitch(
                            controller: _liveEventsController,
                            activeColor: Colors.pinkAccent,
                            inactiveColor: Colors.grey.shade200,
                            initialValue: true,
                            borderRadius: BorderRadius.all(
                              const Radius.circular(15),
                            ),
                            width: 40.0,
                            height: 20.0,
                            enabled: true,
                            disabledOpacity: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// privacy
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy',
                      style: myTextStyle18(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Show my name in reviews section of astrologer\'s profile',
                            style: myTextStyle12(
                              textColor: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AdvancedSwitch(
                          controller: _privacyController,
                          activeColor: Colors.pinkAccent,
                          inactiveColor: Colors.grey.shade200,
                          initialValue: true,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(15),
                          ),
                          width: 40.0,
                          height: 20.0,
                          onChanged: (value) {
                            setState(() {
                              _privacyController.value = value;
                            });
                          },

                          enabled: true,
                          disabledOpacity: 0.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// Dark mode
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Dark Mode",
                          style: myTextStyle15(
                            fontWeight: FontWeight.bold,
                            textColor: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AdvancedSwitch(
                          controller: _themeController,
                          activeColor: Colors.pinkAccent,
                          inactiveColor: Colors.grey.shade200,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(15),
                          ),
                          width: 40.0,
                          height: 20.0,
                          enabled: true,
                          disabledOpacity: 0.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// Change Your Language
            GestureDetector(
              onTap: () {
                MyDialog.languageDialog(context);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Change App Language",
                        style: myTextStyle15(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedLanguage,
                                  style: myTextStyle15(
                                    textColor: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// other setting
            _otherSetting(
              title: "Manage Your Privacy!",
              onTap: () {
                _showPrivacyBottomSheet(context, MediaQuery.of(context).size);
              },
            ),
            _otherSetting(title: "Notifications", onTap: () {}),
            _otherSetting(
              title: "Terms and Conditions",
              onTap: () => _launchUrl("https://astropower.org/privacy-policy"),
            ),
            _otherSetting(
              title: "Privacy Policy",
              onTap: () => _launchUrl("https://astropower.org/privacy-policy"),
            ),

            _accountCard(
              icon: Icons.logout,
              title: "Logout",
              color: Colors.grey.shade600,
            ),
            _accountCard(
              icon: Icons.delete_outline_rounded,
              title: "Delete my account",
              color: Colors.red.shade400,
            ),
          ],
        ),
      ),
    );
  }

  /// --- Widgets ---- ///

  Widget _otherSetting({required String title, required Function() onTap}) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              title,
              style: myTextStyle15(
                textColor: Colors.green.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _accountCard({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 12),
            Text(
              title,
              style: myTextStyle15(
                textColor: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomPrivacyItem({
    required String imagePath,
    required String title,
    required Size size,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: size.height * 0.04,
          height: size.height * 0.04,
          fit: BoxFit.cover,
        ),
        SizedBox(width: size.width * 0.015),
        Expanded(
          child: Text(
            title,
            style: myTextStyle12(
              textColor: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 4),
        AdvancedSwitch(
          activeColor: Colors.teal,
          inactiveColor: Colors.grey.shade300,
          controller: ValueNotifier<bool>(true),
          width: 36,
          height: 20,
        ),
      ],
    );
  }
}
