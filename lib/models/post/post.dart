import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post implements _$Post {
  const Post._();
  const factory Post({
    @Default(0) int commentCount, // コメント数
    required String content, // 投稿の中身
    required dynamic createdAt,
    @Default(0) int likeCount, // いいね数
    required dynamic parentDocRef, // 投稿者のDocRef
    required String uid, // 投稿者のUID
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Timestamp get typedCreatedAt => createdAt as Timestamp;
  DocRef get typedParentDocRef => parentDocRef as DocRef;
}
