import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/ProductDetailPage.dart';
import '../vo/Product.dart';

class ProductWidget extends StatelessWidget {

  final Product item;

  const ProductWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.to(
              ProductDetailPage(productName: item.productName??"", imagePath: item.imagePath??"", price: item.price??"",));
        },
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                  width: double.infinity,
                  child: Image.asset(item.imagePath??"", fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 20,),
            Text(item.productName??""),
            Text(item.price??""),
          ],
        ),
      ),
    );
  }
}
