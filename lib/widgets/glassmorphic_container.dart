import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatelessWidget {
  final Widget child;

  const GlassmorphicContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: BoxBorder.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20),
      child: child,
    );
  }
}
