import 'package:flutter/material.dart';
 
import 'package:store_app/data/repository/authentication_repository.dart';
 
import 'package:store_app/util/auth_manager.dart';

class Dita extends StatefulWidget {
  const Dita({super.key});

  @override
  State<Dita> createState() => _DitaState();
}

class _DitaState extends State<Dita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await AuthenticationRepository()
                      .login(
                        'm_reza79',
                        '123456789',
                      );
                  // var shared = locator
                  //     .get<
                  //       SharedPreferences
                  //     >();
                  // print(
                  //   shared.getString(
                  //     'access_token',
                  //   ),
                  // );
                  // either.fold(
                  //   (errorMassage) {
                  //     print(errorMassage);
                  //   },
                  //   (successMassage) {
                  //     print(successMassage);
                  //   },
                  // );
                },
                child: Text('login'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  AuthManager.logouut();
                },
                child: Text('logout'),
              ),
              ValueListenableBuilder(
                valueListenable: AuthManager
                    .authChangeNotifier,
                builder:
                    (context, value, child) {
                      if (value == null ||
                          value.isEmpty) {
                        return Text(
                          'وارد شوید',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Colors.red,
                          ),
                        );
                      } else {
                        return Text(
                          'خوش آمدید',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                const Color.fromARGB(
                                  255,
                                  37,
                                  249,
                                  94,
                                ),
                          ),
                        );
                      }
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
