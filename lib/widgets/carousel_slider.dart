import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  State<MyCarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<MyCarouselSlider> {
  late Size size = MediaQuery.of(context).size;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: [
            _buildSliderWithIndicator(
              title: "What is my ex thinking about me ?",
              index: 0,
            ),
            _buildSliderWithIndicator(
              title: "Will i got a govt jab?",
              index: 1,
            ),
            _buildSliderWithIndicator(
              title: "When will i get married?",
              index: 2,
            ),
            _buildSliderWithIndicator(
              title: "When will i find my true love?",
              index: 3,
            ),
            _buildSliderWithIndicator(
              title: "When Will i get an increment?",
              index: 4,
            ),
          ],
          options: CarouselOptions(
            height: size.height * 0.09,
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
        const SizedBox(height: 6),
      ],
    );
  }

  Widget _buildSliderWithIndicator({
    required String title,
    required int index,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _slider(title: title),
        Positioned(
          bottom: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (dotIndex) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color:
                      _currentIndex == dotIndex ? Colors.black87 : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _slider({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfffff294),
              Color(0xfffff4ab),
              Colors.white,
              Colors.white,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              spreadRadius: 1,

              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text(title, style: TextStyle(fontSize: 14))),
              Image.asset("lib/assets/image/line.png"),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("lib/assets/image/thinking.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
