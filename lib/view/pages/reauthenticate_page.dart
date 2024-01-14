import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/reauthenticate_controller.dart';
import 'package:text_sns/view/abstract/simple_form_state.dart';
import 'package:text_sns/view/common/basic_page.dart';

class ReauthenticatePage extends StatefulWidget {
  const ReauthenticatePage({Key? key}) : super(key: key);
  static const path = "/reauthenticate/:purpose";
  static String generatePath(String purpose) => "/reauthenticate/$purpose";
  @override
  State<ReauthenticatePage> createState() => _ReauthenticatePageState();
}

class _ReauthenticatePageState extends SimpleFormState<ReauthenticatePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReauthenticateController());
    return BasicPage(appBarTitle: "再認証を行う", child: buildWidget(controller));
  }
}
