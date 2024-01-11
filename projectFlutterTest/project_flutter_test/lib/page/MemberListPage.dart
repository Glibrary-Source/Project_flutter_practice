import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberListPage extends StatelessWidget {
  MemberListPage({super.key});

  final List<String> member = ['김철수', '김영희', '박상희'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("멤버 리스트"),),
        body: Column(
          children: [
            Text("멤버리스트"),
            Expanded(
              child: ListView.builder(
                itemCount: member.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(member[index])),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              width: Get.width,
              color: Colors.brown,
              child: Center(child: Text("구글광고")),)
          ],
        ));
  }
}
