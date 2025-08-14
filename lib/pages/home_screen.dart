import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/homescreen/home_bloc.dart';
import 'package:store_app/bloc/homescreen/home_event.dart';
import 'package:store_app/bloc/homescreen/home_state.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/repository/banner_repository.dart';
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
    ).add(HomeRequestBannerEvent());
    BlocProvider.of<HomeBloc>(
      context,
    ).add(HomeRequestCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsetsGeometry.only(
                      top: 20,
                      right: 44,
                      left: 44,
                      bottom: 32,
                    ),
                child: Serche(),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state
                      is HomeLodingState) {
                    return CircularProgressIndicator();
                  }
                  //
                  if (state
                      is HomeBannerResponseState) {
                    return state
                        .responseHomeBanner
                        .fold(
                          (l) {
                            return Text(l);
                          },
                          (r) {
                            return BannerSlider(
                              list: r,
                            );
                          },
                        );
                  }
                  return Text('erorr');
                },
              ),
            ),

            SliverToBoxAdapter(
              child: TextCategory(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state
                        is HomeLodingState) {
                      return CircularProgressIndicator();
                    }
                    if (state
                        is HomeCategoryResponseState) {
                      return state
                          .responseHomeCategory
                          .fold(
                            (l) {
                              return Center(
                                child: Text(
                                  l,
                                ),
                              );
                            },
                            (r) {
                              return Squircle(
                                list: r,
                              );
                            },
                          );
                    }
                    return Text('erorr');
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextPorFroshtarin(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(
                      right: 30,
                    ),
                child: SizedBox(
                  height: 200,
                  child: ProductItem(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextPorBazdid(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(
                      right: 30,
                    ),
                child: SizedBox(
                  height: 200,
                  child: ProductItem(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextCategory extends StatelessWidget {
  const TextCategory({super.key});

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

class TextPorFroshtarin
    extends StatelessWidget {
  const TextPorFroshtarin({super.key});

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

class TextPorBazdid extends StatelessWidget {
  const TextPorBazdid({super.key});

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
