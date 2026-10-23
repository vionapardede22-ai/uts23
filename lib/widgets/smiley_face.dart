import 'package:flutter/material.dart';

class SmileyFace extends StatelessWidget {
  final double size;
  const SmileyFace({super.key, this.size = 160});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFFFFD93B),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.sentiment_satisfied_alt,
        size: size * 0.85,
        color: const Color(0xFF3A3A3A),
      ),
    );
  }
}
