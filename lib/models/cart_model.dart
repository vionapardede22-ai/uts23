import 'package:flutter/foundation.dart';
import 'product.dart';

class CartItem {
  final Product product;
  final int qty; // default jumlah pembelian per item = 1
  bool selected;

  CartItem(this.product, {this.qty = 1, this.selected = true});
}

/// Keranjang belanja (singleton sederhana, tanpa package tambahan).
class CartModel extends ChangeNotifier {
  CartModel._();
  static final CartModel instance = CartModel._();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);
  List<CartItem> get selectedItems => _items.where((e) => e.selected).toList();

  bool get allSelected => _items.isNotEmpty && _items.every((e) => e.selected);

  int get total =>
      selectedItems.fold(0, (sum, e) => sum + e.product.price * e.qty);

  void add(Product p) {
    final i = _items.indexWhere((e) => e.product.id == p.id);
    if (i == -1) {
      _items.add(CartItem(p));
    } else {
      _items[i].selected = true; // sudah ada, jumlah tetap 1
    }
    notifyListeners();
  }

  void toggle(CartItem item, bool value) {
    item.selected = value;
    notifyListeners();
  }

  void selectAll(bool value) {
    for (final e in _items) {
      e.selected = value;
    }
    notifyListeners();
  }

  void removeSelected() {
    _items.removeWhere((e) => e.selected);
    notifyListeners();
  }

  /// Dipanggil saat Checkout: item yang dipilih dianggap sudah dibeli.
  void checkoutSelected() => removeSelected();
}
