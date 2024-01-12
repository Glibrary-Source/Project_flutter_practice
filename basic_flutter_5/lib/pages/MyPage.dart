import 'package:basic_flutter_5/controller/UserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mypage"),),
      body: Container(
        child: Column(
          children: [
            Text("내 점수는?"),
            GetBuilder<UserController>(builder: (controller) {
                return Text(controller.userPoint.toString());
            })
          ],
        ),
      ),
    );
  }
}
