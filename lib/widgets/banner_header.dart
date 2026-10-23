import 'package:flutter/material.dart';
import 'asset_or_emoji.dart';

/// Bagian 1: banner + kolom search + sapaan selamat datang.
/// Memakai Stack/Positioned (setara Relative Layout).
class BannerHeader extends StatelessWidget {
  const BannerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          // Gambar banner di kanan
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 190,
            child: const AssetOrEmoji(
              asset: 'assets/images/buahan.png',
              emoji: '🥦🍅🍊🥕',
              emojiSize: 34,
              fit: BoxFit.contain,
            ),
          ),
          // Kolom search di kiri atas
          Positioned(
            left: 12,
            top: 12,
            width: 180,
            height: 38,
            child: TextField(
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Cari produk segar di sini...',
                hintStyle: const TextStyle(fontSize: 11),
                prefixIcon: const Icon(Icons.search, size: 18),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Sapaan di kiri bawah
          const Positioned(
            left: 16,
            bottom: 28,
            child: Text(
              'Selamat Datang\nMau belanja apa?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
