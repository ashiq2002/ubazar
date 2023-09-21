import 'package:flutter/services.dart';

class SystemUtil{

  //hide the system bottom navigation bar
  static void hideBottomNav(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]); // to hide system bottom nav
  }//end of hideBottomNav()

 //change the status bar color
 static void setStatusBarColor(int color){
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
       statusBarColor: Color(color))); //to change status bar color
 }//end of setStatusBarColor()


}