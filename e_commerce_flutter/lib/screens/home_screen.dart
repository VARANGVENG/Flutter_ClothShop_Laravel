import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_cart.dart';
import 'cart_screen.dart';
import 'product_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = Product.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cloth Shop"),
        actions: [
          const Icon(Icons.search),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ProductDetailScreen(product: products[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
