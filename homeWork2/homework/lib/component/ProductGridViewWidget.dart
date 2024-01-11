import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/ProductDetailPage.dart';
import '../vo/Product.dart';

class ProductGridViewWidget extends StatefulWidget {
  final Product item;
  const ProductGridViewWidget({Key? key , required this.item}) : super(key: key);

  @override
  State<ProductGridViewWidget> createState() => _ProductGridViewWidgetState();
}

class _ProductGridViewWidgetState extends State<ProductGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductDetailPage(item:widget.item));
      },
      child: Container(
        color: Colors.orange,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: Image.network(widget.item.imagePath??"",fit: BoxFit.cover,)
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(child: Text("${widget.item.price} 원")),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(child: Text("${widget.item.name}")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}