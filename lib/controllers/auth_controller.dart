import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:text_sns/constant/auth_constant.dart';
import 'package:text_sns/enums/reauthenticate_purpose.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/dialog_core.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/view/pages/logouted_page.dart';
import 'package:text_sns/view/pages/reauthenticate_page.dart';

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
      UIHelper.showFlutterToast(AuthConstant.signupSuccessMsg);
    }, failure: () {
      UIHelper.showFlutterToast(AuthConstant.signupFailureMsg);
    });
  }

  Future<void> _signInWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.signInWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(success: (res) {
      rxAuthUser.value = res;
      UIHelper.showFlutterToast(AuthConstant.signInSuccessMsg);
    }, failure: () {
      UIHelper.showFlutterToast(AuthConstant.signInFailureMsg);
    });
  }

  void onSignOutButtonPressed() async {
    DialogCore.cupertinoAlertDialog("ログアウトを行いますがよろしいですか？", "ログアウトの確認",
        () async {
      await _signOut();
    });
  }

  Future<void> _signOut() async {
    final repository = AuthRepository();
    final result = await repository.signOut();
    result.when(success: (_) {
      Get.toNamed(LogoutedPage.path);
      UIHelper.showFlutterToast(AuthConstant.signOutSuccessMsg);
    }, failure: () {
      UIHelper.showFlutterToast(AuthConstant.signOutFailureMsg);
    });
  }

  void onToggleLoginModeButtonPressed() => _toggleIsLoginMode();
  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;

  void onEditEmailButtonPressed() {
    Get.toNamed(ReauthenticatePage.generatePath(
        ReauthenticatePurpose.updateEmail.name));
  }
}
