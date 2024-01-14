import 'package:flutter/material.dart';

class MyChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const MyChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: 
        isCurrentUser ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(message),
    );
  }
}
