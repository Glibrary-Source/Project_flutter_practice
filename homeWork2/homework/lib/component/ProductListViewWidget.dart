import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../page/ProductDetailPage.dart';
import '../vo/Product.dart';

class ProductListViewWidget extends StatelessWidget {
  final Product item;

  const ProductListViewWidget({super.key, required this.item,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(ProductDetailPage(item: item,));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.orangeAccent,
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: 8),
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      item.imagePath ?? "",
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name ?? ""),
                  Text("${item.price} 원")
                ],
              ),
            ],
          ),
        ));
  }
}
