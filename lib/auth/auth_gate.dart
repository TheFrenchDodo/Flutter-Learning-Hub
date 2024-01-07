import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/auth/login_or_register.dart';
import 'package:flutter_test_application_1/pages/home_page.dart';

class AuthGate extends StatelessWidget{
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder(

        // constantly listening to the authStateChanges if the user is signed in or not
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return HomePage();
          }

          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
