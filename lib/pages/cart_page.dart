import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/cart_model.dart';
import '../utils/format.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/asset_or_emoji.dart';
import 'thanks_page.dart';

/// Gambar 3(a) - Keranjang Belanja / total pembayaran.
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void _checkout(BuildContext context, CartModel cart) {
    if (cart.selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih minimal satu barang')),
      );
      return;
    }
    cart.checkoutSelected();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ThanksPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = CartModel.instance;
    const green = Color(kGreenValue);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 16),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text('Keranjang Belanja', style: TextStyle(fontSize: 13)),
      ),
      body: ListenableBuilder(
        listenable: cart,
        builder: (context, _) {
          final items = cart.items;
          return Column(
            children: [
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Checkbox(
                      value: cart.allSelected,
                      activeColor: green,
                      onChanged: (v) => cart.selectAll(v ?? false),
                    ),
                    const Text('Pilih Semua', style: TextStyle(fontSize: 11)),
                    const Spacer(),
                    TextButton(
                      onPressed: cart.removeSelected,
                      child: const Text('Hapus',
                          style: TextStyle(color: green, fontSize: 11)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: items.isEmpty
                    ? const Center(child: Text('Keranjang masih kosong'))
                    : ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          final item = items[i];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: item.selected,
                                  activeColor: green,
                                  onChanged: (v) =>
                                      cart.toggle(item, v ?? false),
                                ),
                                SizedBox(
                                  width: 64,
                                  height: 52,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: AssetOrEmoji(
                                      asset: item.product.image,
                                      emoji: item.product.emoji,
                                      emojiSize: 28,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.product.name,
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold)),
                                      Text(item.product.unit,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                      Text(rupiah(item.product.price * item.qty),
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Total: ${rupiah(cart.total)}',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () => _checkout(context, cart),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: const Text('Checkout',
                          style: TextStyle(fontSize: 11)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar:
          const AppBottomNav(current: NavTab.cart, showCart: false),
    );
  }
}
