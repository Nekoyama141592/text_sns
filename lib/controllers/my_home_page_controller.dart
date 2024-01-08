import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:text_sns/models/public_user/public_user.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

class MyHomePageController extends GetxController {
  final rxDoc = Rx<Doc?>(null);

  void onFloatingActionButtonPressed() async {
    await _createDoc();
  }

  Future<void> _createDoc() async {
    final repository = FirestoreRepository();
    const user = PublicUser(uid: "fromRepository");
    final ref = FirebaseFirestore.instance.collection('users').doc(user.uid);
    final data = user.toJson();
    final result = await repository.createDoc(ref, data);
    result.when(success: (_) async {
      await _readDoc(ref);
    }, failure: () {
      debugPrint("ユーザーの作成が失敗しました");
    });
  }

  Future<void> _readDoc(DocRef ref) async {
    final repository = FirestoreRepository();
    final result = await repository.getDoc(ref);
    result.when(success: (doc) {
      rxDoc.value = doc;
      debugPrint("ユーザーの読み取りが成功しました！");
    }, failure: () {
      debugPrint("ユーザーの読み取りが失敗しました");
    });
  }
}
