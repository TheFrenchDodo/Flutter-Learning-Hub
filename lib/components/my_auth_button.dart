import 'package:flutter/material.dart';

class MyAuthButton extends StatelessWidget{
  final void Function()? onTap;
  final String text;

  const MyAuthButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Text(
            text, 
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
              ),
            ),
        ),
      ),
    );
  }
}
