import 'package:flutter/material.dart';
import '../models/product.dart';
import 'asset_or_emoji.dart';

/// Kotak gambar satu kategori (dipakai di baris kategori & header detail).
class CategoryIcon extends StatelessWidget {
  final Category category;
  final double size;
  const CategoryIcon({super.key, required this.category, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AssetOrEmoji(
          asset: category.image,
          emoji: category.emoji,
          emojiSize: size * 0.55,
        ),
      ),
    );
  }
}

/// Bagian 2: baris kategori (Linear Layout / Row).
class CategoryRow extends StatelessWidget {
  final List<Category> categories;
  final ValueChanged<Category> onTap;

  const CategoryRow({super.key, required this.categories, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories
            .map(
              (c) => InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => onTap(c),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CategoryIcon(category: c),
                    const SizedBox(height: 4),
                    Text(
                      c.label,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
