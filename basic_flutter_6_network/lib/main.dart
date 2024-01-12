import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/DataController.dart';
import 'global/global.dart';
import 'pages/MainPage.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  if(prefs.getInt('userAge')==null){
    await prefs.setInt('userAge', 10);
    print("값이 없어서 새로 세팅완료!! ${prefs.getInt('userAge')}");
  } else {
    print("이미 있었음!! ${prefs.getInt('userAge')}");
  }

  // logger.t("Trace log");
  // logger.d("Debug log");
  // logger.i("Info log");
  // logger.w("Waring log");
  // logger.e("Error log", error: 'Test Error');
  // logger.f("What a fatal log");

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