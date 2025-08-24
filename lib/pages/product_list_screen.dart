import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/categoryProduct/category_product_bloc.dart';
import 'package:store_app/bloc/categoryProduct/category_product_event.dart';
import 'package:store_app/bloc/categoryProduct/category_product_state.dart';
import 'package:store_app/bloc/product/product_bloc.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/model/category/categorys.dart';
import 'package:store_app/widgets/box_mahsol.dart';
import 'package:store_app/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  final Categorys ctegory;
  const ProductListScreen({
    super.key,
    required this.ctegory,
  });

  @override
  State<ProductListScreen> createState() =>
      _ProductListScreenState();
}

class _ProductListScreenState
    extends State<ProductListScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryProductBloc>(
      context,
    ).add(
      CategoryInitializeProductEvent(
        widget.ctegory.id,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      CategoryProductBloc,
      CategoryProductState
    >(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              Range.backgroundScreenColor,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state
                    is CategoryProductLodingState) ...[
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
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(
                            top: 5,
                            right: 25,
                            left: 25,
                            bottom: 20,
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
                                widget
                                    .ctegory
                                    .title,
                                textAlign:
                                    TextAlign
                                        .center,
                                style: TextStyle(
                                  fontFamily:
                                      'SB',
                                  fontSize: 16,
                                  color: Range
                                      .blueIndicator,
                                ),
                              ),
                            ),

                            Image.asset(
                              'assets/images/icon_back.png',
                            ),
                            SizedBox(width: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state
                      is CategoryProductResponseState) ...[
                    state.productListCategory.fold(
                      (l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      },
                      (product) {
                        return SliverPadding(
                          padding:
                              EdgeInsets.only(
                                top: 10,
                                right: 20,
                                left: 20,
                                bottom: 10,
                              ),
                          sliver: Directionality(
                            textDirection:
                                TextDirection.rtl,
                            child: SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  // return BoxMahsol();
                                  return BoxMahsol(
                                    product:
                                        product[index],
                                  );
                                },
                                childCount:
                                    product
                                        .length,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        2,
                                    crossAxisSpacing:
                                        20,
                                    mainAxisSpacing:
                                        20,
                                    childAspectRatio:
                                        2.2 / 2.9,
                                  ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
