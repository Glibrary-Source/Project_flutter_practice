import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter_test/vo/Product.dart';

class ProductDetailPage extends StatelessWidget {

  String productName;
  String imagePath;
  String price;

  ProductDetailPage({Key? key , required this.productName , required this.imagePath , required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$productName 상세 페이지"),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(productName),
              SizedBox(height: 50,),
              Image.asset(imagePath),
              SizedBox(height: 50,),
              Text(price),
              SizedBox(height: 20,),
              Text("구매자 목록"),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        border: Border.all(color: Colors.black)
                    ),

                    child: Center(child: Text("김철수")),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
