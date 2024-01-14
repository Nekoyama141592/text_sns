import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/ui_core/validator_core.dart';

class UpdatePasswordController extends SimpleFormController {
  @override
  String get title => "更新";
  @override
  String get hintText => "新しいパスワード";
  @override
  String? Function(String? p1)? get validator => ValidatorCore.password;
  @override
  String get positiveButtonText => "送信";
  @override
  String get successMsg => "パスワードの更新に成功しました";
  @override
  String get failureMsg => "パスワードの更新に失敗しました";
  @override
  bool get obscureText => true;
  @override
  void onPositiveButtonPressed() async {
    if (!ValidatorCore.isValidPassword(text)) return;
    final repository = AuthRepository();
    final user = AuthController.to.rxAuthUser.value;
    if (user == null) return;
    final result = await repository.updatePassword(user, text);
    result.when(success: (_) {
      UIHelper.showFlutterToast(successMsg);
      Get.back();
      Get.back();
    }, failure: () {
      UIHelper.showFlutterToast(failureMsg);
    });
  }
}
