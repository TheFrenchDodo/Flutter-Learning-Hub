import 'package:flutter/material.dart';

class MyCircularIndicator extends StatelessWidget {
  const MyCircularIndicator({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0, // Adjust the width as needed
      height: 50.0, // Adjust the height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
        color: Theme.of(context).colorScheme.background,
      ),
      child: Center(
        child: CircularProgressIndicator(
          semanticsLabel: 'Loading',
          semanticsValue: '30%',
          strokeWidth: 5.0,
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
  }
}
