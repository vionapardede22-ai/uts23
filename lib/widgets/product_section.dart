import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/cart_model.dart';
import '../models/product.dart';
import '../pages/cart_page.dart';
import 'product_card.dart';

/// Bagian 3: area hijau berisi daftar dagangan (Lazy Layout:
/// ListView.builder horizontal). Klik BELI -> masuk keranjang -> halaman checkout.
class ProductSection extends StatelessWidget {
  final List<Product> items;
  const ProductSection({super.key, required this.items});

  void _buy(BuildContext context, Product p) {
    CartModel.instance.add(p);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(kGreenValue),
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) => ProductCard(
              product: items[i],
              onBuy: () => _buy(context, items[i]),
            ),
          ),
        ),
      ),
    );
  }
}
