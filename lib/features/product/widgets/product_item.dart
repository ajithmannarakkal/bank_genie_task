import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          // color: Colors.grey
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Image.network(
                  product.thumbnail!,
                  width: 100,
                  height: 100,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title!,
                  textAlign: TextAlign.start,
                  style: TextStyle(),
                  ),
                  Text(product.price.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
