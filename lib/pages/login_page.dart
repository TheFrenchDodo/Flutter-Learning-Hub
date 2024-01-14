import 'package:flutter/material.dart';
import 'package:dorian/services/auth/auth_service.dart';
import 'package:dorian/components/my_auth_button.dart';
import 'package:dorian/components/my_textfield.dart';
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

       body: Center(
        // child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              // logo & Welcome back text
              const SizedBox(height: 30),
              Icon(
                Icons.tag_faces_outlined,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 30),
              Text(
                AppLocalizations.of(context)!.welcome_back,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 25),

              // Email field
              MyTextField(
                hintText: "email@example.com",
                obscureText: false, 
                controller: _emailController,
              ),
              SizedBox(height: 16),

              // Password field
              MyTextField(
                hintText: AppLocalizations.of(context)!.password,
                obscureText: true,
                controller: _passwordController,
              ),
              SizedBox(height: 20),

              // Login button
              MyAuthButton(
                text: AppLocalizations.of(context)!.login,
                onTap: () => login(context),
              ),
              Expanded(child: Container()),

              // Register section
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector( 
                  onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.not_a_member,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 8),

                        // Register now button
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              AppLocalizations.of(context)!.register_now,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),  
              ),
               SizedBox(height: 20),   // TODO: search for a better way to solve "Bottom overflowed by ... pixels"
            ],
          ),
        ),
      )
      ;
  }
}
