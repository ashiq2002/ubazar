import 'package:flutter/material.dart';
import 'package:ubazar/res/app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(green),
        title: const Text("Cart", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
    );
  }
}
