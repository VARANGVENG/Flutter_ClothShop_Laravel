import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  int selectedColorIndex = 0;

  Future<void> insertProduct(
    String name,
    double price,
    int qty,
    String imagePath,
  ) async {
    final uri = Uri.parse('http://10.0.2.2:8000/api/products');

    final response = await http.post(
      uri,
      headers: {'Accept': 'application/json'},
      body: {
        'name': name,
        'price': price.toString(),
        'qty': qty.toString(),
        'image': imagePath, // ← Send as string
      },
    );

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product"${json['name']}" is added to cart!')),
      );
    } else {
      print('Error: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Product add to cart Fail!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          const Icon(Icons.search),
          const SizedBox(width: 12),
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              color: _getColorFromName(product.colors[selectedColorIndex]),
              child: Image.asset(product.image, height: 240),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aristocratic Hand Bag",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 8),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text("Price", style: TextStyle(color: Colors.grey[600])),
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      "Color",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 16),
                    ...List.generate(product.colors.length, (index) {
                      final color = _getColorFromName(product.colors[index]);
                      return GestureDetector(
                        onTap: () => setState(() => selectedColorIndex = index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: selectedColorIndex == index
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      "Size",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 16),
                    Text(product.size, style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => setState(
                        () => quantity = (quantity > 1) ? quantity - 1 : 1,
                      ),
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () => setState(() => quantity++),
                      icon: const Icon(Icons.add),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getColorFromName(
                        product.colors[selectedColorIndex],
                      ),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      insertProduct(
                        product.name,
                        product.price,
                        quantity,
                        product.image,
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("BUY NOW"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorFromName(String name) {
    switch (name.toLowerCase()) {
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "grey":
        return Colors.grey;
      case "brown":
        return Colors.brown;
      case "black":
        return Colors.black;
      case "tan":
        return Colors.orange.shade300;
      default:
        return Colors.teal;
    }
  }
}
