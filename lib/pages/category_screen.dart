import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class CategoryScreen
    extends StatelessWidget {
  const CategoryScreen({super.key});

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
            SliverPadding(
              padding: EdgeInsets.only(
                bottom: 100,
                right: 30,
                left: 30,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((
                  context,
                  index,
                ) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Range.red,
                      borderRadius:
                          BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                    ),
                    child: Center(
                      child: Text(
                        'Item $index',
                      ),
                    ),
                  );
                }, childCount: 10),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
