import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_work_movie/controller/DataController.dart';
import 'package:home_work_movie/global/global.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String mode = "kr";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("언어 선택"),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap: () async {
                        prefs.setString('language', 'ko-KR');
                        controller.getProductList("now_playing", "ko-KR", 1);
                        mode = "kr";
                        setState(() {});
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: prefs.getString('language') == 'ko-KR' ? Colors.red : Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("한국어"),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () async {
                        prefs.setString('language', 'en-US');
                        controller.getProductList("now_playing", "en-US", 1);
                        mode = "en";
                        setState(() {});
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: prefs.getString('language') == 'en-US' ? Colors.red : Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("English"),
                      )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
