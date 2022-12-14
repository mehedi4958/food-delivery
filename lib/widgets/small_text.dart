import 'package:flutter/material.dart';

import '../utils/dimension.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 0,
    this.height = 1.2,
  }) : super(key: key);

  final Color color;
  final String text;
  final double size;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.font12 : size,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
