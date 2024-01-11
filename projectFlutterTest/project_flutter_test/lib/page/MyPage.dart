import 'package:flutter/material.dart';

//StatefulWidget -> 변화를 감지시킬수 있음
class MyPage extends StatefulWidget {

  final String name;
  final int age;

  const MyPage({super.key, required this.name, required this.age});

  @override
  State<MyPage> createState() => _MyPageState();
}

//자식이 부모 파라미터를 써야 할때는 widget.변수명
class _MyPageState extends State<MyPage> {

  @override
  void initState() {

    fullProfile = widget.name + widget.age.toString() + "세";

    super.initState();
  }

  String fullProfile="";
  int count = 0;
  bool over5 = false;

  void checkCount() {
    if( count < 5 ) {
      over5 = false;
    } else if( count>=5 && count < 7 ) {
      over5 = true;
      print("count 가 너무 높습니다.");
    } else if( count >=7 && count <10) {
      over5 = true;
      print("count 가 7 이상입니다. 위험합니다 그만누르세요.");
    } else {
      over5 = true;
      print("count 가 10 이상입니다. 마음대로 하세요. 평생누르세요");
    }
  }

  void checkName() {

    switch(widget.name) {
      case "홍길동" : print("이사람 이름은 홍길동입니다");
      break;
      case "이사라" : print("이사람 이름은 이사라입니다"); print("ㅋㅋ");
      break;
      case "김명준" : print("이사람 이름은 김명준입니다");
      break;
      default : print("");
    }

  }

  void printNumber() {
    for(int i =0; i<10; ++i) {
      if(widget.age ==i) {

        break;

      }
      print(i);
    }
  }

  void printFriends() {
    List<String> friends = ["철수", "영희", "민지"];

    for(String name in friends) {
      print(name + "\nworld");
    }
  }

  void printFriendsForEach() {
    List<String> friends = ["철수", "영희", "민지"];

    friends.forEach((element) {
      print(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.name}의 페이지}"),),
      body: GestureDetector(
        onTap: (){
          //화면 갱신 코드
          setState(() {
            //내부코드 실행 후 화면 갱신
            count ++;
          });
          // checkCount();
          // checkName();
          // printNumber();
          // printFriends();
          printFriendsForEach();
        },
        child: Center(
          child: Column(
            children: [
              if(over5)
                Text("count가 5 이상일때만 나타나는 위젯", style: TextStyle(color: count>=10 ? Colors.blue : Colors.red),),
              Text(fullProfile),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(child: Text(count.toString())),
              ),
            ],
          )
        ),
      ),
    );
  }
}
