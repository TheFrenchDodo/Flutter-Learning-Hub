import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dorian/services/auth/auth_service.dart';
import 'package:dorian/components/my_auth_button.dart';
import 'package:dorian/components/my_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RegisterPage extends StatelessWidget{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});
  
  void register(BuildContext context){
    final auth = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try{
        auth.signUpWithEmailPassword(
          context,
          _emailController.text,
          _passwordController.text,
        );

        // login page redirection after registration  
        ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, "/login");
          },
          child: Text(AppLocalizations.of(context)!.login),
        );

      } catch (e) {
        if (e is FirebaseAuthException) {
          // Show a custom dialog for invalid password
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("$e"),
            ),
          );
        } else {
          // Show the default error dialog for other errors
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(AppLocalizations.of(context)!.error),
              ),
            );
          }
          print(e);
        }
      }
    } else {
      if (context.mounted){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.passwords_dont_match),
        ),
      );
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),
        backgroundColor: Theme.of(context).colorScheme.tertiary
      ),

       body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 30),
              
              // logo & Let's create an account text
              Icon(
                Icons.tag_faces_outlined,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 30),
              Text(AppLocalizations.of(context)!.create_account_text, 
                style: TextStyle(color: Theme.of(context).colorScheme.primary,
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

              // Password texfield
              MyTextField(
                hintText: AppLocalizations.of(context)!.password,
                obscureText: true,
                controller: _passwordController,
                ),

              const SizedBox(height: 16),

              // Confirm password textfield
              MyTextField(
                hintText: AppLocalizations.of(context)!.confirm_password,
                obscureText: true,
                controller: _confirmPasswordController,
                ),

                const SizedBox(height: 25),

                // Register button
                MyAuthButton(
                  text: AppLocalizations.of(context)!.register,
                  onTap: () => register(context),
                ),
                
                const SizedBox(height: 200),  // TODO: search for a better way to solve "Bottom overflowed by ... pixels" 

              // login section
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
                          AppLocalizations.of(context)!.already_member,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 8),

                        // Login now button
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
                              AppLocalizations.of(context)!.login_now,
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
            ],
          )
        ),
      )
      );
    
  }
}
