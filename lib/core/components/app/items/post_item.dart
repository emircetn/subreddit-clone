import 'package:flutter/material.dart';
import 'package:reddit_clone/core/components/images/special_network_image.dart';
import 'package:reddit_clone/core/components/texts/limited_text.dart';
import 'package:reddit_clone/core/extensions/app_extensions.dart';
import 'package:reddit_clone/home/model/post_model.dart';

class PostItem extends StatelessWidget {
  final PostModel postModel;
  const PostItem({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          voteField(context),
          Expanded(child: postMainField(context)),
        ],
      ),
    );
  }

  Padding voteField(BuildContext context) {
    return Padding(
      padding: context.paddingLowRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(icon: Icon(Icons.arrow_upward, color: Colors.grey), onPressed: () {}),
          Text(
            '${postModel.ups ?? '?'}',
            style: context.textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
          ),
          IconButton(icon: Icon(Icons.arrow_downward, color: Colors.grey), onPressed: () {}),
        ],
      ),
    );
  }

  Padding postMainField(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          informationField(context),
          textAndThumbnailField(context),
        ],
      ),
    );
  }

  Text informationField(BuildContext context) {
    return Text(
      'Posted by u/${postModel.authorFullname ?? '?'} ${postModel.showDate}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.caption,
    );
  }

  Row textAndThumbnailField(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: textField(context)),
        thumbnailField(context),
      ],
    );
  }

  Widget textField(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textTitleField(context),
        textSubtitleField(context),
      ],
    );
  }

  Widget textTitleField(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Text(
        postModel.title ?? '?',
        style: context.textTheme.bodyText1,
      ),
    );
  }

  Widget textSubtitleField(BuildContext context) {
    if (postModel.selftext == null) {
      return Text('?');
    }
    return LimitedText(postModel.selftext!);
  }

  Widget thumbnailField(BuildContext context) {
    if (postModel.thumbnailUrl == null || postModel.thumbnailUrl == 'self' || postModel.thumbnailUrl == 'default') {
      return Container();
    }
    return Padding(
      padding: context.paddingLow,
      child: SpecialNetworkImage(
        postModel.thumbnailUrl!,
        height: context.width * 0.3,
        width: context.width * 0.3,
      ),
    );
  }
}
