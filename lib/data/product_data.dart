import '../models/product.dart';

const List<Category> categories = [
  Category(key: 'sayur', label: 'Sayur', title: 'Kategori Sayuran', emoji: '🥬', image: 'assets/images/sayur.png'),
  Category(key: 'buah', label: 'Buah', title: 'Kategori Buah Buahan', emoji: '🍊', image: 'assets/images/buah.png'),
  Category(key: 'bumbu', label: 'Bumbu', title: 'Kategori Bumbu Dapur', emoji: '🧄', image: 'assets/images/bumbu.png'),
  Category(key: 'daging', label: 'Daging', title: 'Kategori Daging', emoji: '🥩', image: 'assets/images/sosis.png'),
  Category(key: 'telur', label: 'Telur', title: 'Kategori Telur', emoji: '🥚', image: 'assets/images/telur.png'),
];

const List<Product> products = [
  // Sayur
  Product(id: 'kangkung', name: 'Kangkung', unit: '250 gram', price: 2900, categoryKey: 'sayur', emoji: '🥬', image: 'assets/images/kangkung.png'),
  Product(id: 'bayam', name: 'Bayam', unit: '1 kg', price: 10000, categoryKey: 'sayur', emoji: '🌿', image: 'assets/images/bayam.png'),
  // Buah
  Product(id: 'jeruk', name: 'Jeruk', unit: '1 kg', price: 30000, categoryKey: 'buah', emoji: '🍊', image: 'assets/images/jeruk.png'),
  Product(id: 'buah_naga', name: 'Buah Naga', unit: '1 kg', price: 70000, categoryKey: 'buah', emoji: '🍇', image: 'assets/images/buah.png'),
  Product(id: 'apel', name: 'Apel', unit: '1 kg', price: 40000, categoryKey: 'buah', emoji: '🍎', image: 'assets/images/apel.png'),
  // Bumbu
  Product(id: 'bawang_merah', name: 'Bawang Merah', unit: '250 gram', price: 12000, categoryKey: 'bumbu', emoji: '🧅', image: 'assets/images/bawang_merah.png'),
  Product(id: 'bawang_putih', name: 'Bawang Putih', unit: '250 gram', price: 10000, categoryKey: 'bumbu', emoji: '🧄', image: 'assets/images/bawang_putih.png'),
  Product(id: 'cabai', name: 'Cabai Merah', unit: '250 gram', price: 15000, categoryKey: 'bumbu', emoji: '🌶️', image: 'assets/images/cabai.png'),
  // Daging
  Product(id: 'daging_sapi', name: 'Daging Sapi', unit: '1 kg', price: 89000, categoryKey: 'daging', emoji: '🥩', image: 'assets/images/daging.png'),
  Product(id: 'daging_ayam', name: 'Daging Ayam', unit: '1 kg', price: 38000, categoryKey: 'daging', emoji: '🍗', image: 'assets/images/daging.png'),
  // Telur
  Product(id: 'telur_ayam', name: 'Telur Ayam', unit: '1 kg', price: 28000, categoryKey: 'telur', emoji: '🥚', image: 'assets/images/telur.png'),
  Product(id: 'telur_bebek', name: 'Telur Bebek', unit: '1 kg', price: 32000, categoryKey: 'telur', emoji: '🥚', image: 'assets/images/telur.png'),
];

// Urutan dagangan terlaris di halaman awal (Gambar 1)
const List<String> bestSellerIds = [
  'kangkung',
  'daging_sapi',
  'jeruk',
  'telur_ayam',
  'bawang_merah',
];

Product? productById(String id) {
  for (final p in products) {
    if (p.id == id) return p;
  }
  return null; // id tidak ditemukan -> dilewati, tidak membuat app crash
}

List<Product> get bestSellers =>
    bestSellerIds.map(productById).whereType<Product>().toList();

List<Product> productsOf(String categoryKey) =>
    products.where((p) => p.categoryKey == categoryKey).toList();