import 'package:dio/dio.dart';
import 'package:flutter_application_1/feature/home_page/data/product_model/product.dart';

class Apicall {
   Dio dio = Dio();
   Apicall();

    Future<List<Product>> getProducts() async {
      Response response = await dio.get("https://dummyjson.com/products");
      List<dynamic> productsData = response.data['products'];
      return productsData.map((e) => Product.fromJson(e)).toList();
    }
}
