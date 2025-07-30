import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_astro/constant/app_constant.dart';

import '../widgets/my_text_button.dart';

class MyDialog {
  static void offerDialog({
    required BuildContext context,
    required String title,
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

  static void languageDialog(BuildContext context) {
    /// default selection
    String selectedLangLabel = 'English';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: Stack(
                  children: [
                    // Title Row
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 21),
                        const Text(
                          'Choose your app language',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 12),
                        // Language Grid
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children:
                              AppConstant.languages.map((lang) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedLangLabel = lang['label']!;
                                    });
                                  },
                                  child: LanguageTile(
                                    code: lang['code']!,
                                    label: lang['label']!,
                                    isSelected:
                                        selectedLangLabel == lang['label'],
                                  ),
                                );
                              }).toList(),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "*Malayalam, Tamil, Gujarati and Odia are coming soon!",
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20),

                        /// Apply Button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: MyTextButton(
                              btnText: 'APPLY',
                              onPressed: () {
                                // Save or use selectedLangLabel
                                print("Selected Language: $selectedLangLabel");
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String code;
  final String label;
  final bool isSelected;

  const LanguageTile({
    super.key,
    required this.code,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 65,
      decoration: BoxDecoration(
        color:
            isSelected
                ? Colors.pinkAccent.shade100.withValues(alpha: 0.3)
                : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.pinkAccent.shade700 : Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(code), const SizedBox(height: 4), Text(label)],
        ),
      ),
    );
  }
}
