import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FoodDetailsSlider extends StatelessWidget {
  final String slideImage1;
  final String slideImage2;
  final String slideImage3;

  const FoodDetailsSlider({
    super.key, // Use nullable type for key
    required this.slideImage1,
    required this.slideImage2,
    required this.slideImage3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0, // Set the height of the carousel
          autoPlay: true, // Enable auto play
          aspectRatio: 16 / 9, // Aspect ratio
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          enlargeCenterPage: true,
        ),
        items: [
          Image.asset(slideImage1),
          Image.asset(slideImage2),
          Image.asset(slideImage3),
        ].map((image) {
          return Container(
            child: Center(
              child: image,
            ),
          );
        }).toList(),
      ),
    );
  }
}
