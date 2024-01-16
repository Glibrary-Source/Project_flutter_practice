import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_work_movie/component/MovieGridViewWidget.dart';
import 'package:home_work_movie/component/MovieMenuWidget.dart';
import 'package:home_work_movie/global/HttpService.dart';
import 'package:home_work_movie/global/global.dart';
import 'package:home_work_movie/vo/Results.dart';

import '../controller/DataController.dart';
import 'SettingPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  HttpService httpService = HttpService();
  String mode = "now_playing";

  @override
  Widget build(BuildContext context) {
    double aspectRatio =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;

    return GetBuilder<DataController>(
      builder: (controller) {
        if(movieMenuStart??true) {controller.getProductList("now_playing", prefs.getString('language') ?? "ko-KR", 1); movieMenuStart = false;}
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "영화 리스트",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.lightBlue,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2023/05/02/21/08/river-7966163_1280.png',
                      fit: BoxFit.cover,
                    )),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Get.back();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Get.to(() => SettingPage());
                  },
                )
              ],
            ),
          ),
          body: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      MovieMenuWidget(
                        onTap: () async {
                          controller.getProductList("now_playing",
                              prefs.getString('language') ?? "ko-KR", 1);
                          mode = "now_playing";
                          setState(() {});
                        },
                        text: "현재 상영중",
                        isSelected: mode == "now_playing",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MovieMenuWidget(
                        onTap: () async {
                          controller.getProductList("popular",
                              prefs.getString('language') ?? "ko-KR", 1);
                          mode = "popular";
                          setState(() {});
                        },
                        text: "인기영화",
                        isSelected: mode == "popular",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MovieMenuWidget(
                        onTap: () async {
                          controller.getProductList("top_rated",
                              prefs.getString('language') ?? "ko-KR", 1);
                          mode = "top_rated";
                          setState(() {});
                        },
                        text: "탑 영화",
                        isSelected: mode == "top_rated",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MovieMenuWidget(
                        onTap: () async {
                          controller.getProductList("upcoming",
                              prefs.getString('language') ?? "ko-KR", 1);
                          mode = "upcoming";
                          setState(() {});
                        },
                        text: "개봉예정",
                        isSelected: mode == "upcoming",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: aspectRatio,
                          ),
                          itemCount:
                              controller.movieModel?.results?.length ?? 0,
                          itemBuilder: (context, index) {
                            return MovieGridViewWidget(
                              item: controller.movieModel?.results?[index] ??
                                  Results(),
                            );
                          })),
                ],
              )),
        );
      },
    );
  }
}
