import 'package:flutter/material.dart';
import 'package:shoes_dicoding/model/shoes.dart';

class SneakerDetailPage extends StatelessWidget {
  final Sneaker sneaker;
  const SneakerDetailPage({super.key, required this.sneaker});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 800;

    final originalPrice = (sneaker.price * 1.8).round();
    final discount = ((1 - sneaker.price / originalPrice) * 100).round();

    final imageWidget = AspectRatio(
      aspectRatio: 1,
      child: sneaker.isAsset
          ? Image.asset(sneaker.image, fit: BoxFit.contain)
          : Image.network(
              sneaker.image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stack) => const Icon(Icons.image_not_supported_outlined),
            ),
    );

    final infoWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sneaker.name, style: theme.textTheme.headlineSmall?.copyWith(fontSize: 22)),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'Rp${sneaker.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
            ),
            const SizedBox(width: 12),
            Text(
              'Rp$originalPrice',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text('-$discount%', style: const TextStyle(color: Colors.red)),
            ),
          ],
        ),

        // ✅ Tambahan: Deskripsi produk
        const SizedBox(height: 12),
        Text(
          sneaker.description,
          style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF6B7280)),
        ),

        const SizedBox(height: 24),
        Text('Brand: ${sneaker.brand}', style: theme.textTheme.bodyMedium),
        const SizedBox(height: 8),
        Text('Warna: Klasik Abu-Abu', style: theme.textTheme.bodyMedium),
        const SizedBox(height: 8),
        Text('Ukuran: 39-40 (24.5 cm)', style: theme.textTheme.bodyMedium),
        const SizedBox(height: 8),
        Text('Stok tersedia: 2.166', style: theme.textTheme.bodyMedium),
        const SizedBox(height: 24),
        Row(
          children: [
            const Text('Jumlah:', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                  const Text('1'),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                ],
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text(sneaker.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: imageWidget),
                  const SizedBox(width: 24),
                  Expanded(flex: 2, child: infoWidget),
                ],
              )
            : ListView(
                children: [
                  imageWidget,
                  const SizedBox(height: 16),
                  infoWidget,
                ],
              ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width > 400 ? 300 : size.width * 0.9,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
                label: const Text('Tambah ke Keranjang'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}