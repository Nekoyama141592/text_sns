import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final rxAuthUser = Rx<User?>(null);
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

  void onToggleLoginModeButtonPressed() => _toggleIsLoginMode();
  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
}
