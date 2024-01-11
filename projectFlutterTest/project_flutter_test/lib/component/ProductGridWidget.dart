import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter_test/homework2/StoreDetailPage.dart';

import '../vo/StoreProduct.dart';

class ProductGridWidget extends StatelessWidget {

  final List<StoreProduct> storeProduct;

  const ProductGridWidget({super.key, required this.storeProduct});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            itemCount: storeProduct.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.to(StoreDetailPage(storeProduct: storeProduct[index]));
                },
                child: Stack(
                  children: [
                    Image.network(
                      storeProduct[index].imagePath ?? "",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        bottom: 10,
                        left: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            color: Colors.blueAccent,
                            child: Center(
                                child: Text(storeProduct[index].price ?? "")),
                          ),
                        )),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          color: Colors.red,
                          child: Center(
                              child: Text(storeProduct[index].productName ?? "")),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
