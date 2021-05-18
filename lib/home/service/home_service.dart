import 'dart:io';

import 'package:dio/dio.dart';
import 'package:reddit_clone/home/model/post_model.dart';

class HomeService {
  final Dio dio = Dio();

  final String url = 'https://www.reddit.com/r/flutterdev/top.json?count=20';

  Future<List<PostModel>?> getPosts() async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        if (response.data != null) {
          var list = <PostModel>[];
          var postJsonList = response.data['data']['children'];
          if (postJsonList != null) {
            for (var onePost in postJsonList) {
              if (onePost['data'] != null) {
                list.add(PostModel.fromMap(onePost['data']));
              }
            }
          }
          return list;
        }
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
