import 'package:flutter/material.dart';
import 'package:text_sns/view/common/basic_page.dart';

class UserDeletedPage extends StatelessWidget {
  const UserDeletedPage({Key? key}) : super(key: key);
  static const path = "/userDeleted";
  @override
  Widget build(BuildContext context) {
    return const BasicPage(
        child: Align(
      alignment: Alignment.center,
      child: Text(
        "ユーザーを削除しました。お疲れ様でした。",
        style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
