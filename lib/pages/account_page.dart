import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/smiley_face.dart';

/// Gambar 4 - Detail akun (nama dan NIM).
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmileyFace(size: 160),
              SizedBox(height: 24),
              Text(kNamaAnda, style: TextStyle(fontSize: 13)),
              SizedBox(height: 6),
              Text(kNimAnda, style: TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          AppBottomNav(current: NavTab.account, showCart: false),
    );
  }
}
