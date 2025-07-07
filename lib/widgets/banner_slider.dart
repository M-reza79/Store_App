import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

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
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsetsGeometry.only(
                      left: 12,
                      right: 12,
                    ),
                child: Container(
                  color: Colors.red,
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
              dotColor: Colors.grey,
              activeDotColor: Colors.indigo,
            ),
            controller: controller,
            count: 3,
          ),
        ),
      ],
    );
  }
}
