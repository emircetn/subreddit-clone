import 'package:flutter/material.dart';
import 'package:reddit_clone/core/components/app/items/post_item.dart';
import 'package:reddit_clone/core/components/future_builder/special_future_builder.dart';
import 'package:reddit_clone/home/model/post_model.dart';
import 'package:reddit_clone/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, widget) {
          return Scaffold(
            appBar: appBar(),
            body: body(context, viewModel),
          );
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Reddit Clone'),
    );
  }

  Widget body(BuildContext context, HomeViewModel viewModel) {
    return SpecialFutureBuilder<List<PostModel>?>(
      future: viewModel.postsFuture,
      onSuccess: (postList) {
        return postListField(context, postList!);
      },
    );
  }

  Widget postListField(BuildContext context, List<PostModel> postList) {
    return ListView.builder(
      itemCount: postList.length,
      itemBuilder: (context, index) {
        return PostItem(postModel: postList[index]);
      },
    );
  }
}
