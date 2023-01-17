import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:salla/Core/app_routes.dart';
import 'package:salla/screens/splash/provider/splash_screen_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  SplashState state = SplashState();

  Future<void> init(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    if (shared.containsKey("language")) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.language, (route) => false);
    }
  }
}
