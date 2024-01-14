import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
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
  }
}
