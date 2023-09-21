import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ubazar/res/app_colors.dart';
import 'package:ubazar/route/routes_name.dart';
import 'package:ubazar/util/system_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemUtil.hideBottomNav(); //hide the system bottom nav
    SystemUtil.setStatusBarColor(green); //set the status bar color

    Timer(const Duration(seconds: 5), () { //after 5 second navigate to the onboarding screen, and remove this screen from the stack
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.onboardingScreen,
          ModalRoute.withName(RoutesName.onboardingScreen));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint("Disposed splash screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(green),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(child: Image.asset("assets/img_logo.png")),
      )
    );
  }
}
