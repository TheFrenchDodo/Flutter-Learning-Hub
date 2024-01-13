import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      //color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

        // /*--- Go to Settings button ---*/
        //   ElevatedButton(
        //     onPressed: () {
        //       Navigator.pushReplacement(
        //         context,
        //         PageRouteBuilder(
        //           pageBuilder: (context, animation, secondaryAnimation) => SettingsScreen(),
        //           transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //             const begin = Offset(1.0, 0.0);
        //             const end = Offset.zero;
        //             const curve = Curves.easeInOut;
        //             var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        //             var offsetAnimation = animation.drive(tween);
        //             return SlideTransition(position: offsetAnimation, child: child);
        //           },
        //           transitionDuration: const Duration(milliseconds: 500),
        //         ),
        //       );
        //     },
        //     child: const Text("Settings"),
        //   ),


        /*--- Go to Learning button ---*/

          // ElevatedButton(
          //    onPressed: () { 
          //     Navigator.pushNamed(context, "/learning");
          //    },              
          //    child: const Text("Go to Learning"),
          // ),

        //   ElevatedButton(
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       PageRouteBuilder(
        //         pageBuilder: (context, animation, secondaryAnimation) => LearningScreen(),
        //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //           const begin = Offset(1.0, 0.0);
        //           const end = Offset.zero;
        //           const curve = Curves.easeInOut;
        //           var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        //           var offsetAnimation = animation.drive(tween);
        //           return SlideTransition(position: offsetAnimation, child: child);
        //         },
        //         transitionDuration: const Duration(milliseconds: 500),
        //       ),
        //     );
        //   },
        //   child: const Text("Go to Learning"),
        // ),

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
                //const Text("return"),
              ]
            ),
          ),
        ]
      )
    );
  }
}