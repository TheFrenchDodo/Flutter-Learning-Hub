import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Welcome to Dorian's App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello!"),
            Image.network("https://picsum.photos/250"),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/login");
              },
              child: const Text("Login"),
              )
          ],
        )
      ),
    );
  }
}
