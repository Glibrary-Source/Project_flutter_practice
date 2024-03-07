import 'package:basic_firebase/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email = "";
  String? password = "";
  String? passwordConfirm = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("SignUpPage"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            children: [
              Text("회원가입"),
              SizedBox(
                height: 25,
              ),
              Text("이메일"),
              TextField(
                decoration: InputDecoration(hintText: "이메일을 입력해주세요."),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 8,
              ),
              Text("비밀번호"),
              TextField(
                decoration: InputDecoration(hintText: "비밀번호를 입력해주세요."),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 8,
              ),
              Text(" 비밀번호확인"),
              TextField(
                decoration: InputDecoration(hintText: "비밀번호를 입력해주세요."),
                onChanged: (value) {
                  setState(() {
                    passwordConfirm = value;
                  });
                },
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (email == null ||
                        email == "" ||
                        password == null ||
                        password == "" ||
                        passwordConfirm == null ||
                        passwordConfirm == "") {
                      print("똑바로 입력하세요");
                    } else {
                      if (password != passwordConfirm) {
                        print("비밀번호를 확인하세요");
                      } else {
                        //모든 validation 확인이 끝난후 가능
                        await controller.addUser(email!, password!);
                        print("성공!");
                        Get.back();
                      }
                    }
                    ;
                  },
                  child: Text("회원가입"))
            ],
          ),
        ),
      );
    });
  }
}
