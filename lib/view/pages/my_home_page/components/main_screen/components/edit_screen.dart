import 'package:flutter/material.dart';
import 'package:text_sns/view/common/rounded_button.dart';
import 'package:text_sns/view/common/text_field_container.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_titleWidget(), _form(), _positiveButton()],
    );
  }

  // タイトル関数
  Widget _titleWidget() {
    return const Text(
      "ユーザー情報を編集",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  // 入力フォーム関数
  Widget _form() {
    return Form(key: _formKey, child: _nameTextField());
  }

  // name入力をする関数
  Widget _nameTextField() {
    return TextFieldContainer(
        child: TextFormField(
      decoration: const InputDecoration(hintText: "ニックネーム"),
    ));
  }

  // 送信するボタン
  Widget _positiveButton() {
    return const RoundedButton(color: Colors.green, textValue: "更新する");
  }
}
