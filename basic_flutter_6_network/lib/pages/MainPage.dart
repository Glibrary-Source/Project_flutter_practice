import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../controller/DataController.dart';
import '../model/ProductModel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(title: Text("MainPage"),),
              body: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      controller.getProductList();
                    },
                    child: Text("요청하기"),
                  ),
                  if(controller.productModel != null)
                    Expanded(
                        child: ListView.builder(
                            itemCount: controller.productModel?.products?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  margin: EdgeInsets.symmetric(vertical:  5),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    children: [
                                      Image.network(controller.productModel?.products?[index]?.thumbnail??"" , width: 50, height: 50, fit: BoxFit.cover,),
                                      SizedBox(width: 10,),
                                      Text(controller.productModel?.products?[index]?.title??""),
                                    ],
                                  ));
                            })
                    ),

                ],
              )
          );
        }
    );
  }
}
