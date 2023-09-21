import 'package:flutter/material.dart';
import 'package:ubazar/res/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(green),
        title: const Text("Profile", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
    );
  }
}
