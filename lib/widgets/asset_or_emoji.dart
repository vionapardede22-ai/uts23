import 'package:flutter/material.dart';

/// Menampilkan gambar dari assets. Jika file gambar belum ada,
/// tampil kotak berisi emoji sebagai placeholder.
class AssetOrEmoji extends StatelessWidget {
  final String asset;
  final String emoji;
  final double emojiSize;
  final BoxFit fit;

  const AssetOrEmoji({
    super.key,
    required this.asset,
    required this.emoji,
    this.emojiSize = 36,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (_, __, ___) => Container(
        color: const Color(0xFFF1F8E9),
        alignment: Alignment.center,
        child: Text(emoji, style: TextStyle(fontSize: emojiSize)),
      ),
    );
  }
}
