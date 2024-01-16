import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_work_movie/controller/DataController.dart';
import 'package:home_work_movie/page/MainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/global.dart';

void main() async {

  //sharedPreferences 초기화
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  if(prefs.getString('language') == null) {
    prefs.setString('language', "ko-KR");
  } else {
    print('이미있음 ${prefs.getString('language')}');
  }

  // DataController 초기화
  Get.put(DataController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}