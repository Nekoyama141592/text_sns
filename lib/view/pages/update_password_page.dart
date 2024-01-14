import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/constant/account_constant.dart';
import 'package:text_sns/controllers/update_password_controller.dart';
import 'package:text_sns/view/abstract/simple_form_state.dart';
import 'package:text_sns/view/common/basic_page.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);
  static const path = "/updatePassword";
  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends SimpleFormState<UpdatePasswordPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePasswordController());
    return BasicPage(
        appBarTitle: AccountConstant.updatePasswordPageTitle,
        child: buildWidget(controller));
  }
}
