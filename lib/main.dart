import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salla/Core/app_routes.dart';
import 'package:salla/generated/l10n.dart';
import 'package:salla/screens/home/provider/home_screen_provider.dart';
import 'package:salla/screens/language%20choice/provider/language_provider.dart';
import 'package:salla/screens/login/provider/login_provider.dart';
import 'package:salla/screens/on%20board/provider/on_board_provider.dart';
import 'package:salla/screens/splash/provider/splash_screen_provider.dart';
import 'fcm_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FCMService().startFCM(authenticated: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OnBoardProvider>(
            create: (context) => OnBoardProvider()),
        ChangeNotifierProvider<SplashProvider>(
            create: (context) => SplashProvider()),
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
        ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider()..initLocale()),
        ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider())
      ],
      child: Builder(builder: (ctx) {
        return MaterialApp(
          title: "Salla",
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(ctx.watch<LanguageProvider>().state.selectedLanguage),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      }),
    );
  }
}
