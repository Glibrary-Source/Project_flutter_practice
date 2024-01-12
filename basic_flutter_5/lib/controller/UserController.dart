
import 'package:get/get.dart';

class UserController extends GetxController {


  int userPoint = 0;

  Future<void> addUserPoint() async{

    userPoint++;
    update();
  }

}

//
// 이렇게 해도 상관없음
// void addUserPoint() {
//
// }