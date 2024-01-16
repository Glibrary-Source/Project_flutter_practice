

import 'package:basic_firebase/model/post_list_model.dart';
import 'package:basic_firebase/vo/postVo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference post = firestore.collection('post');


class SaranFirebaseService {


  Future<PostListModel> getPostList() async {

    try {
      QuerySnapshot querySnapshot = await post.where("isDeleted" , isEqualTo: false).get()
          return PostListModel.fromQuerySnapshot(querySnapshot);
    } catch(error) {
      throw Exception(error);
    }
  }


  Future<PostVo> getPostDetail(String docId) async {
    try {
      DocumentSnapshot documentSnapshot = await post.doc(docId).get();
      return PostVo.fromDocumentSnapshot(documentSnapshot);
    } catch(error) {
      throw Exception(error);
    }
  }
}