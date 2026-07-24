import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home_page/data/product_model/product.dart';
import 'package:flutter_application_1/feature/product_details/presentation/views/widgets/comments.dart';
import 'package:flutter_application_1/feature/product_details/presentation/views/widgets/details_product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productScreen = "/ProductDetails";
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product?;
    return Scaffold(
      appBar: AppBar(
        title: Text(product!.title!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.thumbnail!,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              product.title!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '${product.brand} - SKU: ${product.sku}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.green
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      '${product.rating}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${product.reviews?.length} reviews)',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Discount: ${product.discountPercentage}%',
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description!,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
            DetailsProduct(product: product),
            const Text(
              'Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (product.reviews != null && product.reviews!.isNotEmpty)
              ...product.reviews!.map((review) {
                String initials = review.reviewerName![0].toUpperCase();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Comments(
                    name: review.reviewerName!,
                    date: '${review.date!.day}/${review.date!.month}/${review.date!.year}',
                    rating: review.rating!,
                    comment: review.comment!,
                    text: initials,
                    color: Colors.blue[50]!,
                  ),
                );
              })
            else
              const Text('No reviews yet.'),
          ],
        ),
      ),
    );
  }
}
