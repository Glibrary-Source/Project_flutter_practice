import 'package:basic_flutter_5/controller/UserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyPage.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
  }

  int point = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(title: const Text("Mainpage", style: TextStyle(color: Colors.white)),backgroundColor: Colors.lightBlue),
            body: Column(
              children: [
                Container(
                  child: Text(controller.userPoint.toString()),
                ),
                Container(
                  child: Text("나의 포인트"),
                ),
                GestureDetector(
                  onTap: (){
                    controller.addUserPoint();
                  },
                  child: Text("포인트 올리기 버튼"),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=> MyPage());
                  },
                  child: Text("마이페이지로 넘어가기"),
                )
              ],
            ),
          );
        }
    );
  }
}
