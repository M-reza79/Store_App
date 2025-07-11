import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/widgets/category_icon_item_chip.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            getappbar(),
            Text(
              'محمدرضاحمدی',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
              ),
            ),
            Text(
              '09184968187',
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 16,
                color: Range.grey,
              ),
            ),
            SizedBox(height: 20),

            Directionality(
              textDirection:
                  TextDirection.rtl,
              child: Wrap(
                spacing: 10,
                runSpacing: 20,
                children: [
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                  CategoryIconItemChip(),
                ],
              ),
            ),
            Spacer(),
            Text(
              'شاپ اپلیکیشن',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
                color: Range.grey,
              ),
            ),
            Text(
              'V0.1.0',
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 10,
                color: Range.grey,
              ),
            ),
            Text(
              'https://github.com/M-reza79',
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 10,
                color: Range.grey,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget getappbar() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 5,
      right: 30,
      left: 30,
      bottom: 30,
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      height: 46,
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center,
        children: [
          SizedBox(width: 16),
          Image.asset(
            'assets/images/icon_apple_blue.png',
          ),

          Expanded(
            child: Text(
              'حساب کاربری',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
                color: Range.blueIndicator,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// شکل دیگه ایتم  اینم خوبه
// class ItemProFile extends StatelessWidget {
//   const ItemProFile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: GridView.builder(
//           gridDelegate:
//               const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//               ),
//           itemCount: 14,
//           itemBuilder: (context, index) {
//             return Card(
//               color: Colors.white,
//               elevation: 2,
//               child: Center(
//                 child: Text(
//                   'آیتم ${index + 1}',
//                   style: TextStyle(
//                     fontFamily: 'SB',
//                     fontSize: 14,
//                     color:
//                         Range.blueIndicator,
//                   ),
//                 ),
//               ),
//             );
//           },
//           padding: const EdgeInsets.all(16),
//         ),
//       ),
//     );
//   }
// }
