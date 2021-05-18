import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SpecialNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const SpecialNetworkImage(this.imageUrl, {Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      child: Image.network(
        imageUrl,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: height,
              width: width,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
