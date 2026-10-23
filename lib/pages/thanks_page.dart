import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/smiley_face.dart';

/// Gambar 3(b) - Terimakasih sudah membeli.
class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmileyFace(size: 170),
              SizedBox(height: 24),
              Text(
                'Terimakasih\nsudah membeli',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          AppBottomNav(current: NavTab.none, showCart: false),
    );
  }
}
