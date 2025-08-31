import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/basket/basket_bloc.dart';
import 'package:store_app/bloc/basket/basket_state.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/widgets/card_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

class CardScreens extends StatefulWidget {
  const CardScreens({super.key});

  @override
  State<CardScreens> createState() =>
      _CardScreensState();
}

class _CardScreensState
    extends State<CardScreens> {
  final PaymentRequest _paymentRequest =
      PaymentRequest();

  @override
  void initState() {
    super.initState();
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setAmount(1000);
    _paymentRequest.setDescription(
      'test shop mobail',
    );
    _paymentRequest.setMerchantID(
      ' 00000000-0000-0000-0000-000000000000',
    );
    _paymentRequest.setCallbackURL(
      'mohammdrezaahmadi://shop',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            return Stack(
              alignment: AlignmentDirectional
                  .bottomCenter,
              children: [
                if (state
                    is BasketLodingState) ...[
                  Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
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
                ] else ...[
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
                                      fontSize:
                                          16,
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
                      if (state
                          is BasketResponseState) ...[
                        state.responseBasketItemState.fold(
                          (l) {
                            return SliverToBoxAdapter(
                              child: Center(
                                child: Text(l),
                              ),
                            );
                          },
                          (bascketItem) {
                            return SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return CardItem(
                                    carditemModl:
                                        bascketItem[index],
                                  );
                                },
                                childCount:
                                    bascketItem
                                        .length,
                              ),
                            );
                          },
                        ),
                      ],
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                  if (state
                      is BasketResponseState) ...{
                    Padding(
                      padding:
                          const EdgeInsets.only(
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
                          onPressed: () {
                            ZarinPal().startPayment(
                              _paymentRequest,
                              (
                                status,
                                paymentGatewayUri,
                                data,
                              ) {
                                if (status ==
                                    100) {
                                  launchUrl(
                                    Uri.parse(
                                      paymentGatewayUri!,
                                    ),
                                  );
                                }
                              },
                            );
                          },
                          child: Text(
                            state.responseBasketfinalPrice.fold(
                              (l) {
                                return 'Erore';
                              },
                              (finalPrice) {
                                return (finalPrice ==
                                        0)
                                    ? 'محصولات خود را اضافه کنید '
                                    : ' قیمت تمام محصولات $finalPrice تومان';
                              },
                            ),
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  },
                ],
              ],
            );
          },
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