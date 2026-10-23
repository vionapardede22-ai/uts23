import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/banner_header.dart';
import '../widgets/category_row.dart';
import '../widgets/product_section.dart';

/// Gambar 2 - Detail kategori (Sayuran, Buah Buahan, dst).
class CategoryPage extends StatelessWidget {
  final Category category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const BannerHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  CategoryIcon(category: category),
                  const SizedBox(width: 24),
                  Text(
                    category.title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ProductSection(items: productsOf(category.key)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(current: NavTab.none),
    );
  }
}
