import 'package:flutter/material.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/view/common/basic_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const path = "/account";
  @override
  Widget build(BuildContext context) {
    final controller = AuthController.to;
    return BasicPage(
        appBarTitle: "アカウントページ",
        child: ListView(
          children: [
            ListTile(
              title: const Text("ログアウトを行う"),
              onTap: controller.onSignOutButtonPressed,
            )
          ],
        ));
  }
}
