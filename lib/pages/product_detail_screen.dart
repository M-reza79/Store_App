import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/product/product_bloc.dart';
import 'package:store_app/bloc/product/product_event.dart';
import 'package:store_app/bloc/product/product_state.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/model/category/categorys.dart';
import 'package:store_app/data/model/gallery/product_image.dart';
import 'package:store_app/data/model/product/products.dart';
import 'package:store_app/data/model/properties/properties.dart';

import 'package:store_app/widgets/cached_image.dart';

import 'package:store_app/widgets/darsad_off.dart';

import 'package:store_app/widgets/variant_container.dart';

class ProductDetailScreen extends StatefulWidget {
  final Products products;

  const ProductDetailScreen(
    this.products, {
    super.key,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {
  @override
  void initState() {
    //بلاک پراویدر که اینوت بفرسته گذاشتیم  توی اینیت که  با ساخته شدن اینم بفرسته
    BlocProvider.of<ProductDetailBloc>(
      context,
    ).add(
      ProductDetailInitializeEvent(
        widget.products.id.toString(),
        widget.products.categoryId.toString(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state
                    is ProductDetailLodingState) ...[
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
                  if (state
                      is ProductDetailResponseState) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(
                              top: 5,
                              right: 30,
                              left: 30,
                              bottom: 10,
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
                                  state.responsecategorysId.fold(
                                    (l) {
                                      return 'اطلاعات محصول';
                                    },
                                    (
                                      categorystitle,
                                    ) {
                                      return categorystitle
                                          .title;
                                    },
                                  ),
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
                  ],

                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsetsGeometry.only(
                            bottom: 10,
                          ),
                      child: Text(
                        widget.products.name,
                        textAlign:
                            TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SB',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  //... برای این که بگی اینجا یه ویجتی ایه
                  //اسپرت اپیرتور توی هفته 3 4
                  if (state
                      is ProductDetailResponseState) ...[
                    state.responseProductImage.fold(
                      (l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      },
                      (productImage) {
                        return _GallerWidget(
                          widget
                              .products
                              .thumbnail,
                          productImageList:
                              productImage,
                        );
                      },
                    ),
                  ],
                  if (state
                      is ProductDetailResponseState) ...[
                    state.responseProductVariant.fold(
                      (l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      },
                      (productVariantList) {
                        return VariantContainer(
                          productVariantList:
                              productVariantList,
                        );
                      },
                    ),
                  ],

                  if (state
                      is ProductDetailResponseState) ...[
                    state.responseProductProperties.fold(
                      (l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      },
                      (productVariantList) {
                        return GetProductProperties(
                          productPropertiList:
                              productVariantList,
                        );
                      },
                    ),
                  ],

                  GetProductDescription(
                    productDescription: widget
                        .products
                        .description,
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin:
                          const EdgeInsets.only(
                            right: 30,
                            left: 30,
                            top: 10,
                          ),
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Range.grey,
                        ),
                        borderRadius:
                            BorderRadius.all(
                              Radius.circular(15),
                            ),
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/images/icon_left_categroy.png',
                            color:
                                Range.blueporange,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'مشاهده',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 12,
                              color: Range
                                  .blueIndicator,
                            ),
                          ),
                          const Spacer(),
                          Stack(
                            clipBehavior:
                                Clip.none,
                            children: [
                              Container(
                                height: 26,
                                width: 26,
                                margin:
                                    EdgeInsets.only(
                                      left: 10,
                                    ),
                                decoration: BoxDecoration(
                                  color:
                                      Range.red,
                                  borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(
                                          8,
                                        ),
                                      ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  margin:
                                      EdgeInsets.only(
                                        left: 10,
                                      ),
                                  decoration: BoxDecoration(
                                    color: Range
                                        .green,
                                    borderRadius:
                                        BorderRadius.all(
                                          Radius.circular(
                                            8,
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 30,
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  margin:
                                      EdgeInsets.only(
                                        left: 10,
                                      ),
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .amber,
                                    borderRadius:
                                        BorderRadius.all(
                                          Radius.circular(
                                            8,
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 45,
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  margin:
                                      EdgeInsets.only(
                                        left: 10,
                                      ),
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .cyan,
                                    borderRadius:
                                        BorderRadius.all(
                                          Radius.circular(
                                            8,
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 60,
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  margin:
                                      EdgeInsets.only(
                                        left: 10,
                                      ),
                                  decoration: BoxDecoration(
                                    color: Range
                                        .grey,
                                    borderRadius:
                                        BorderRadius.all(
                                          Radius.circular(
                                            8,
                                          ),
                                        ),
                                  ),

                                  child: Center(
                                    child: Text(
                                      '+10',
                                      style: TextStyle(
                                        fontFamily:
                                            'sb',
                                        fontSize:
                                            12,
                                        color: Colors
                                            .white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 4),
                          const Text(
                            ':نظرات کاربران ',
                            style: TextStyle(
                              fontFamily: 'sm',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(
                            top: 10,
                            left: 30,
                            right: 30,
                          ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          AddToBasketButton1(),
                          PriceTagButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class GetProductProperties
    extends StatefulWidget {
  final List<Properties> productPropertiList;
  const GetProductProperties({
    super.key,
    required this.productPropertiList,
  });

  @override
  State<GetProductProperties> createState() =>
      _GetProductPropertiesState();
}

class _GetProductPropertiesState
    extends State<GetProductProperties> {
  bool _isVisble = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isVisble = !_isVisble;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 30,
                left: 30,
                top: 10,
              ),
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Range.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/icon_left_categroy.png',
                    color: Range.blueporange,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'مشاهده',
                    style: TextStyle(
                      fontFamily: 'SB',
                      fontSize: 12,
                      color: Range.blueIndicator,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    ':مشخصات فنی',
                    style: TextStyle(
                      fontFamily: 'sm',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _isVisble,
            child: Container(
              margin: const EdgeInsets.only(
                right: 30,
                left: 30,
                top: 10,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Range.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(),
                itemCount: widget
                    .productPropertiList
                    .length,
                itemBuilder: (context, index) {
                  var property = widget
                      .productPropertiList[index];
                  return Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          '${property.value} : ${property.title}',
                          textAlign:
                              TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'sm',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GetProductDescription
    extends StatefulWidget {
  final String productDescription;
  const GetProductDescription({
    super.key,
    required this.productDescription,
  });

  @override
  State<GetProductDescription> createState() =>
      _GetProductDescriptionState();
}

class _GetProductDescriptionState
    extends State<GetProductDescription> {
  bool _isVisble = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isVisble = !_isVisble;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 30,
                left: 30,
                top: 10,
              ),
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Range.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/icon_left_categroy.png',
                    color: Range.blueporange,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'مشاهده',
                    style: TextStyle(
                      fontFamily: 'SB',
                      fontSize: 12,
                      color: Range.blueIndicator,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    ':توضیحات محصول',
                    style: TextStyle(
                      fontFamily: 'sm',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _isVisble,
            child: Container(
              margin: const EdgeInsets.only(
                right: 30,
                left: 30,
                top: 10,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Range.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Flexible(
                child: Text(
                  widget.productDescription,
                  style: TextStyle(
                    fontFamily: 'sm',
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GallerWidget extends StatefulWidget {
  final List<ProductImage> productImageList;
  final String defaultProductThumbnail;
  final int selectedItem = 0;
  const _GallerWidget(
    this.defaultProductThumbnail, {
    super.key,
    required this.productImageList,
  });

  @override
  State<_GallerWidget> createState() =>
      _GallerWidgetState();
}

class _GallerWidgetState
    extends State<_GallerWidget> {
  late int selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 30,
        ),
        child: Container(
          height: 284,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    left: 15,
                    top: 15,
                  ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .center,
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          Image.asset(
                            'assets/images/icon_star.png',
                          ),
                          SizedBox(width: 3),
                          Text(
                            '4.6',
                            style: TextStyle(
                              fontFamily: 'sm',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: CachedkImage(
                          imageUrl:
                              (widget
                                  .productImageList
                                  .isEmpty)
                              ? widget
                                    .defaultProductThumbnail
                              : widget
                                    .productImageList[widget
                                        .selectedItem]
                                    .image,
                        ),
                      ),
                      Spacer(),

                      Image.asset(
                        'assets/images/icon_favorite_deactive.png',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              if (widget
                  .productImageList
                  .isNotEmpty) ...[
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                    child: ListView.builder(
                      scrollDirection:
                          Axis.horizontal,
                      itemCount: widget
                          .productImageList
                          .length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              //توی اینیت استیت تعریف کردم و مقدار دادم واسه استیت فولت
                              selectedItem =
                                  index;
                            });
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            margin:
                                EdgeInsets.only(
                                  left: 20,
                                ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Range.grey,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(
                                    4,
                                  ),
                              child: CachedkImage(
                                imageUrl: widget
                                    .productImageList[index]
                                    .image,
                                radius: 10,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class AddToBasketButton1 extends StatelessWidget {
  const AddToBasketButton1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 37,
          width: 130,
          decoration: BoxDecoration(
            color: Range.green,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: 7,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 50,
                sigmaY: 50,
              ),
              child: Container(
                height: 43,
                width: 150,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Range.blue,
                      blurRadius: 100,
                      spreadRadius: -15,
                      offset: Offset(0, 10),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      Text(
                        'تومان',
                        style: TextStyle(
                          fontFamily: 'SB',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            '17,800,00',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '16,489,000',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      DarsadOff(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PriceTagButton extends StatelessWidget {
  const PriceTagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 37,
          width: 130,
          decoration: BoxDecoration(
            color: Range.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: 7,
          child: GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 50,
                  sigmaY: 50,
                ),
                child: Container(
                  height: 43,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Range.blue,
                        blurRadius: 100,
                        spreadRadius: -15,
                        offset: Offset(0, 10),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                    child: Center(
                      child: Text(
                        'افزودن به گک//پگک// خرید',
                        style: TextStyle(
                          fontFamily: 'SB',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
