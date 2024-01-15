import 'package:text_sns/controllers/abstract/posts_controller.dart';
import 'package:text_sns/core/firestore/qury_core.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

class LatestPostsController extends PostsController {
  @override
  MapQuery get query => QueryCore.postsCollectionQuery();
}
