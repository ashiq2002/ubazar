import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ubazar/res/app_colors.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({super.key});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;
  Timer? carouseTimer;

  //slider item list
  List<String> sliderItem = [
    'assets/img_slide.png',
    'assets/img_slide.png',
    'assets/img_slide.png',
    'assets/img_slide.png',
    'assets/img_slide.png',
  ];

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 2), (timer) {
      if (page == sliderItem.length) {
        page = 0;
      }

      //navigate the next page after 3 second
      controller.animateToPage(page,
          duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc);

      page++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carouseTimer = getTimer();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    carouseTimer?.cancel();
    carouseTimer = null;
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
            controller: controller,
            itemCount: sliderItem.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  //TODO: perform the action which is need
                },


                child: Image.asset(
                      sliderItem[index],
                      fit: BoxFit.fill,
                      height: 150,
                    ),
              ),
            ),
          onPageChanged: (currentPage){
              page = currentPage; //update the page number
          },
        ),
        Positioned(
            bottom: 15.5,
            child: SmoothPageIndicator(
              controller: controller,
              count: sliderItem.length,
              effect: const WormEffect(
                dotColor: Color(grey),
                activeDotColor: Colors.white,
                dotHeight: 7,
                dotWidth: 7,
                offset: 10,
                radius: 8,
              ),
            ))
      ],
    );
  }
}
