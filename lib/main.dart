import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test_application_1/auth/auth_gate.dart';
import 'package:flutter_test_application_1/firebase_options.dart';
import 'package:flutter_test_application_1/themes/dark_mode.dart';
import 'package:flutter_test_application_1/themes/light_mode.dart';
import 'package:flutter_test_application_1/themes/theme_provider.dart';
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

//  Future<void> fetchData() async {
  // final response = await http.get(
  //   Uri.parse("https://jsonplaceholder.typicode.com/todos/1")
  //   );
  // if (response.statusCode == 200) {
  //   print("Response Data: ${response.body}");
  // } else {
  //   print("Request failed with status: ${response.statusCode}");
  // }
// }

// Future<void> sendData() async {
  // try {
  //   final response = await http.post(
  //     Uri.parse("https://api.example.com/submit"),
  //     body: {
  //       "key1": "value1",
  //       "key2": "value2",
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     print("Response Data: ${response.body}");
  //   } else {
  //     print("Request failed with status: ${response.statusCode}");
  //   }
  // } catch (e) {
  //   print("Error during HTTP request: $e");
  // }
// }

// Future<void> retrieveData() async {
//   final prefs = await SharedPreferences.getInstance();
  
//   final username = prefs.getString("username") ?? "default_username";
//   final country = prefs.getString("country") ?? "unknown country";
//   final age = prefs.getInt("age") ?? "0";
//   final is_logged_in = prefs.getBool("is_logged_in") ?? false;
// }
