import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla/screens/home/provider/home_screen_provider.dart';
import 'package:salla/screens/language%20choice/language_screen.dart';
import 'package:salla/screens/login/components/failed.dart';
import 'package:salla/screens/login/login_screen.dart';
import 'package:salla/screens/on%20board/on_board_screen.dart';
import 'package:salla/screens/splash/splash_screen.dart';

import '../screens/home/home_screen.dart';
import '../screens/login/components/verified.dart';
import '../screens/splash/provider/splash_screen_provider.dart';

class AppRoutes {
  static const String home = "Home";
  static const String splash = "/";
  static const String language = "Language";
  static const String login = "Login";
  static const String loginVerified = "LoginVerified";
  static const String loginFailed = "LoginFailed";
  static const String onBoard = "On Board";

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) {
            context.read<SplashProvider>().init(context);
            return const SplashScreen();
          },
        );
      case home:
        return MaterialPageRoute(
          builder: (context) {
            context.read<HomeProvider>().init();
            return const Home();
          },
        );
      case onBoard:
        return MaterialPageRoute(
          builder: (context) {
            return OnBoard();
          },
        );
      case language:
        return MaterialPageRoute(
          builder: (context) {
            return Language();
          },
        );
      case login:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );  
        case loginVerified:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginVerified();
          },
        );
        case loginFailed:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginFailed();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text("No route defined for ${setting.name}"),
              ),
            );
          },
        );
    }
  }
}
