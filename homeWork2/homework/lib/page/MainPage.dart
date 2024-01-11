import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_homework/model/ProductModel.dart';

import '../component/ProductGridViewWidget.dart';
import '../component/ProductListViewWidget.dart';
import 'MyPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int mode = 0;

  ProductModel? productModel;

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  void getProductList() async {
    String jsonString =
        await rootBundle.loadString('assets/json/product_json.json');

    Map<String, dynamic> mapData = json.decode(jsonString);
    ProductModel model = ProductModel.fromJson(mapData);
    setState(() {
      productModel = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("싱싱마을"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => MyPage());
            },
            child: Center(
              child: Text("마이페이지"),
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        mode = 0;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: mode == 0 ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("그리드 뷰"),
                    )),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        mode = 1;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: mode == 1 ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("리스트 뷰"),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("결과 : ${productModel?.totalCount}개"),
            SizedBox(
              height: 10,
            ),
            if (mode == 0)
              Expanded(
                  child: (productModel == null || productModel?.data == null)
                      ? SizedBox()
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: productModel!.data!.length,
                          itemBuilder: (context, index) {
                            return ProductGridViewWidget(
                                item: productModel!.data![index]);
                          })),
            if (mode == 1)
              Expanded(
                  child: (productModel == null || productModel?.data == null)
                      ? SizedBox()
                      : ListView.builder(
                          itemCount: productModel!.data!.length,
                          itemBuilder: (context, index) {
                            return ProductListViewWidget(
                                item: productModel!.data![index]);
                          }))
          ],
        ),
      ),
    );
  }
}
