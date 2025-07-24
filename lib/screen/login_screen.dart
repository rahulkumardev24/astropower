import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/msg91_api_service.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size mqData = MediaQuery.of(context).size;
  TextEditingController phoneNumberController = TextEditingController();

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
    return Scaffold(
      backgroundColor: Colors.white,

      /// --- body --- ///
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mqData.height * 0.05),

              /// logo
              Image.asset(
                "lib/assets/image/newlogo.png",
                height: mqData.height * 0.2,
                width: mqData.height * 0.2,
                fit: BoxFit.contain,
              ),

              SizedBox(height: mqData.height * 0.02),
              Text(
                "Login to Astropower",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: mqData.height * 0.02),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(color: Color(0xffFF4d4d)),
                    ),

                    /// free box
                    Positioned(
                      left: mqData.width * 0.05,
                      right: mqData.width * 0.05,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(width: 1, color: Colors.black38),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 21.0,
                            vertical: 4,
                          ),
                          child: Text(
                            "First Chat with Astropower is Free",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: mqData.width * 0.15,
                      left: mqData.width * 0.05,
                      right: mqData.width * 0.05,
                      child: Column(
                        children: [
                          /// number input box
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "lib/assets/image/flag.png",
                                  height: mqData.height * 0.04,
                                ),
                                SizedBox(width: mqData.height * 0.02),
                                Text(
                                  "IN +91  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        controller: phoneNumberController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Phone number',
                                          hintStyle: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// get otp button
                          SizedBox(height: mqData.height * 0.02),
                          SizedBox(
                            width: mqData.width,
                            child: ElevatedButton(
                                onPressed: () async {
                                  final phone = phoneNumberController.text.trim();
                                  if (phone.isEmpty || phone.length != 10) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Please enter a valid 10-digit phone number"),
                                      ),
                                    );
                                    return;
                                  }

                                  // Call MSG91 API
                                  final success = await Msg91Service.sendOtp(phone);

                                  if (success) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => OtpScreen(number: phone),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Failed to send OTP. Try again."),
                                      ),
                                    );
                                  }
                                },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 11.0),
                                child: Text(
                                  "Send OTP",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: mqData.height * 0.02),

                          /// privacy policy
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                const TextSpan(
                                  text: "By signing up you agree to our ",
                                ),
                                TextSpan(
                                  text: "Terms of Use",
                                  style: const TextStyle(
                                    color: Color(0xff51619b),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff51619b),
                                  ),
                                  recognizer:
                                      TapGestureRecognizer()
                                        ..onTap =
                                            () => _launchUrl(
                                              "https://astropower.org/terms-condition",
                                            ),
                                ),
                                const TextSpan(text: " and "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: const TextStyle(
                                    color: Color(0xff51619b),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff51619b),
                                  ),
                                  recognizer:
                                      TapGestureRecognizer()
                                        ..onTap =
                                            () => _launchUrl(
                                              "https://astropower.org/privacy-policy",
                                            ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: mqData.height * 0.02),

                          /// divider
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 1.5,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 21.0,
                                ),
                                child: Text(
                                  "Or",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 1.5,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: mqData.height * 0.02),

                          /// Login with email
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                                side: BorderSide(
                                  width: 1,
                                  color: Color(0xff5c5a5a),
                                ),
                              ),
                              backgroundColor: Color(0xfff0eeeb),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "lib/assets/image/Gmail_icon.svg",
                                    height: mqData.width * 0.04,
                                    width: mqData.width * 0.04,
                                    fit: BoxFit.cover,
                                  ),

                                  SizedBox(width: mqData.height * 0.02),
                                  Text(
                                    "Continue with Gmail",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
