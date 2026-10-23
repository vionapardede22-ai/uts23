import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/product.dart';
import '../utils/format.dart';
import 'asset_or_emoji.dart';

/// Satu kartu dagangan (CardView).
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onBuy;

  const ProductCard({super.key, required this.product, required this.onBuy});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: AssetOrEmoji(
                    asset: product.image,
                    emoji: product.emoji,
                    emojiSize: 34,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
              Text(product.unit,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              Text(rupiah(product.price),
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 26,
                child: ElevatedButton(
                  onPressed: onBuy,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(kGreenValue),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Text('BELI', style: TextStyle(fontSize: 10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
