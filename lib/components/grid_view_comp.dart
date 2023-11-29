import 'package:flutter/material.dart';

class GridImage extends StatelessWidget {

  final String image;
  final double height;
  final double width;
  const GridImage({super.key, required this.image, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: Colors.white,
        height: height,
        width: width,
        child: Image.asset(image),
      ),
    );
  }
}
