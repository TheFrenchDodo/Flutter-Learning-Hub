import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        /*--- Go Back button ---*/
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary, 
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back_ios_new_outlined),
                const SizedBox(width: 8),
              ]
            ),
          ),
        ]
      )
    );
  }
}
