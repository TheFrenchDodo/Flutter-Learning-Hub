import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dorian/auth/auth_gate.dart';
import 'package:dorian/firebase_options.dart';
import 'package:dorian/themes/dark_mode.dart';
import 'package:dorian/themes/light_mode.dart';
import 'package:dorian/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark, // Change this to Brightness.light if your background is dark
      ),
    );


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      //theme: Provider.of<ThemeProvider>(context).themeData,
      theme: lightMode,
      darkTheme: darkMode,
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
