
import 'package:flutter/material.dart';

import '../vo/StoreProduct.dart';

class StoreDetailPage extends StatefulWidget {

  final StoreProduct storeProduct;

  const StoreDetailPage({super.key, required this.storeProduct});

  @override
  State<StoreDetailPage> createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {

  bool select = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.storeProduct.productName??""),),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                widget.storeProduct.imagePath??"",
                width: double.infinity,
                height: 300,
                fit: BoxFit.fill,
              ),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if(select) {
                          select = false;
                        } else {
                          select = true;
                        }
                      });
                    },
                    child: Icon( select == true ? Icons.favorite : Icons.favorite_outline, color: Colors.red,))
                  )
            ],
          ),
          SizedBox(height: 20,),
          Text(widget.storeProduct.productName??""),
          SizedBox(height: 20,),
          Text(widget.storeProduct.price??"")
        ],
      ),
    );
  }
}
