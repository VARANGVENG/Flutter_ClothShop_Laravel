import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Expanded(child: Image.asset(product.image, fit: BoxFit.cover)),
            const SizedBox(height: 8),
            Text(product.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("\$${product.price}"),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
