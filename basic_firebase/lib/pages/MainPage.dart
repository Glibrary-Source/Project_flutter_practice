
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  //firestore 인스턴스 생성
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  void getData() async {
    CollectionReference post = firestore.collection('Post');
    QuerySnapshot querySnapshot = await post.get();

    QueryDocumentSnapshot d = querySnapshot.docs[0];
    print(d.data());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Test"), backgroundColor: Colors.blue,),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                getData();
              },
              child: Text("파이어스토어 데이터 불러오기"),
            )
          ],
        ),
      )
    );
  }
}
