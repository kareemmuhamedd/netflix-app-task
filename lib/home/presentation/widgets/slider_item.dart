import 'package:flutter/material.dart';
class SliderItem extends StatelessWidget {
  final String? imagePath;
  const SliderItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.network(
        imagePath!,
        fit: BoxFit.cover,
      ),
    );
  }
}
