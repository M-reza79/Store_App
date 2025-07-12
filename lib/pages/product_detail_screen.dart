import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class ProductDetailScreen
    extends StatelessWidget {
  const ProductDetailScreen({super.key});

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
                      top: 10,
                      right: 30,
                      left: 30,
                      bottom: 15,
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
                          'آیفون',
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
                      Image.asset(
                        'assets/images/icon_back.png',
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsetsGeometry.only(
                      bottom: 15,
                    ),
                child: Text(
                  'se 2022 آیفون',
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
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsetsGeometry.symmetric(
                      horizontal: 44,
                    ),
                child: Container(
                  height: 284,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(
                                right: 15,
                                left: 15,
                                top: 15,
                              ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Image.asset(
                                'assets/images/icon_star.png',
                              ),
                              Text(
                                '4.6',
                                style: TextStyle(
                                  fontFamily:
                                      'sm',
                                  fontSize:
                                      12,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                height: double
                                    .infinity,
                                child: Image.asset(
                                  'assets/images/iphone.png',
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
                      SizedBox(
                        height: 70,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(
                                horizontal:
                                    30,
                              ),
                          child: ListView.builder(
                            scrollDirection:
                                Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 70,
                                width: 70,
                                margin:
                                    EdgeInsets.only(
                                      left:
                                          20,
                                    ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Range
                                        .grey,
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
                                        4.0,
                                      ),
                                  child: Image.asset(
                                    'assets/images/iphone.png',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
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
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10),
                    const Text(
                      'انتخاب رنگ',
                      style: TextStyle(
                        fontFamily: 'sm',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .end,
                      children: [
                        Container(
                          height: 26,
                          width: 26,
                          margin:
                              EdgeInsets.only(
                                left: 10,
                              ),
                          decoration: BoxDecoration(
                            color: Range.red,
                            borderRadius:
                                BorderRadius.all(
                                  Radius.circular(
                                    8,
                                  ),
                                ),
                          ),
                        ),
                        Container(
                          height: 26,
                          width: 26,
                          margin:
                              EdgeInsets.only(
                                left: 10,
                              ),
                          decoration: BoxDecoration(
                            color: Range.red,
                            borderRadius:
                                BorderRadius.all(
                                  Radius.circular(
                                    8,
                                  ),
                                ),
                          ),
                        ),
                        Container(
                          height: 26,
                          width: 26,
                          margin:
                              EdgeInsets.only(
                                left: 10,
                              ),
                          decoration: BoxDecoration(
                            color: Range.red,
                            borderRadius:
                                BorderRadius.all(
                                  Radius.circular(
                                    8,
                                  ),
                                ),
                          ),
                        ),
                      ],
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
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10),
                    const Text(
                      'انتخاب حافظه داخلی',
                      style: TextStyle(
                        fontFamily: 'sm',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .end,
                      children: [
                        Container(
                          height: 28,

                          margin:
                              const EdgeInsets.only(
                                left: 10,
                              ),
                          decoration: BoxDecoration(
                            color:
                                Colors.white,
                            border:
                                Border.all(
                                  width: 1,
                                  color: Range
                                      .grey,
                                ),
                            borderRadius:
                                const BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                  horizontal:
                                      20,
                                ),
                            child: Center(
                              child: Text(
                                '128',
                                style: TextStyle(
                                  fontFamily:
                                      'SB',
                                  fontSize:
                                      12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 28,

                          margin:
                              const EdgeInsets.only(
                                left: 10,
                              ),
                          decoration: BoxDecoration(
                            color:
                                Colors.white,
                            border:
                                Border.all(
                                  width: 1,
                                  color: Range
                                      .grey,
                                ),
                            borderRadius:
                                const BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                  horizontal:
                                      20,
                                ),
                            child: Center(
                              child: Text(
                                '128',
                                style: TextStyle(
                                  fontFamily:
                                      'SB',
                                  fontSize:
                                      12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 28,

                          margin:
                              const EdgeInsets.only(
                                left: 10,
                              ),
                          decoration: BoxDecoration(
                            color:
                                Colors.white,
                            border:
                                Border.all(
                                  width: 1,
                                  color: Range
                                      .grey,
                                ),
                            borderRadius:
                                const BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                  horizontal:
                                      20,
                                ),
                            child: Center(
                              child: Text(
                                '128',
                                style: TextStyle(
                                  fontFamily:
                                      'SB',
                                  fontSize:
                                      12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin:
                    const EdgeInsets.only(
                      right: 30,
                      left: 30,
                      top: 20,
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
                    const Text(
                      ':مشخصات فنی',
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
              child: Container(
                margin:
                    const EdgeInsets.only(
                      right: 30,
                      left: 30,
                      top: 20,
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
                    const Text(
                      ':توضیحات محصول',
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
              child: Container(
                margin:
                    const EdgeInsets.only(
                      right: 30,
                      left: 30,
                      top: 20,
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
                            color: Range.red,
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
                              color:
                                  Range.grey,
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
                    SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}
