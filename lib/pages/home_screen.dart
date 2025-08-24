import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/homescreen/home_bloc.dart';
import 'package:store_app/bloc/homescreen/home_event.dart';
import 'package:store_app/bloc/homescreen/home_state.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/repository/banner_repository.dart';
import 'package:store_app/data/model/banner/banners.dart';
import 'package:store_app/data/model/category/categorys.dart';
import 'package:store_app/data/model/product/products.dart';
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

class _HomeScreenState extends State<HomeScreen> {
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
                //برای این که دونه دونه  از لیست در بیاره بزاره توی اسلیور
                //چون اسلیور یه لیسته از [] استفاده می کنیم ن
                //Spread Operator
                //loding
                if (state is HomeLodingState) ...[
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      mainAxisSize:
                          MainAxisSize.max,
                      children: const [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child:
                              CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  //Search Box
                  _GetSearchBox(),

                  //
                  if (state
                      is HomeResponseState) ...[
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
                  ],

                  _GetcategoryListTitle(),
                  //
                  if (state
                      is HomeResponseState) ...[
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
                  ],

                  _GetBestsellerTitle(),

                  if (state
                      is HomeResponseState) ...[
                    state.responseHomeHotestProducts.fold(
                      (l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      },
                      (r) {
                        return _GetBestsellerProducts(
                          list: r,
                        );
                      },
                    ),
                  ],

                  _GetMostViewedTitle(),
                  if (state
                      is HomeResponseState) ...[
                    state.responseHomeBestSellerProducts.fold(
                      (l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      },
                      (r) {
                        return _GetMostViewedProduct(
                          list: r,
                        );
                      },
                    ),
                  ],
                ],
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

class _GetcategoryList extends StatelessWidget {
  final List<Categorys> list;
  const _GetcategoryList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 5,
          left: 10,
        ),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: Squircle(
                  ctegory: list[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _GetMostViewedProduct
    extends StatelessWidget {
  final List<Products> list;

  const _GetMostViewedProduct({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SizedBox(
          height: 200,
          child: ProductItem(list: list),
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
          left: 30,
          right: 20,
          bottom: 15,
        ),
        child: Row(
          children: [
            Text(
              'پر بازدید ترین ها',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
                color: Range.grey,
              ),
            ),

            Spacer(),
            Text(
              ' مشاهده همه ',
              style: TextStyle(
                fontFamily: 'SB',
                color: Range.blue,
              ),
            ),
            SizedBox(width: 5),
            Image.asset(
              'assets/images/icon_left_categroy.png',
            ),
          ],
        ),
      ),
    );
  }
}

class _GetBestsellerProducts
    extends StatelessWidget {
  final List<Products> list;
  const _GetBestsellerProducts({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SizedBox(
          height: 200,
          child: ProductItem(list: list),
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
          left: 30,
          right: 20,
          bottom: 15,
          top: 10,
        ),
        child: Row(
          children: [
            Text(
              'پر فروش ترین ها',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
                color: Range.grey,
              ),
            ),

            Spacer(),

            Text(
              ' مشاهده همه ',
              style: TextStyle(
                fontFamily: 'SB',
                color: Range.blue,
              ),
            ),
            SizedBox(width: 5),
            Image.asset(
              'assets/images/icon_left_categroy.png',
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
          right: 20,
          bottom: 15,
          top: 20,
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.start,
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
