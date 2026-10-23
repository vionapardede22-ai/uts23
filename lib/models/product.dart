class Category {
  final String key;
  final String label; // di baris kategori (Gambar 1)
  final String title; // di halaman detail kategori (Gambar 2)
  final String emoji; // placeholder jika gambar asset belum ada
  final String image;

  const Category({
    required this.key,
    required this.label,
    required this.title,
    required this.emoji,
    required this.image,
  });
}

class Product {
  final String id;
  final String name;
  final String unit; // contoh: "250 gram", "1 kg"
  final int price;
  final String categoryKey;
  final String emoji; // placeholder jika gambar asset belum ada
  final String image;

  const Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.price,
    required this.categoryKey,
    required this.emoji,
    required this.image,
  });
}
