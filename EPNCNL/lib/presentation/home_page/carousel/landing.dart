import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Landing extends StatefulWidget{
  const Landing({super.key});
  @override
  State<Landing> createState() => _LandingState();
}
class _LandingState extends State<Landing>{
  int activeIndex = 0;
  int itemCount = 0;

  final List<String> images = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  List<Widget> generateImagesTiles(){
    return images.map((element) => ClipRRect(
      child: Image.asset(element,
        fit:BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(7.0),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // padding: const EdgeInsets.only(top: 50),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CarouselSlider(items: generateImagesTiles(), options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 0.9,
              // Change size of image
              aspectRatio: 18/9,
              onPageChanged: (index,reason) => setState(() => activeIndex = index)
          )),
          Positioned(
            bottom: 10, // Adjust the position as needed
            left: 150,
            right: 0,
            child: buildIndicator(),
          ),
        ],
      ),
    );
  }
  Widget buildIndicator()=> AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: images.length,
    effect: JumpingDotEffect(
      dotWidth: 10,
      dotHeight: 10,
      activeDotColor: Color(0xffff9300),
      dotColor: Color(0xff6c6c71),
    ),
  );
}