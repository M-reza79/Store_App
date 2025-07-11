import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/widgets/box_mahsol.dart';

class ProductListScreen
    extends StatelessWidget {
  const ProductListScreen({super.key});

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
                          'پرفروش ترین ها ',
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
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              sliver: SliverGrid(
                delegate:
                    SliverChildBuilderDelegate(
                      (context, index) {
                        return BoxMahsol();
                      },
                      childCount: 10,
                    ),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio:
                          2 / 2.9,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
