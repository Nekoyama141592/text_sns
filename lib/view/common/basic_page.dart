import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  const BasicPage({Key? key,required this.appBarTitle,required this.child}) : super(key: key);
  final String appBarTitle;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      )
    );
  }
}