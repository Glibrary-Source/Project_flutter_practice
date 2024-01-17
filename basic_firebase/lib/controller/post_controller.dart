

import 'package:basic_firebase/model/post_list_model.dart';
import 'package:basic_firebase/service/saran_firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../vo/postVo.dart';

class PostController extends GetxController {

  final SaranFirebaseService saranFirebaseService = SaranFirebaseService();

  List<PostVo> postList = [];

  Future<void> getPostList() async {
    try {
      PostListModel postListModel = await saranFirebaseService.getPostList();
      postList.clear();
      postList.addAll(postListModel.postList!);
      update();
    } catch(error) {
      throw Exception(error);
    }
  }

  Future<PostVo> getCommunityDetail(String docId) async {
    try {
      PostVo postDetail = await saranFirebaseService.getPostDetail(docId);
      return postDetail;
    } catch(error) {
      throw Exception(error);
    }
  }

  Future<void> writePost(PostVo userPost) async {
    try {
      await saranFirebaseService.writePost(userPost);
    } catch(error) {
      throw Exception(error);
    }
  }

  Future<void> updatePost({required String docId , required String contents}) async {
    try {
      await saranFirebaseService.updatePost(docId : docId, contents : contents);
    } catch(error) {
      throw Exception(error);
    }
  }

  Future<void> deletePost({required String docId}) async {
    try {
      await saranFirebaseService.deletePost(docId);
    } catch(error) {
      throw Exception(error);
    }
  }

}