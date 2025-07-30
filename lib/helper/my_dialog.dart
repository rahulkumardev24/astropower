import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyDialog {
 static  void offerDialog({
    required BuildContext context,
    required String title
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
          child: SizedBox(
            height: 350,
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// Background Lottie animation
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Lottie.asset(
                      "lib/assets/animation/win.json",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// Content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("🎉", style: TextStyle(fontSize: 50)),
                      const Text(
                        "Special Offer!",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        "Woohoo!",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Close button
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
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
