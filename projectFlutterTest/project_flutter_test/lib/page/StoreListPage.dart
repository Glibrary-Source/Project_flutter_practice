import 'package:flutter/material.dart';

class StoreListPage extends StatelessWidget {
  StoreListPage({super.key});

  final List<String> storeList = ['여의도점', '김포점', '부산서면점'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("매장목록 페이지"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 그리드의 열 개수
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 5 / 4,
          ),
          itemCount: storeList.length,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  // width: 100, 그리드뷰는 아이템 속성은 무시함
                  // height: 150,
                  color: Colors.orangeAccent,
                  child: Center(child: Text(storeList[index])),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    height: 20,
                    color: Colors.red,
                    child: Center(child: Text(storeList[index])),
                  ),
                )
              ],
            );
          }
          // 그리드 아이템을 반환하는 로직
          // 예: Container, Image 등
          ),
    );
  }
}
