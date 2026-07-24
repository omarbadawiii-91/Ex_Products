import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home_page/data/product_model/product.dart';

class DetailsProduct extends StatelessWidget {
  final Product product;
  const DetailsProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            const SizedBox(height: 24),
            Text('Category: ${product.category}', style: const TextStyle(fontSize: 14)),
            Text('Stock: ${product.stock} left', style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 32),
      ],
    );
  }
}
