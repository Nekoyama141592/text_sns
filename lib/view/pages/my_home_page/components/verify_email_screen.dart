import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 40.0);
    return const Center(
      child: Text(
        "メールアドレスを認証する",
        style: style,
      ),
    );
  }
}
