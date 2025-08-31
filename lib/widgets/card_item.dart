import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/model/carditem/card_item_modl.dart';
import 'package:store_app/widgets/cached_image.dart';
import 'package:store_app/widgets/darsad_off.dart';

class CardItem extends StatefulWidget {
  final CardItemModl carditemModl;
  const CardItem({
    super.key,
    required this.carditemModl,
  });

  @override
  State<CardItem> createState() =>
      _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 5,
        top: 5,
      ),
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: SizedBox(
          width: MediaQuery.of(
            context,
          ).size.width,
          height: 200,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget
                              .carditemModl
                              .name,

                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'گارانتی 18 ماه مدیا پردازش',
                          style: TextStyle(
                            color: Range.grey,
                            fontFamily: 'SM',
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            DarsadOff(),
                            SizedBox(width: 5),
                            Text(
                              'تومان',
                              style: TextStyle(
                                color: Range.grey,
                                fontFamily: 'SB',
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '${widget.carditemModl.price}',
                              style: TextStyle(
                                color: Range.grey,
                                fontFamily: 'SB',
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          spacing: 8,
                          children: [
                            GetDilited(),

                            OptionCheap(
                              colorwidejet:
                                  '17a856',
                              title: 'tstet',
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
                      child: SizedBox(
                        width: 75,
                        height: 104,
                        child: Center(
                          child: CachedkImage(
                            imageUrl: widget
                                .carditemModl
                                .thumbnail,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomPaint(
                size: Size(
                  double.infinity,
                  1,
                ), // طول خط‌چین به اندازه عرض کارت
                painter: DashedLinePainter(),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text(
                      'تومان',
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${widget.carditemModl.realPrice}',

                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetDilited extends StatelessWidget {
  const GetDilited({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Range.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                'حذف',
                style: TextStyle(
                  fontFamily: 'sm',
                  fontSize: 10,
                  color: Range.red,
                ),
              ),
              SizedBox(width: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(
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
    );
  }
}

class OptionCheap extends StatelessWidget {
  final String? colorwidejet;
  final String title;
  const OptionCheap({
    super.key,
    this.colorwidejet,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    int coloreCatgory = int.parse(
      '0xff$colorwidejet',
    );
    return Container(
      height: 20,

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Range.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Row(
          children: [
            SizedBox(width: 5),
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 8,
                color: Range.grey,
              ),
            ),
            SizedBox(width: 5),
            if (colorwidejet != Null) ...[
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Color(coloreCatgory),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1;

    double dashWidth = 5;
    double dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) =>
      false;
}




                        // Row(
                        //   children: [
                        //     OptionCheap(),
                        //     Container(
                        //       height: 20,

                        //       margin:
                        //           const EdgeInsets.only(
                        //             left: 10,
                        //           ),
                        //       decoration: BoxDecoration(
                        //         color:
                        //             Colors.white,
                        //         border:
                        //             Border.all(
                        //               width: 1,
                        //               color: Range
                        //                   .grey,
                        //             ),
                        //         borderRadius:
                        //             const BorderRadius.all(
                        //               Radius.circular(
                        //                 5,
                        //               ),
                        //             ),
                        //       ),
                        //       child: Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(
                        //               horizontal:
                        //                   5,
                        //             ),
                        //         child: Row(
                        //           children: [
                        //             SizedBox(
                        //               width: 5,
                        //             ),
                        //             Text(
                        //               '256 گیگابایت',
                        //               style: TextStyle(
                        //                 fontFamily:
                        //                     'sm',
                        //                 fontSize:
                        //                     8,
                        //                 color: Range
                        //                     .grey,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 5),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 20,

                        //       margin:
                        //           const EdgeInsets.only(
                        //             left: 10,
                        //           ),
                        //       decoration: BoxDecoration(
                        //         color:
                        //             Colors.white,
                        //         border:
                        //             Border.all(
                        //               width: 1,
                        //               color: Range
                        //                   .grey,
                        //             ),
                        //         borderRadius:
                        //             const BorderRadius.all(
                        //               Radius.circular(
                        //                 5,
                        //               ),
                        //             ),
                        //       ),
                        //       child: Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(
                        //               horizontal:
                        //                   5,
                        //             ),
                        //         child: Row(
                        //           children: [
                        //             Text(
                        //               'حذف',
                        //               style: TextStyle(
                        //                 fontFamily:
                        //                     'sm',
                        //                 fontSize:
                        //                     10,
                        //                 color: Range
                        //                     .grey,
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               width: 8,
                        //             ),
                        //             Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                 vertical:
                        //                     2.1,
                        //               ),
                        //               child: Image.asset(
                        //                 'assets/images/icon_trash.png',
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       height: 20,

                        //       margin:
                        //           const EdgeInsets.only(
                        //             left: 10,
                        //           ),
                        //       decoration: BoxDecoration(
                        //         color:
                        //             Colors.white,
                        //         border:
                        //             Border.all(
                        //               width: 1,
                        //               color: Range
                        //                   .grey,
                        //             ),
                        //         borderRadius:
                        //             const BorderRadius.all(
                        //               Radius.circular(
                        //                 5,
                        //               ),
                        //             ),
                        //       ),
                        //       child: Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(
                        //               horizontal:
                        //                   5,
                        //             ),
                        //         child: Row(
                        //           children: [
                        //             Text(
                        //               'ذخیره',
                        //               style: TextStyle(
                        //                 fontFamily:
                        //                     'sm',
                        //                 fontSize:
                        //                     10,
                        //                 color: Range
                        //                     .grey,
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               width: 8,
                        //             ),
                        //             Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                 vertical:
                        //                     2.1,
                        //               ),
                        //               child: Image.asset(
                        //                 'assets/images/icon_favorite_deactive.png',
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       height: 20,

                        //       margin:
                        //           const EdgeInsets.only(
                        //             left: 10,
                        //           ),
                        //       decoration: BoxDecoration(
                        //         color:
                        //             Colors.white,
                        //         border:
                        //             Border.all(
                        //               width: 1,
                        //               color: Range
                        //                   .grey,
                        //             ),
                        //         borderRadius:
                        //             const BorderRadius.all(
                        //               Radius.circular(
                        //                 5,
                        //               ),
                        //             ),
                        //       ),
                        //       child: Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(
                        //               horizontal:
                        //                   5,
                        //             ),
                        //         child: Row(
                        //           children: [
                        //             SizedBox(
                        //               width: 15,
                        //             ),
                        //             Text(
                        //               '1',
                        //               style: TextStyle(
                        //                 fontFamily:
                        //                     'sm',
                        //                 fontSize:
                        //                     10,
                        //                 color: Range
                        //                     .grey,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),