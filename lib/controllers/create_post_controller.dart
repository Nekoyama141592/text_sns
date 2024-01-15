import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/core/firestore/doc_ref_core.dart';
import 'package:text_sns/core/id_core/id_core.dart';
import 'package:text_sns/models/post/post.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/ui_core/validator_core.dart';

class CreatePostController extends SimpleFormController {
  @override
  String get title => "投稿を作成";
  @override
  String get hintText => "コンテンツの文章";
  @override
  String? Function(String? p1)? get validator => ValidatorCore.text;
  @override
  String get positiveButtonText => "作成する";
  @override
  String get successMsg => "投稿の作成が成功しました";
  @override
  String get failureMsg => "投稿の作成が失敗しました";
  @override
  void onPositiveButtonPressed() async {
    if (!ValidatorCore.isValidText(text)) return;
    final repository = FirestoreRepository();
    final user = AuthController.to.rxAuthUser.value;
    if (user == null) return;
    final uid = user.uid;
    final postId = IDCore.uuidV4();
    final ref = DocRefCore.postDocRef(uid, postId);
    final Timestamp now = Timestamp.now();
    final parentDocRef = DocRefCore.publicUserDocRef(uid);
    final post = Post(
        content: text, createdAt: now, parentDocRef: parentDocRef, uid: uid);
    final data = post.toJson();
    final result = await repository.createDoc(ref, data);
    result.when(success: (_) {
      UIHelper.showFlutterToast(successMsg);
      Get.back();
    }, failure: () {
      UIHelper.showFlutterToast(failureMsg);
    });
  }
}
