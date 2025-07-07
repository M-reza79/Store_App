import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.7,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsetsGeometry.only(
                          left: 12,
                          right: 12,
                        ),
                    child: Container(
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
