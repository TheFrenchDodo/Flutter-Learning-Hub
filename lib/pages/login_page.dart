import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/services/auth/auth_service.dart';
import 'package:flutter_test_application_1/components/my_button.dart';
import 'package:flutter_test_application_1/components/my_textfield.dart';

class LoginScreen extends StatelessWidget{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // tap to go to register page
  final void Function()? onTap;

  LoginScreen({super.key, required this.onTap});

  // login method
  void login(BuildContext context) {
    final authService = AuthService();

    // try to login
    try {
       authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    }

    //catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      appBar: AppBar(
        title: const Text("login_page"),
      ),
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children:[
                // logo
              const SizedBox(height: 30),
              Icon(
                Icons.tag_faces_outlined,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 30),
              
                // Welcome back message
                Text(
                  "Hi, welcome back !", style: TextStyle(color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  ),
                ),
              
                const SizedBox(height: 25),
              
                // email textfield
                MyTextField(
                  hintText: "Email",
                  obsureText: false, 
                  controller: _emailController,
                ),
              
                const SizedBox(height: 16),
              
                // password textfield
                MyTextField(
                  hintText: "Password",
                  obsureText: true,
                  controller: _passwordController,
                  ),
              
                  const SizedBox(height: 25),
                  
                  // login button
                  MyButton(
                    text: "Login",
                    onTap:() => login(context),
                  ),
              
                  // register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member ? ",
                        style: 
                            TextStyle(color: Theme.of(context).colorScheme.primary),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          "Register now",
                          style: TextStyle(fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                        ),
                      )
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
