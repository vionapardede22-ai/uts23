import 'package:flutter/material.dart';
import '../constants.dart';
import '../pages/account_page.dart';
import '../pages/cart_page.dart';
import '../pages/home_page.dart';

enum NavTab { none, home, cart, account }

/// Bottom navigation: Beranda, Belanja, Akun.
/// Klik tiap ikon berpindah halaman memakai Navigator (setara Intent).
/// Di halaman checkout/terimakasih/akun ikon Belanja disembunyikan
/// (showCart: false) sesuai Gambar 3 dan 4.
class AppBottomNav extends StatelessWidget {
  final NavTab current;
  final bool showCart;

  const AppBottomNav({super.key, required this.current, this.showCart = true});

  void _goHome(BuildContext context) {
    if (current == NavTab.home) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
      (route) => false,
    );
  }

  void _goCart(BuildContext context) {
    if (current == NavTab.cart) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
  }

  void _goAccount(BuildContext context) {
    if (current == NavTab.account) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const AccountPage()));
  }

  Widget _item(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30, color: Colors.black),
            Text(label, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _cartButton(BuildContext context) {
    return InkWell(
      onTap: () => _goCart(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircleAvatar(
              radius: 18,
              backgroundColor: Color(kOrangeValue),
              child: Icon(Icons.shopping_basket, color: Colors.white, size: 20),
            ),
            SizedBox(height: 2),
            Text('Belanja', style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 66,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _item(Icons.home, 'Beranda', () => _goHome(context)),
              if (showCart) _cartButton(context),
              _item(Icons.account_circle, 'Akun', () => _goAccount(context)),
            ],
          ),
        ),
      ),
    );
  }
}
