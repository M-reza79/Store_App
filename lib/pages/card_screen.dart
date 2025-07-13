import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/widgets/darsad_off.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(
                            top: 20,
                            right: 10,
                            left: 10,
                          ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .end,
                            children: [
                              Text(
                                'آیفون 13 پرومکس',
                                style: TextStyle(
                                  fontFamily:
                                      'SB',
                                  fontSize:
                                      14,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'گارانتی 18 ماه مدیا پردازش',
                                style: TextStyle(
                                  color: Range
                                      .grey,
                                  fontFamily:
                                      'SM',
                                  fontSize:
                                      10,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  DarsadOff(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'تومان',
                                    style: TextStyle(
                                      color:
                                          Range.grey,
                                      fontFamily:
                                          'SB',
                                      fontSize:
                                          10,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '46,000,000',
                                    style: TextStyle(
                                      color:
                                          Range.grey,
                                      fontFamily:
                                          'SB',
                                      fontSize:
                                          10,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:
                                        20,

                                    margin: const EdgeInsets.only(
                                      left:
                                          10,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white,
                                      border: Border.all(
                                        width:
                                            1,
                                        color:
                                            Range.grey,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          5,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            5,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/icon_options.png',
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'سبز کله غازی',
                                            style: TextStyle(
                                              fontFamily: 'sm',
                                              fontSize: 8,
                                              color: Range.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                255,
                                                3,
                                                98,
                                                89,
                                              ),
                                              borderRadius: BorderRadius.circular(
                                                200,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        20,

                                    margin: const EdgeInsets.only(
                                      left:
                                          10,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white,
                                      border: Border.all(
                                        width:
                                            1,
                                        color:
                                            Range.grey,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          5,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            5,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/icon_options.png',
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '256 گیگابایت',
                                            style: TextStyle(
                                              fontFamily: 'sm',
                                              fontSize: 8,
                                              color: Range.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:
                                        20,

                                    margin: const EdgeInsets.only(
                                      left:
                                          10,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white,
                                      border: Border.all(
                                        width:
                                            1,
                                        color:
                                            Range.grey,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          5,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'حذف',
                                            style: TextStyle(
                                              fontFamily: 'sm',
                                              fontSize: 10,
                                              color: Range.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2.1,
                                            ),
                                            child: Image.asset(
                                              'assets/images/icon_trash.png',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        20,

                                    margin: const EdgeInsets.only(
                                      left:
                                          10,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white,
                                      border: Border.all(
                                        width:
                                            1,
                                        color:
                                            Range.grey,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          5,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'ذخیره',
                                            style: TextStyle(
                                              fontFamily: 'sm',
                                              fontSize: 10,
                                              color: Range.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2.1,
                                            ),
                                            child: Image.asset(
                                              'assets/images/icon_favorite_deactive.png',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        20,

                                    margin: const EdgeInsets.only(
                                      left:
                                          10,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white,
                                      border: Border.all(
                                        width:
                                            1,
                                        color:
                                            Range.grey,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          5,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            5,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/icon_options.png',
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                              fontFamily: 'sm',
                                              fontSize: 10,
                                              color: Range.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(
                                  left: 15,
                                ),
                            child: Image.asset(
                              'assets/images/iphone.png',
                            ),
                          ),
                        ],
                      ),
                    ),

                    Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.only(
                            bottom: 10,
                          ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          Text(
                            'تومان',
                            style: TextStyle(
                              fontFamily:
                                  'SB',
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '38,000,000',
                            style: TextStyle(
                              fontFamily:
                                  'SB',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
