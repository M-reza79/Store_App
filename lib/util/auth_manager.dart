import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/di/di.dart';

class AuthManager {
  // این کلاس برای مدیریت توکن های کاربر استفاده می شود
  // و در صورت تغییر توکن، یک نوتیفایر برای اطلاع رسانی به سایر بخش های برنامه ایجاد می کند

  static final ValueNotifier<String?>
  authChangeNotifier = ValueNotifier(null);

  // این متغیر برای ذخیره توکن کاربر استفاده می شود
  // و در صورت تغییر توکن، مقدار آن به روز رسانی می شود
  static final SharedPreferences
  _sharedPref = locator.get();

  //سیو
  // این متد برای ذخیره توکن کاربر در SharedPreferences استفاده می شود
  static void saveToken(String token) async {
    _sharedPref.setString(
      'access_token',
      token,
    );
    authChangeNotifier.value = token;
  }

  //رید
  // این متد برای خواندن توکن کاربر از SharedPreferences استفاده می شود
  static String readAuth() {
    return _sharedPref.getString(
          'access_token',
        ) ??
        'خطا';
  }

  //لوگت
  // این متد برای خروج کاربر و پاک کردن توکن از SharedPreferences استفاده می شود
  static void logouut() {
    _sharedPref.clear();
    authChangeNotifier.value = null;
  }

  // این متد برای بررسی ورود کاربر استفاده می شود
  // اگر توکن خالی باشد، کاربر وارد نشده است
  // اگر توکن خالی نباشد، کاربر وارد شده است
  static bool isLogin() {
    String token = readAuth();
    return token
        .isNotEmpty; //اگه خالی نباشه  ترو بر میگردونه  ولی اگه خالی باشه فالس برمیگردونه
  }
}
