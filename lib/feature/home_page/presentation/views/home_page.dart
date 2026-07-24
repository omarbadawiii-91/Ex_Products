import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home_page/presentation/views/widgets/card.dart';
import 'package:flutter_application_1/feature/home_page/presentation/views/widgets/head_of_homepage.dart';
import 'package:flutter_application_1/feature/product_details/presentation/views/product_details_screen.dart';
import 'package:flutter_application_1/feature/home_page/presentation/manger/Product_info_manger_cubit/product_info_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final String homePageRoute = "/";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductInfoCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              HeadOfHomePage(),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<ProductInfoCubit, ProductInfoState>(
                  builder: (context, state) {
                    if (state is ProductInfoLoading) {
                      return const Center(child: CircularProgressIndicator(
                        color: Color(0xffD94F6E),
                      ));
                    } else if (state is ProductInfoError) {
                      return Center(child: Text(state.message));
                    } else if (state is ProductInfoSuccess) {
                      final products = state.product;
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2 / 3.7,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(
                            imageUrl: product.thumbnail!,
                            discountPercent: product.discountPercentage!.toInt(),
                            brand: product.brand!,
                            productName: product.title!,
                            rating: product.rating!,
                            reviewsCount: product.reviews!.length,
                            price: product.price!,
                            inStock: product.stock! > 0,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ProductDetailsScreen().productScreen,
                                arguments: product,
                              );
                            },
                          );
                        },
                      );
                    }
                    return const Center(child: Text("No products found"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

