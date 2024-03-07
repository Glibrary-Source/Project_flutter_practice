import 'package:basic_firebase/controller/user_controller.dart';
import 'package:basic_firebase/pages/Sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller){
      return Scaffold(
          appBar: AppBar(
            title: Text("SignInPage"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("로그인"),
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
                  Text("비밀번호"),
                  TextField(
                    decoration: InputDecoration(hintText: "비밀번호를 입력해주세요."),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: () async {
                        if (email == null ||
                            email == "" ||
                            password == null ||
                            password == "") {
                          print("똑바로 입력하세요");
                        } else {
                          try {
                            await controller.login(email!, password!);
                            print("성공");
                            Get.back();
                          } catch(e) {
                            print("에러~");
                            print(e);
                          }
                        };
                      },
                      child: Text("로그인")),
                  SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: () async {
                        Get.to(()=> SignUpPage());
                      },
                      child: Text("회원가입 하러가기"))
                ],
              ),
            ),
          ));
    });
  }
}
