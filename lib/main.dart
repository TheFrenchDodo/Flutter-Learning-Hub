import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_learning_hub/auth/auth_gate.dart';
import 'package:flutter_learning_hub/firebase_options.dart';
import 'package:flutter_learning_hub/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider("6LcE2FUpAAAAAFJdHZwjY_-1aIaudVtYzQPQctOm"),
    androidProvider: AndroidProvider.playIntegrity
    );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     systemNavigationBarColor: Colors.transparent,
    //     systemNavigationBarIconBrightness: Brightness.dark, // Change this to Brightness.light if your background is dark
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      // theme: lightMode,
      // darkTheme: darkMode,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('fr'), // Français
        Locale('nl'), // Nederlands
      ],
      // title: "My App",
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => WelcomeScreen(),
      //   "/login":(context) => LoginScreen(onTap: () {  },),
      //   "/home":(context) => HomePage(),
      //   "/settings": (context) => SettingsScreen(),
      //   "/learning": (context) => LearningScreen(),
      // },
    );
  }
}
