import 'package:flutter/widgets.dart';
import 'package:salla/core/app_routes.dart';
import 'package:salla/screens/on%20board/provider/on_board_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardProvider extends ChangeNotifier {
  OnBoardState state = OnBoardState();

  void onBoardDone(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setBool("onBoarded?", true);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
  }

  void nextPressed() {
    state.controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
