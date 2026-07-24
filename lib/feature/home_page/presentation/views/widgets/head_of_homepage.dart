import 'package:flutter/material.dart';

class HeadOfHomePage extends StatelessWidget {
  const HeadOfHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                color: Colors.grey,
              ),
            ),
            Text(
              "Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
                fontFamily: "poppins",
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30)),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_sharp, size: 30),
            ),
          ],
        ),
      ],
    );
  }
}
