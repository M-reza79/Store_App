import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/authentication/auth_bloc.dart';
import 'package:store_app/bloc/authentication/auth_event.dart';
import 'package:store_app/bloc/authentication/auth_state.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/pages/login_screen.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final _usernameTextController =
      TextEditingController();
  final _passwordTextController =
      TextEditingController();
  final _passwordConfirmTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //رفع ارور کیبورد
      resizeToAvoidBottomInset: false,

      backgroundColor: Range.blueIndicator,
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .center,
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/images/icon_application.png',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'موبایل شاپ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SB',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(
                        left: 20,
                        right: 20,
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
                    child: Directionality(
                      textDirection:
                          TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .center,
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                            child: TextField(
                              controller:
                                  _usernameTextController,
                              textAlign:
                                  TextAlign
                                      .right,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                  borderSide:
                                      BorderSide(
                                        color:
                                            Colors.black,
                                      ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Colors
                                        .blue,
                                  ),
                                ),

                                labelText:
                                    'نام کاربری',

                                labelStyle: TextStyle(
                                  color: Colors
                                      .black,
                                  fontFamily:
                                      'SM',
                                  fontSize:
                                      16,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(
                                  top: 20,
                                  left: 10,
                                  right: 10,
                                ),
                            child: TextField(
                              controller:
                                  _passwordTextController,
                              textAlign:
                                  TextAlign
                                      .right,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                  borderSide:
                                      BorderSide(
                                        color:
                                            Colors.black,
                                      ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Colors
                                        .blue,
                                  ),
                                ),

                                labelText:
                                    'رمز عبور',

                                labelStyle: TextStyle(
                                  color: Colors
                                      .black,
                                  fontFamily:
                                      'SM',
                                  fontSize:
                                      16,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(
                                  top: 20,
                                  left: 10,
                                  right: 10,
                                  bottom: 20,
                                ),
                            child: TextField(
                              controller:
                                  _passwordConfirmTextController,
                              textAlign:
                                  TextAlign
                                      .right,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                  borderSide:
                                      BorderSide(
                                        color:
                                            Colors.black,
                                      ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Colors
                                        .blue,
                                  ),
                                ),

                                labelText:
                                    'تکرار رمز عبور ',

                                labelStyle: TextStyle(
                                  color: Colors
                                      .black,
                                  fontFamily:
                                      'SM',
                                  fontSize:
                                      16,
                                ),
                              ),
                            ),
                          ),
                          BlocBP(
                            usernameTextController:
                                _usernameTextController,
                            passwordTextController:
                                _passwordTextController,
                            passwordConfirmTextController:
                                _passwordConfirmTextController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlocBP extends StatelessWidget {
  const BlocBP({
    super.key,
    required TextEditingController
    usernameTextController,
    required TextEditingController
    passwordTextController,
    required TextEditingController
    passwordConfirmTextController,
  }) : _usernameTextController =
           usernameTextController,
       _passwordTextController =
           passwordTextController,
       _passwordConfirmTextController =
           passwordConfirmTextController;

  final TextEditingController
  _usernameTextController;
  final TextEditingController
  _passwordTextController;
  final TextEditingController
  _passwordConfirmTextController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitiateState) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
              ),
              minimumSize: Size(200, 48),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadiusGeometry.circular(
                      20,
                    ),
              ),
            ),
            onPressed: () async {
              BlocProvider.of<AuthBloc>(
                context,
              ).add(
                AuthSignInRequestEvent(
                  _usernameTextController
                      .text,
                  _passwordTextController
                      .text,
                  _passwordConfirmTextController
                      .text,
                ),
              );
            },
            child: Text('ثبت حساب کاربری'),
          );
        }
        if (state
            is AuthSignInRequestState) {
          return CircularProgressIndicator();
        }
        if (state
            is AuthResponseSignInState) {
          return state.reponse.fold(
            (l) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) {
                    if (l.isNotEmpty) {
                      Navigator.of(
                        context,
                      ).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              LoginScreen(),
                        ),
                      );
                    }
                  });
              return Text(l);
            },
            (r) {
              return Text(r);
            },
          );
        }
        return const Text('خطای نامشخص');
      },
    );
  }
}
