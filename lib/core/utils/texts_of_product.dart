import 'package:flutter/material.dart';

class TextsOfProduct {
  static Text brandtext(String brand) {
    return Text(
      brand,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text productname(String product) {
    return Text(
      product,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  static Text price(String price) {
    return Text(
      "\$$price",
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
