import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class CachedkImage extends StatelessWidget {
  final String imageUrl;
  const CachedkImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
