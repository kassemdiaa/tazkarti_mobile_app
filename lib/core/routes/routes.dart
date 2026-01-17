import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tazkarti/features/authentication/login/login_screen.dart';
import 'package:tazkarti/features/authentication/register/register_screen.dart';
import 'package:tazkarti/features/mainlayout/events/category_screen.dart';
import 'package:tazkarti/features/mainlayout/mainayout.dart';
import 'package:tazkarti/features/sidebar/about_us/about_screen.dart';
import 'package:tazkarti/features/sidebar/contact_us/contact_screen.dart';
import 'package:tazkarti/features/sidebar/faq/faq_screen.dart';
import 'package:tazkarti/features/sidebar/our_stores/our_stores_screen.dart';
import 'package:tazkarti/features/sidebar/stadium_location/stadium_location_screen.dart';

abstract class RoutesManeger {
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String mainlayout = '/mainlayout';
  static const String stadiumLocationsScreen = '/stadiumLocations';
  static const String ourStoresScreen = '/ourStores';
  static const String faqScreen = '/faq';
  static const String aboutScreen = '/about';
  static const String contactUsScreen = '/contactUs';
  static const String categoryScreen = '/categoryScreen';

  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case registerScreen:
        return CupertinoPageRoute(builder: (context) => RegisterScreen());
      case loginScreen:
        return CupertinoPageRoute(builder: (context) => LoginScreen());
      case mainlayout:
        return CupertinoPageRoute(builder: (context) => MainLayout());
      case stadiumLocationsScreen:
        return CupertinoPageRoute(
          builder: (context) => StadiumLocationScreen(),
        );
      case ourStoresScreen:
        return CupertinoPageRoute(builder: (context) => OurStoresScreen());
      case categoryScreen:
        return CupertinoPageRoute(builder: (context) => CategoryScreen());
      case faqScreen:
        return CupertinoPageRoute(builder: (context) => FaqScreen());
      case aboutScreen:
        return CupertinoPageRoute(builder: (context) => AboutScreen());
      case contactUsScreen:
        return CupertinoPageRoute(builder: (context) => ContactScreen());
    }
    return null;
  }
}
