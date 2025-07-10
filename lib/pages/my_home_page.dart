import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/widgets/serche.dart';

import 'package:store_app/widgets/banner_slider.dart';
import 'package:store_app/widgets/product_item.dart';
import 'package:store_app/widgets/squircle.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,

      body: SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              top: 20,
              right: 44,
              left: 44,
              bottom: 32,
            ),
            child: Serche(),
          ),
        ),
        SliverToBoxAdapter(
          child: BannerSlider(),
        ),
        SliverToBoxAdapter(child: Sater0()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: Squircle(),
          ),
        ),
        SliverToBoxAdapter(child: Sater1()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 30,
            ),
            child: SizedBox(
              height: 200,
              child: ProductItem(),
            ),
          ),
        ),
        SliverToBoxAdapter(child: Sater2()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 30,
            ),
            child: SizedBox(
              height: 200,
              child: ProductItem(),
            ),
          ),
        ),
      ],
    );
  }
}

class Sater0 extends StatelessWidget {
  const Sater0({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 44,
        right: 44,
        bottom: 15,
        top: 20,
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.end,
        children: [
          Text(
            'دسته بندی ها',
            style: TextStyle(
              fontFamily: 'SB',
              fontSize: 12,
              color: Range.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class Sater1 extends StatelessWidget {
  const Sater1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 44,
        right: 44,
        bottom: 15,
        top: 10,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/icon_left_categroy.png',
          ),
          SizedBox(width: 10),
          Text(
            ' مشاهده همه ',
            style: TextStyle(
              fontFamily: 'SB',
              color: Range.blue,
            ),
          ),
          Spacer(),
          Text(
            'پر فروش ترین ها',
            style: TextStyle(
              fontFamily: 'SB',
              fontSize: 12,
              color: Range.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class Sater2 extends StatelessWidget {
  const Sater2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 44,
        right: 44,
        bottom: 15,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/icon_left_categroy.png',
          ),
          SizedBox(width: 10),
          Text(
            ' مشاهده همه ',
            style: TextStyle(
              fontFamily: 'SB',
              color: Range.blue,
            ),
          ),
          Spacer(),
          Text(
            'پر بازدید ترین ها',
            style: TextStyle(
              fontFamily: 'SB',
              fontSize: 12,
              color: Range.grey,
            ),
          ),
        ],
      ),
    );
  }
}
