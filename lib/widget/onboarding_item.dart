import 'package:flutter/material.dart';
import 'package:ubazar/res/app_colors.dart';

class OnBoardingItem extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String topText;
  final String? bottomLeftText;
  final String bottomRightText;
  final String imagePath;

  const OnBoardingItem(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
        this.crossAxisAlignment = CrossAxisAlignment.start,
      required this.topText,
      this.bottomLeftText,
      required this.bottomRightText,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    debugPrint(bottomLeftText);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width *0.08),
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                const SizedBox(
                  height: 30,
                ),
                //welcome to
                Text(
                  topText,
                  style: const TextStyle(
                    color: Color(grey),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                //app logo & text
                Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    //bottom left element/widget
                    bottomLeftText != null
                        ? Text(
                            bottomLeftText!,
                            style: const TextStyle(
                              color: Color(green),
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : Image.asset(
                            'assets/img_logo.png',
                            height: 40,
                            width: 80,
                            color: Colors.green,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      bottomRightText,
                      style: const TextStyle(
                        color: Color(grey),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          //onboarding image
          SizedBox(
            height: size.height / 7.5,
          ),
          Image.asset(
            imagePath,
            height: size.height / 2,
            width: size.width / 1.3,
          )
        ],
      ),
    );
  }
}

List<OnBoardingItem> onBoardingItem = const [
  OnBoardingItem(
    topText: "Welcome to",
    bottomRightText: "Application",
    imagePath: "assets/img_shopping.png",
  ),

  OnBoardingItem(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    topText: "Get",
    bottomLeftText: "Fast",
    bottomRightText: "Delivery Service",
    imagePath: "assets/img_delevery.png",
  ),

  OnBoardingItem(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    topText: "Best Quality",
    bottomLeftText: "Grocery",
    bottomRightText: "Door to Door",
    imagePath: "assets/img_shipping.png",
  ),
];
