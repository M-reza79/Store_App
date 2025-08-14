import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/model/banner/banners.dart';
import 'package:store_app/widgets/cached_image.dart';

class BannerSlider extends StatelessWidget {
  final List<Banners> list;
  const BannerSlider({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    var controller = PageController(
      viewportFraction: 0.7,
    );
    return Stack(
      alignment:
          AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsetsGeometry.only(
                      left: 12,
                      right: 12,
                    ),
                child: CachedkImage(
                  imageUrl:
                      list[index].thumbnail,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            effect: ExpandingDotsEffect(
              expansionFactor: 4,
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Range.grey,
              activeDotColor: Range.indigo,
            ),
            controller: controller,
            count: list.length,
          ),
        ),
      ],
    );
  }
}
