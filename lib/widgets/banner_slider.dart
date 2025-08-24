import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/model/banner/banners.dart';

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
      viewportFraction: 0.9,
    );
    return Stack(
      alignment:
          AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 177,
          child: PageView.builder(
            controller: controller,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                child: CachedkImage(
                  imageUrl: list[index].thumbnail,
                  radius: 15,
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
              //اداطه خظ
              expansionFactor: 3.5,
              dotHeight: 5,
              dotWidth: 5,
              dotColor: Colors.white,
              activeDotColor: Range.indigo,
            ),
            controller: controller,
            //تعداد
            count: list.length,
          ),
        ),
      ],
    );
  }
}
