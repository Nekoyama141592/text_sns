import 'package:get/get.dart';
import 'package:text_sns/constant/validator_constant.dart';

class ValidatorCore {
  static bool isValidEmail(String email) => GetUtils.isEmail(email);
  static bool isValidPassword(String password) =>
      password.length >= ValidatorConstant.minPasswordLength;
  static bool isValidText(String text) => text.isNotEmpty;

  static String? email(String? value) {
    return isValidEmail(value!) ? null : "正しいメールアドレスを入力して下さい";
  }

  static String? password(String? value) {
    const minPasswordLength = ValidatorConstant.minPasswordLength;
    return isValidPassword(value!)
        ? null
        : "パスワードは$minPasswordLength文字以上にしてください";
  }

  static String? text(String? value) {
    return isValidText(value!) ? null : "入力を行って下さい";
  }
}
