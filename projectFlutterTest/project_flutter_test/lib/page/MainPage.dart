import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter_test/component/ProductWidget.dart';
import 'package:project_flutter_test/page/MyPage.dart';

import '../vo/Product.dart';
import 'MemberListPage.dart';
import 'StoreListPage.dart';

class MainPage extends StatelessWidget {

  MainPage({Key? key}) : super(key: key);

  Product product1 = Product(
    productName: "의자",
    imagePath: "assets/images/chair.jpg",
    price: "3,000 원"
  );

  Product product2 = Product(
      productName: "냉장고",
      imagePath: "assets/images/refrigerator.jpg",
      price: "5,000 원"
  );

  Product product3 = Product(
      productName: "자동차",
      imagePath: "assets/images/car.jpg",
      price: "6,000 원"
  );

  Product product4 = Product(
      productName: "에어컨",
      imagePath: "assets/images/air.jpg",
      price: "7,000 원"
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("사무실쇼핑몰"), centerTitle: true, backgroundColor: Colors.orangeAccent,),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [


              SizedBox(height: 50,),
              Row(
                children: [
                  ProductWidget(item: product1),
                  SizedBox(width: 10,),
                  ProductWidget(item: product2),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  ProductWidget(item: product3),
                  SizedBox(width: 10,),
                  ProductWidget(item: product4),
                ],
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  Get.to(() => MemberListPage());
                },
                child: Text("회원목록 보러 가기"),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.to(() => StoreListPage());
                },
                child: Text("매장목록 보러 가기"),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.to(() => MyPage(name: "홍길동", age: 30,));
                },
                child: Text("마이페이지"),
              ),
            ],
          ),
        ));
  }
}
