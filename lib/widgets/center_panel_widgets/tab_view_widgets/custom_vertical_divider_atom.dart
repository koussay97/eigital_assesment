

import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double height;
  const CustomVerticalDivider({super.key,required this.height ,required this.color, required this.thickness});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: thickness,
      color: color,
    );
  }
}