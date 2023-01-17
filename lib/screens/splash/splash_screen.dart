import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla/core/colours.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // clearSharedPreference();
    return Scaffold(
      backgroundColor: AppColours.mainColour,
      body: Center(
        child: Image.asset("assets/images/Logo.png"),
      ),
    );
  }

  void clearSharedPreference() async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.clear();
  }
}