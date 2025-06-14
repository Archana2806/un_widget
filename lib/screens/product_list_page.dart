import 'package:flutter/material.dart';

class Product {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;
  const Product(this.imageUrl, this.title, this.subtitle, this.price);
}

const _products = [
  Product('https://picsum.photos/seed/1/200', 'Galaxy X1', '256 GB, AMOLED', 799),
  Product('https://picsum.photos/seed/2/200', 'EchoWave Headphones', 'Wireless, ANC', 249),
  Product('https://picsum.photos/seed/3/200', 'UltraBook Pro', '14", 16GB RAM, SSD', 1799),
  Product('https://picsum.photos/seed/4/200', 'ZenPhone 12', '128 GB, Super Retina', 749),
  Product('https://picsum.photos/seed/5/200', 'SonicBass Headphones', 'Deep Bass, Over-Ear', 229),
  Product('https://picsum.photos/seed/6/200', 'PowerBook X', '15", 32GB RAM, Ultra HD', 2399),
  Product('https://picsum.photos/seed/7/200', 'CyberBook Edge', '13", Touchscreen, 16GB RAM', 1899),
  Product('https://picsum.photos/seed/8/200', 'VisionPhone 5G', '512 GB, OLED HDR', 999),
  Product('https://picsum.photos/seed/9/200', 'FutureBook Pro', '17", 64GB RAM, 4K Display', 2999),
  Product('https://picsum.photos/seed/11/200', 'StormBook Max', '15", 32GB RAM, AI-Powered', 2599),
];

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(product: product),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped on ${product.title}')),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title, style: Theme.of(context).textTheme.titleMedium),
                          Text(product.subtitle, style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    Text('₹${product.price.toStringAsFixed(0)}',
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(product.imageUrl, height: 240, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(product.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(product.subtitle),
            const Spacer(),
            Text('₹${product.price}', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
