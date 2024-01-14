import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/ui_core/validator_core.dart';

class UpdateEmailController extends SimpleFormController {
  @override
  String get title => "更新";
  @override
  String get hintText => "新しいメールアドレス";
  @override
  String? Function(String? p1)? get validator => ValidatorCore.email;
  @override
  String get positiveButtonText => "メールを受け取る";
  @override
  String get successMsg => "メールを送信しました";
  @override
  String get failureMsg => "メールの送信に失敗しました";
  @override
  void onPositiveButtonPressed() async {
    final repository = AuthRepository();
    final user = AuthController.to.rxAuthUser.value;
    if (user == null || !ValidatorCore.isValidEmail(text)) return;
    final result = await repository.verifyBeforeUpdateEmail(user, text);
    result.when(success: (_) {
      UIHelper.showFlutterToast(successMsg);
      Get.back();
      Get.back(); // ページを二つ戻る
    }, failure: () {
      UIHelper.showFlutterToast(failureMsg);
    });
  }
}
