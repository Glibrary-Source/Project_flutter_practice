import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homework2/StoreDetailPage.dart';
import '../vo/StoreProduct.dart';

class ProductListWidget extends StatelessWidget {
  final List<StoreProduct> storeProduct;

  const ProductListWidget({
    super.key,
    required this.storeProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: storeProduct.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Get.to(StoreDetailPage(storeProduct: storeProduct[index]));
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
                                storeProduct[index].imagePath ?? "",
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(storeProduct[index].productName ?? ""),
                            Text(storeProduct[index].price ?? "")
                          ],
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
