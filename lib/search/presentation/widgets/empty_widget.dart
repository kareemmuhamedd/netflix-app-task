import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/empty.png',
        width: 100,
        height: 100,
        color: Colors.grey,
      ),
    );
  }
}
