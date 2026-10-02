class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;
  final List<String> colors;
  final String size;
  int quantity;
  bool selected;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.colors,
    required this.size,
    required this.quantity,
    required this.selected,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'] ?? 'assets/images/default.png',
      price: double.parse(json['price'].toString()),
      quantity: int.parse(json['qty'].toString()),
      description: json['description'] ?? 'No description available.',
      colors: [],
      size: '',
      selected: false,
    );
  }

  static List<Product> products = [
    Product(
      id: 1,
      name: "Office Code",
      image: "lib/assets/images/product_1.jpg",
      price: 234,
      description: "High-quality handbag with modern design.",
      colors: ["blue", "red", "grey"],
      size: "12 cm",
      quantity: 1,
      selected: false,
    ),
    Product(
      id: 2,
      name: "Belt Bag",
      image: "lib/assets/images/product_2.jpg",
      price: 234,
      description: "Leather belt bag for daily use.",
      colors: ["brown", "black", "tan"],
      size: "8 cm",
      quantity: 1,
      selected: false,
    ),
    Product(
      id: 3,
      name: "Office Code",
      image: "lib/assets/images/product_3.jpg",
      price: 234,
      description: "High-quality handbag with modern design.",
      colors: ["blue", "red", "grey"],
      size: "12 cm",
      quantity: 1,
      selected: false,
    ),
    Product(
      id: 4,
      name: "Belt Bag",
      image: "lib/assets/images/product_4.jpg",
      price: 234,
      description: "Leather belt bag for daily use.",
      colors: ["brown", "black", "tan"],
      size: "8 cm",
      quantity: 1,
      selected: false,
    ),
    Product(
      id: 5,
      name: "Office Code",
      image: "lib/assets/images/product_5.jpg",
      price: 234,
      description: "High-quality handbag with modern design.",
      colors: ["blue", "red", "grey"],
      size: "12 cm",
      quantity: 1,
      selected: false,
    ),
    Product(
      id: 6,
      name: "Belt Bag",
      image: "lib/assets/images/product_6.jpg",
      price: 234,
      description: "Leather belt bag for daily use.",
      colors: ["brown", "black", "tan"],
      size: "8 cm",
      quantity: 1,
      selected: false,
    ),
    Product(
      id: 7,
      name: "Office Code",
      image: "lib/assets/images/product_7.jpg",
      price: 234,
      description: "High-quality handbag with modern design.",
      colors: ["blue", "red", "grey"],
      size: "12 cm",
      quantity: 1,
      selected: false,
    ),
    Product(
      id: 8,
      name: "Belt Bag",
      image: "lib/assets/images/product_8.jpg",
      price: 234,
      description: "Leather belt bag for daily use.",
      colors: ["brown", "black", "tan"],
      size: "8 cm",
      quantity: 1,
      selected: false,
    ),
    Product(
      id: 9,
      name: "Office Code",
      image: "lib/assets/images/product_9.jpg",
      price: 234,
      description: "High-quality handbag with modern design.",
      colors: ["blue", "red", "grey"],
      size: "12 cm",
      quantity: 1,
      selected: false,
    ),
    Product(
      id: 10,
      name: "Belt Bag",
      image: "lib/assets/images/product_9.jpg",
      price: 234,
      description: "Leather belt bag for daily use.",
      colors: ["brown", "black", "tan"],
      size: "8 cm",
      quantity: 1,
      selected: false,
    ),
  ];
}
