import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RemediesCarouselSlider extends StatefulWidget {
  const RemediesCarouselSlider({super.key});

  @override
  State<RemediesCarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<RemediesCarouselSlider> {
  late Size size = MediaQuery.of(context).size;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: [
                _sliderPoster(
                  imagePath: "lib/assets/banner/remedies_banner_1.jpg",
                ),
                _sliderPoster(
                  imagePath: "lib/assets/banner/remedies_banner_2.jpg",
                ),
                _sliderPoster(
                  imagePath: "lib/assets/banner/remedies_banner_3.jpg",
                ),
              ],
              options: CarouselOptions(
                height: size.height * 0.18,
                viewportFraction: 0.98,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  // Change 5 to 3 since you have 3 images
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                          _currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
      ],
    );
  }

  Widget _sliderPoster({required String imagePath}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
