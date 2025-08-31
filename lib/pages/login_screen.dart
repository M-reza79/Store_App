import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/authentication/auth_bloc.dart';
import 'package:store_app/bloc/authentication/auth_event.dart';
import 'package:store_app/bloc/authentication/auth_state.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/pages/profile_screen.dart';
import 'package:store_app/widgets/nviagt.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  final _usernameTextController =
      TextEditingController(text: 'M_reza79');

  final _passwordTextController =
      TextEditingController(text: '123456789');

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
              SizedBox(width: double.infinity),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  mainAxisAlignment:
                      MainAxisAlignment.center,
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
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(
                            Radius.circular(15),
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
                                  TextAlign.right,
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
                                        color: Colors
                                            .black,
                                      ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                  borderSide:
                                      BorderSide(
                                        width: 3,
                                        color: Colors
                                            .blue,
                                      ),
                                ),

                                labelText:
                                    'نام کاربری',

                                labelStyle:
                                    TextStyle(
                                      color: Colors
                                          .black,
                                      fontFamily:
                                          'SM',
                                      fontSize:
                                          18,
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
                                  _passwordTextController,
                              textAlign:
                                  TextAlign.right,
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
                                        color: Colors
                                            .black,
                                      ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                  borderSide:
                                      BorderSide(
                                        width: 3,
                                        color: Colors
                                            .blue,
                                      ),
                                ),

                                labelText:
                                    'رمز عبور',

                                labelStyle:
                                    TextStyle(
                                      color: Colors
                                          .black,
                                      fontFamily:
                                          'SM',
                                      fontSize:
                                          18,
                                    ),
                              ),
                            ),
                          ),
                          BlocBuilder<
                            AuthBloc,
                            AuthState
                          >(
                            builder: (context, state) {
                              if (state
                                  is AuthInitiateState) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle:
                                        TextStyle(
                                          fontFamily:
                                              'SB',
                                          fontSize:
                                              16,
                                        ),
                                    minimumSize:
                                        Size(
                                          200,
                                          48,
                                        ),
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
                                      AuthLoginRequestEvent(
                                        _usernameTextController
                                            .text,
                                        _passwordTextController
                                            .text,
                                      ),
                                    );
                                    WidgetsBinding
                                        .instance
                                        .addPostFrameCallback((
                                          _,
                                        ) {
                                          nviagt(
                                            context,
                                            ProfileScreen(),
                                          );
                                        });
                                  },
                                  child: Text(
                                    'ورود به حساب کاربری ',
                                  ),
                                );
                              }
                              if (state
                                  is AuthLodingState) {
                                return CircularProgressIndicator();
                              }
                              if (state
                                  is AuthResponseLodingState) {
                                Text widget =
                                    Text('');
                                state.reponse
                                    .fold(
                                      (l) {
                                        widget =
                                            Text(
                                              l,
                                            );
                                      },
                                      (r) {
                                        widget =
                                            Text(
                                              r,
                                            );
                                      },
                                    );
                                return widget;
                              }
                              return Text(
                                'خطای نامشخص',
                              );
                            },
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
