import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/view/pages/update_email_page.dart';

class ReauthenticateController extends SimpleFormController {
  @override
  String get title => "再認証";
  @override
  String get hintText => "現在のパスワード";
  @override
  String get validatorMsg => "8文字以上のパスワードを入力して下さい";
  @override
  String get positiveButtonText => "送信";
  @override
  String get successMsg => "再認証に成功しました";
  @override
  String get failureMsg => "再認証に失敗しました";
  @override
  bool get obscureText => true;

  @override
  void onPositiveButtonPressed() async {
    if (text.length < 8) return; // パスワードが8文字より短ければ終了させる
    final repository = AuthRepository();
    final user = AuthController.to.rxAuthUser.value;
    if (user == null) return;
    final result = await repository.reauthenticateWithCredential(user, text);
    result.when(success: (_) {
      final purpose = Get.parameters['purpose'];
      if (purpose == "updateEmail") {
        Get.toNamed(UpdateEmailPage.path);
      }
      UIHelper.showFlutterToast(successMsg);
    }, failure: () {
      UIHelper.showFlutterToast(failureMsg);
    });
  }
}
