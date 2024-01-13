import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/services/auth/auth_service.dart';
import 'package:flutter_test_application_1/components/my_auth_button.dart';
import 'package:flutter_test_application_1/components/my_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  LoginPage({
    super.key, 
    required this.onTap
    });

  // login method
  void login(BuildContext context) async {
    final authService = AuthService();

    // try to login
    try {
       await authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    }

    //catch any errors
    catch (e) {
      if (context.mounted){ 
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children:[

              const SizedBox(height: 30),
              Icon(
                Icons.tag_faces_outlined,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 30),
              
                // Welcome back message
                Text(
                  AppLocalizations.of(context)!.welcome_back,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
              
                const SizedBox(height: 25),
              
                // email textfield
                MyTextField(
                  hintText: "email@example.com",
                  obscureText: false, 
                  controller: _emailController,
                ),
              
                const SizedBox(height: 16),
              
                // password textfield
                MyTextField(
                  hintText: AppLocalizations.of(context)!.password,
                  obscureText: true,
                  controller: _passwordController,
                  ),
              
                  const SizedBox(height: 25),
                  
                  // login button
                  MyAuthButton(
                    text: AppLocalizations.of(context)!.login,
                    onTap:() => login(context),
                  ),
              
                  // register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.not_a_member,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 17
                        ),
                      ),
                      SizedBox(width: 0, height: 40),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          AppLocalizations.of(context)!.register_now, 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Theme.of(context).colorScheme.primary,
                            //backgroundColor: Theme.of(context).colorScheme.secondary
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ),



      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextField(
      //         controller: _emailController,
      //         decoration: const InputDecoration(
      //           hintText: "Email",
      //         ),
      //       ),
      //       TextField(
      //         controller: _passwordController,
      //         decoration: const InputDecoration(
      //           hintText: "Password",
      //         ),
      //       ),
      //       ElevatedButton(
      //          onPressed: () { Navigator.pushNamed(context, "/home");
      //         //   if (_emailController.text == "user@example.com" &&
      //         //       _passwordController.text == "password") {
      //         //     Navigator.pushNamed(context, "/home");
      //         //   } else {
      //         //     showDialog(
      //         //       context: context,
      //         //       builder: (context) => const AlertDialog(
      //         //         title: Text("Error"),
      //         //         content: Text("Invalid email or password"),
      //         //       ),
      //         //     );
      //         //   }
      //         },
      //         child: const Text("Login"),
      //       ),
      //     ],
      //   ),
      // ),
      )
    );
  }
}
