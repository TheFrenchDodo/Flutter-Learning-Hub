import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/services/auth/auth_service.dart';
import 'package:flutter_test_application_1/components/my_button.dart';
import 'package:flutter_test_application_1/components/my_textfield.dart';

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
          _emailController.text, _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } 
    
    else{
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      appBar: AppBar(
        title: const Text("register_page"),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Icon(
                Icons.tag_faces_outlined,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 30),

              Text(
                "Let's create an account", style: TextStyle(color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              MyTextField(
                hintText: "Email",
                obsureText: false, 
                controller: _emailController,
              ),

              const SizedBox(height: 16),

              // Password texfield
              MyTextField(
                hintText: "Password",
                obsureText: true,
                controller: _passwordController,
                ),

              const SizedBox(height: 16),

              // Confirm password textfield
              MyTextField(
                hintText: "Confirm password",
                obsureText: true,
                controller: _confirmPasswordController,
                ),

                const SizedBox(height: 25),

                // Register button
                MyButton(
                  text: "Register",
                  onTap: () => register(context),
                ),

                // Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ? ",
                        style: 
                            TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Login now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ),
                ],
              )
            ],
          )
        ),
      )
    );
  }
}
