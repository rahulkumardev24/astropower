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

                /// Right radio list
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ListView.builder(
                      itemCount: sortOptions.length,
                      itemBuilder: (context, index) {
                        return RadioListTile<int>(
                          contentPadding: EdgeInsets.zero,
                          value: index,
                          groupValue: selectedRadioIndex,
                          activeColor: Colors.black,

                          /// title
                          title: Text(
                            sortOptions[index],
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
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1.5, color: Colors.grey.shade300),
          SizedBox(height: size.height * 0.01),
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
}
