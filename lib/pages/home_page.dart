import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/banner_header.dart';
import '../widgets/category_row.dart';
import '../widgets/product_section.dart';
import 'category_page.dart';

/// Gambar 1 - Layout awal aplikasi.
/// Scaffold = Slot Based Layout (body + bottomNavigationBar).
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const BannerHeader(), // bagian 1: banner + search + sapaan
            CategoryRow(
              // bagian 2: kategori
              categories: categories,
              onTap: (c) => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CategoryPage(category: c)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Dagangan Terlaris',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
            ),
            // bagian 3: menu dagangan terlaris
            Expanded(child: ProductSection(items: bestSellers)),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(current: NavTab.home), // bagian 4
    );
  }
}
