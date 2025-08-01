import 'package:flutter/material.dart';
import 'package:my_astro/helper/custom_text_style.dart';
import 'package:my_astro/widgets/simple_text_fill_button.dart';

class SortFilterBottomSheet extends StatefulWidget {
  const SortFilterBottomSheet({super.key});

  @override
  State<SortFilterBottomSheet> createState() => _SortFilterBottomSheetState();
}

class _SortFilterBottomSheetState extends State<SortFilterBottomSheet> {
  int selectedCategoryIndex = 0;
  int selectedRadioIndex = 0;

  final List<String> categories = [
    "Sort by",
    "Skill",
    "Language",
    "Gender",
    "Country",
    "Offer",
    "Top Astrologers",
  ];

  final List<String> sortOptions = [
    "Popularity",
    "Experience: High to Low",
    "Experience: Low to High",
    "Orders: High to Low",
    "Orders: Low to High",
    "Price: High to Low",
    "Price: Low to High",
    "Rating: High to Low",
  ];

  final List<String> skillOptions = [
    "Face Reading",
    "Kp",
    "Life Coach",
    "Nadi",
    "Numerology",
    "Palmistry",
    "Prashana",
    "Psynchic",
    "Psychologist",
    "Tarot",
    "Vastu",
    "Vedic",
  ];

  final List<String> languageOptions = [
    "English",
    "Hindi",
    "Bengali",
    "Gujarati",
    "Kannada",
    "Malayalam",
    "Marathi",
    "Punjabi",
    "Tamil",
    "Telugu",
    "Urdu",
  ];

  final List<String> genderOptions = ["Male", "Female", "Other"];
  final List<String> countryOptions = ["India", "Outside India"];
  final List<String> offerOptions = ["Active", "Not Active"];
  final List<String> topAstroOptions = [
    "Celebrity",
    "Top Choice",
    "Rising Star",
    "All",
  ];

  /// Store multiple selected indexes for each category
  final Map<int, Set<int>> selectedCheckboxes = {
    1: <int>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
    2: <int>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    3: <int>{0, 1, 2},
    4: <int>{0, 1},
    5: <int>{0, 1},
    6: <int>{0, 1, 2, 3},
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.75,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.01),

          /// Top bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Sort & Filter',
                    style: myTextStyle21(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Divider(height: 1, thickness: 1.5, color: Colors.grey.shade300),

          Expanded(
            child: Row(
              children: [
                /// Left menu
                Container(
                  width: size.width * 0.35,
                  color: Colors.grey.shade200,
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedCategoryIndex == index;
                      return Container(
                        color: isSelected ? Colors.white : Colors.transparent,
                        child: ListTile(
                          visualDensity: VisualDensity.compact,
                          title: Text(
                            categories[index],
                            style: myTextStyle12(fontWeight: FontWeight.w900),
                          ),
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),

                VerticalDivider(thickness: 1.5, color: Colors.grey.shade300),

                /// Right dynamic list
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ListView.builder(
                      itemCount: getCurrentOptions().length,
                      itemBuilder: (context, index) {
                        final option = getCurrentOptions()[index];

                        if (selectedCategoryIndex == 0) {
                          /// Radio List Tile for "Sort by"
                          return RadioListTile<int>(
                            contentPadding: EdgeInsets.zero,
                            value: index,
                            groupValue: selectedRadioIndex,
                            activeColor: Colors.black,
                            title: Text(
                              option,
                              style: myTextStyle12(
                                textColor: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                selectedRadioIndex = val!;
                              });
                            },
                          );
                        } else {
                          /// CheckboxListTile for other filters
                          final isChecked =
                              selectedCheckboxes[selectedCategoryIndex]!
                                  .contains(index);
                          return CheckboxListTile(
                            checkboxShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            value: isChecked,
                            activeColor: Colors.black87,
                            title: Text(
                              option,
                              style: myTextStyle12(
                                textColor: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                if (val == true) {
                                  selectedCheckboxes[selectedCategoryIndex]!
                                      .add(index);
                                } else {
                                  selectedCheckboxes[selectedCategoryIndex]!
                                      .remove(index);
                                }
                              });
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          Divider(thickness: 1.5, color: Colors.grey.shade300),
          SizedBox(height: size.height * 0.01),

          /// Apply Button
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SizedBox(
                width: size.width * 0.5,
                child: SimpleTextFillButton(
                  btnText: "Apply",
                  textColor: Colors.white,
                  verticalPadding: 12,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backGroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }

  List<String> getCurrentOptions() {
    switch (selectedCategoryIndex) {
      case 0:
        return sortOptions;
      case 1:
        return skillOptions;
      case 2:
        return languageOptions;
      case 3:
        return genderOptions;
      case 4:
        return countryOptions;
      case 5:
        return offerOptions;
      case 6:
        return topAstroOptions;
      default:
        return [];
    }
  }
}
