import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/constant/verify_email_constant.dart';
import 'package:text_sns/controllers/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailController());
    const style = TextStyle(fontSize: 40.0);
    return const Center(
      child: Text(
        VerifyEmailConstant.verifyEmailTitle,
        style: style,
      ),
    );
  }
}
