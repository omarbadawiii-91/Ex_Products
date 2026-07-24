import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/texts_of_product.dart';
import 'package:flutter_application_1/feature/home_page/presentation/views/widgets/card_widgets/discount_of_product.dart';
import 'package:flutter_application_1/feature/home_page/presentation/views/widgets/card_widgets/image_of_card.dart';
import 'package:flutter_application_1/feature/home_page/presentation/views/widgets/card_widgets/price_and_strok.dart';
import 'package:flutter_application_1/feature/home_page/presentation/views/widgets/card_widgets/rating_review.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final int discountPercent;
  final String brand;
  final String productName;
  final double rating;
  final int reviewsCount;
  final double price;
  final bool inStock;
  final void Function()? onTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.discountPercent,
    required this.brand,
    required this.productName,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    this.inStock = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageOfCard(imageUrl: imageUrl),
                Positioned(
                  top: 8,
                  left: 8,
                  child: DiscountOfProduct(discountPercent: discountPercent),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextsOfProduct.brandtext(brand),
                  const SizedBox(height: 2),

                  TextsOfProduct.productname(productName),
                  const SizedBox(height: 6),

                  RatingAndReview(rating: rating, reviewsCount: reviewsCount),
                  const SizedBox(height: 8),

                  PriceAndStrok(price: price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
