import 'package:flutter/widgets.dart';
import 'package:salla/core/app_routes.dart';
import 'package:salla/screens/language%20choice/provider/language_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  LanguageState state = LanguageState();

  void changeLanguage(String language) async {
    state.selectedLanguage = language;
    notifyListeners();
  }

  void confirmLanguage(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("language", state.selectedLanguage);
    notifyListeners();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.onBoard, (route) => false);
  }

  initLocale() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (shared.containsKey("language")) {
      state.selectedLanguage = shared.getString("language")!;
      notifyListeners();
    }
  }
}
