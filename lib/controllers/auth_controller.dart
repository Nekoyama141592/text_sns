import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final rxAuthUser = Rx<User?>(FirebaseAuth.instance.currentUser);
  final rxIsLoginMode = true.obs;
  String email = "";
  String password = "";

  void setEmail(String? value) {
    // valueがnullなら処理を終了させる
    if (value == null) return;
    email = value;
  }

  void setPassword(String? value) {
    // valueがnullなら処理を終了させる
    if (value == null) return;
    password = value;
  }

  void onPositiveButtonPressed() async {
    if (GetUtils.isEmail(email) && password.length >= 8) {
      rxIsLoginMode.value
          ? await _signInWithEmailAndPassword()
          : await _createUserWithEmailAndPassword();
    }
  }

  Future<void> _createUserWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.createUserWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(success: (res) {
      rxAuthUser.value = res;
      UIHelper.showFlutterToast("新規登録が成功しました");
    }, failure: () {
      UIHelper.showFlutterToast("新規登録が失敗しました");
    });
  }

  Future<void> _signInWithEmailAndPassword() async {}

  void onSignOutButtonPressed() async {
    await _signOut();
  }

  Future<void> _signOut() async {
    final repository = AuthRepository();
    final result = await repository.signOut();
    result.when(success: (_) {
      rxAuthUser.value = null;
      UIHelper.showFlutterToast("ログアウトが成功しました");
    }, failure: () {
      UIHelper.showFlutterToast("ログアウトが失敗しました");
    });
  }

  void onToggleLoginModeButtonPressed() => _toggleIsLoginMode();
  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
}
