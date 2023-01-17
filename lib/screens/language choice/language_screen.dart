import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla/core/assets.dart';
import 'package:salla/generated/l10n.dart';
import 'package:salla/screens/language%20choice/provider/language_provider.dart';


class Language extends StatelessWidget {
  String selectedLanguage = "en";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(S().choose_your_language, style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("English"),
              Radio(
                activeColor: Colors.orange,
                value: context.watch<LanguageProvider>().state.selectedLanguage == "en" ? 1 : 0,
                groupValue: 1,
                onChanged: (value) {
                  context.read<LanguageProvider>().changeLanguage("en");
                  AppAssets.language = "en";
                },
              ),
              const Text("العربية"),
              Radio(
                activeColor: Colors.orange,
                value: context.watch<LanguageProvider>().state.selectedLanguage == "ar" ? 1 : 0,
                groupValue: 1,
                onChanged: (value) {
                  context.read<LanguageProvider>().changeLanguage("ar");
                  AppAssets.language = "ar";
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.orange,
            ),
            child: TextButton(
              onPressed: () => context.read<LanguageProvider>().confirmLanguage(context),
              child: Text(S().cont, style: const TextStyle(color: Colors.white, fontSize: 22)),
            ),
          ),
        ],
      )
    );
  }
}