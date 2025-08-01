import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PosterCarouselSlider  extends StatefulWidget {
  final List<String> imagePaths;
  final List<VoidCallback> onPressActions;
  final double? height;

  const PosterCarouselSlider({
    super.key,
    required this.imagePaths,
    required this.onPressActions,
    this.height,
  }) : assert(imagePaths.length == onPressActions.length,
  "Each image must have a corresponding onPress action");

  @override
  State<PosterCarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<PosterCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sliderHeight = widget.height ?? size.height * 0.18;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: List.generate(widget.imagePaths.length, (index) {
                return GestureDetector(
                  onTap: widget.onPressActions[index],
                  child: _sliderPoster(imagePath: widget.imagePaths[index]),
                );
              }),
              options: CarouselOptions(
                height: sliderHeight,
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
                children: List.generate(widget.imagePaths.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
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
