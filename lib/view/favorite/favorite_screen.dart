import 'package:flutter/material.dart';
import 'package:ubazar/res/app_colors.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(green),
        title: const Text("Favorite", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
    );
  }
}
