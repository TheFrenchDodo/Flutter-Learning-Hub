import 'package:flutter/material.dart';

class UserTile extends StatelessWidget{
  final String text;
  final void Function()? onTap;

  const UserTile({
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
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.fromLTRB(25, 5, 60, 7),
        padding: EdgeInsets.all(20),
        child: Row(
          children:[
            Icon(Icons.person_3_sharp),

            const SizedBox(width: 20),

            Text(text),
          ],
        ),
      ),
    );
  }
}
