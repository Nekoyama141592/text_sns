import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:text_sns/models/public_user.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final firstUser = PublicUser(followerCount: 0, followingCount: 0, uid: "first");
            final firstData = firstUser.toJson();
            await FirebaseFirestore.instance.collection('public_users').doc(firstUser.uid).set(firstData);
            print("データの書き込みが成功しました！");
          } catch(e) {
            print("アクセスが拒否されました");
          }
        }
      ),
      body: Center(
        child: Text(
          'Hello ${F.title}',
        ),
      ),
    );
  }
}
