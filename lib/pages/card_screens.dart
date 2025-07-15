import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/widgets/card_item.dart';

class CardScreens extends StatelessWidget {
  const CardScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional
              .bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(
                          top: 10,
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
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset(
                            'assets/images/icon_apple_blue.png',
                          ),

                          Expanded(
                            child: Text(
                              'سبد خرید',
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
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate:
                      SliverChildBuilderDelegate(
                        (context, index) {
                          return CardItem();
                        },
                        childCount: 10,
                      ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 40,
                left: 40,
                bottom: 10,
              ),
              child: SizedBox(
                height: 53,
                width: MediaQuery.of(
                  context,
                ).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontFamily: 'SM',
                      fontSize: 18,
                    ),
                    backgroundColor:
                        Range.green,
                    foregroundColor:
                        Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadiusGeometry.circular(
                            15,
                          ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('ادامه خرید'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//  SliverToBoxAdapter(
//               child: SizedBox(
//                 height: MediaQuery.of(
//                   context,
//                 ).size.height,
//                 child: ListView.builder(
//                   itemCount: 6,
//                   itemBuilder:
//                       (context, index) {
//                         return CardItem();
//                       },
//                 ),
//               ),
//             ),