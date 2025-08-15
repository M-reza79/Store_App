import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/homescreen/home_bloc.dart';
import 'package:store_app/bloc/homescreen/home_event.dart';
import 'package:store_app/bloc/homescreen/home_state.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/repository/banner_repository.dart';
import 'package:store_app/model/banner/banners.dart';
import 'package:store_app/model/category/categorys.dart';
import 'package:store_app/widgets/serche.dart';

import 'package:store_app/widgets/banner_slider.dart';
import 'package:store_app/widgets/product_item.dart';
import 'package:store_app/widgets/squircle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(
      context,
    ).add(HomeRequestGetInitilzeDataEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,

      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                //اسپیت آپراتور ببین چیه  ... قبلش میزاری
                //Spread Operator
                //loding
                if (state
                    is HomeLodingState) ...{
                  SliverToBoxAdapter(
                    child:
                        CircularProgressIndicator(),
                  ),
                },

                //Search Box
                _GetSearchBox(),

                //
                if (state
                    is HomeResponseState) ...{
                  state.responseHomebaanner.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (r) {
                      return _GetBanners(
                        list: r,
                      );
                    },
                  ),
                },

                _GetcategoryListTitle(),
                //
                if (state
                    is HomeResponseState) ...{
                  state.responseHomeCategory.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (r) {
                      return _GetcategoryList(
                        list: r,
                      );
                    },
                  ),
                },

                _GetBestsellerTitle(),
                _GetBestsellerProducts(),
                _GetMostViewedTitle(),
                _GetMostViewedProduct(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _GetBanners extends StatelessWidget {
  final List<Banners> list;
  const _GetBanners({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(list: list),
    );
  }
}

class _GetcategoryList
    extends StatelessWidget {
  final List<Categorys> list;
  const _GetcategoryList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: Squircle(list: list),
      ),
    );
  }
}

class _GetMostViewedProduct
    extends StatelessWidget {
  const _GetMostViewedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 30,
        ),
        child: SizedBox(
          height: 200,
          child: ProductItem(),
        ),
      ),
    );
  }
}

class _GetMostViewedTitle
    extends StatelessWidget {
  const _GetMostViewedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
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
      ),
    );
  }
}

class _GetBestsellerProducts
    extends StatelessWidget {
  const _GetBestsellerProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 30,
        ),
        child: SizedBox(
          height: 200,
          child: ProductItem(),
        ),
      ),
    );
  }
}

class _GetBestsellerTitle
    extends StatelessWidget {
  const _GetBestsellerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
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
      ),
    );
  }
}

class _GetcategoryListTitle
    extends StatelessWidget {
  const _GetcategoryListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
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
      ),
    );
  }
}

class _GetSearchBox extends StatelessWidget {
  const _GetSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          top: 20,
          right: 44,
          left: 44,
          bottom: 32,
        ),
        child: Serche(),
      ),
    );
  }
}
