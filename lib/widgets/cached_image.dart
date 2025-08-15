import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class CachedkImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const CachedkImage({
    super.key,
    required this.imageUrl,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          return Container(
            color: Range.red,
            child: Center(
              child: Text(
                'خطا در بارگذاری تصویر',
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return Container(
            color: Range.grey,
          );
        },
      ),
    );
  }
}
