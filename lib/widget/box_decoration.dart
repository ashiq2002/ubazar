import 'package:flutter/material.dart';

BoxDecoration boxDecoration(
        {double borderRadius = 12,
        Color color = Colors.white,
        Color shadowColor = Colors.black,
        Offset offset = const Offset(-2, 2),
        double blurRadius = 5}) =>
    BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
              color: shadowColor.withOpacity(0.2),
              offset: offset,
              blurRadius: blurRadius)
        ]);
