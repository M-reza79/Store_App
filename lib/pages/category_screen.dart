import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/Category/category_bloc.dart';
import 'package:store_app/bloc/Category/category_event.dart';
import 'package:store_app/bloc/Category/category_state.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/model/category/categorys.dart';
import 'package:store_app/widgets/cached_image.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() =>
      _CategoryScreenState();
}

class _CategoryScreenState
    extends State<CategoryScreen> {
  @override
  void initState() {
    //بلاک پراویدر که اینوت بفرسته گذاشتیم  توی اینیت که  با ساخته شدن اینم بفرسته
    BlocProvider.of<CategoryBloc>(
      context,
    ).add(CategoryRequestEvent());
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
                    const EdgeInsets.only(
                      top: 5,
                      right: 30,
                      left: 30,
                      bottom: 30,
                    ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                  ),
                  height: 46,
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .center,
                    children: [
                      SizedBox(width: 16),
                      Image.asset(
                        'assets/images/icon_apple_blue.png',
                      ),

                      Expanded(
                        child: Text(
                          'دسته بندی',
                          textAlign:
                              TextAlign
                                  .center,
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 16,
                            color: Range
                                .blueIndicator,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<
              CategoryBloc,
              CategoryState
            >(
              builder: (context, state) {
                if (state
                    is CategoryLodingState) {
                  return SliverToBoxAdapter(
                    child:
                        CircularProgressIndicator(),
                  );
                }
                if (state
                    is CategoryResponseState) {
                  return state
                      .responseCategory
                      .fold(
                        (l) {
                          return SliverToBoxAdapter(
                            child: Center(
                              child: Text(l),
                            ),
                          );
                        },
                        (r) {
                          return _ListCategory(
                            list: r,
                          );
                        },
                      );
                }
                return SliverToBoxAdapter(
                  child: Text('erorr'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ListCategory extends StatelessWidget {
  final List<Categorys> list;
  const _ListCategory({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        bottom: 100,
        right: 30,
        left: 30,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return CachedkImage(
              imageUrl:
                  list[index].thumbnail,
            );
          },
          childCount: list.length,
        ),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
      ),
    );
  }
}
