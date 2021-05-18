import 'package:flutter/cupertino.dart';
import 'package:reddit_clone/home/model/post_model.dart';

import 'package:reddit_clone/home/service/home_service.dart';

class HomeViewModel extends ChangeNotifier {
  late HomeService service;
  Future<List<PostModel>?>? postsFuture;

  HomeViewModel() {
    service = HomeService();
    postsFuture = getPosts();
  }
  Future<List<PostModel>?> getPosts() async {
    return await service.getPosts();
  }
}
