import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  final Curve curve;

  CustomPageRoute({
    required this.page,
    required this.curve,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween(
              begin: Offset(1.0, 0.0),
              end: Offset.zero
              ).chain(
                CurveTween(curve: curve)
              );
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}
