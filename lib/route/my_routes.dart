import 'package:flutter/material.dart';
import 'package:ubazar/route/routes_name.dart';
import 'package:ubazar/view/cart/cart_screen.dart';
import 'package:ubazar/view/home/home_screen.dart';
import 'package:ubazar/view/main/main_screen.dart';
import 'package:ubazar/view/onboarding/onboarding_screen.dart';
import 'package:ubazar/view/onboarding/splash_screen.dart';
import 'package:ubazar/view/product/product_screen.dart';

class MyRoutes{

  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      //navigate to splash screen
      case RoutesName.splashScreen :
        return MaterialPageRoute(builder: (context)=> const SplashScreen());

        //navigate to onBoarding screen
      case RoutesName.onboardingScreen:
        return MaterialPageRoute(builder: (context)=> const OnBoardingScreen());

        //navigate to the home screen
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context)=> const HomeScreen());

        //navigate to the main screen
      case RoutesName.mainScreen:
        return MaterialPageRoute(builder: (context)=> const MainScreen());

    //navigate to the cart screen
    case RoutesName.cartScreen:
    return MaterialPageRoute(builder: (context)=> const CartScreen());

    //navigate to the product screen
      case RoutesName.productScreen:
        return MaterialPageRoute(builder: (context)=> ProductScreen(query: settings.arguments as String));

      //navigate to home screen
      default:
        return MaterialPageRoute(builder: (context)=> const SplashScreen());
    }
  }
}