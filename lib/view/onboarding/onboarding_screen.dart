import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ubazar/res/app_colors.dart';
import 'package:ubazar/route/routes_name.dart';
import 'package:ubazar/util/system_util.dart';
import 'package:ubazar/widget/onboarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //SystemUtil.hideBottomNav(); // to hide system bottom nav
    SystemUtil.setStatusBarColor(0xFFFFFFFF); //to change status bar color
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }//dispose the views/controllers to free memory space
  
  @override
  Widget build(BuildContext context) {

    int currentPage = 0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: controller,
              itemCount: onBoardingItem.length,
              itemBuilder: (context, index)=> onBoardingItem[index],

              onPageChanged: (page){
                debugPrint("Current page : $page");
                currentPage = page;
              },
            ),
            //skip button & dot indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //skip button
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, RoutesName.mainScreen,
                            ModalRoute.withName(RoutesName.mainScreen));
                      },
                      child: Text(
                        currentPage == 2? "Finish": "Skip",
                        style: const TextStyle(color: Color(grey)),
                      )),
                  //dot indicator
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotColor: Color(grey),
                        activeDotColor: Color(green),
                        dotHeight: 10,
                        dotWidth: 10,
                        offset: 10,
                        radius: 8,
                        expansionFactor: 2.5),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
