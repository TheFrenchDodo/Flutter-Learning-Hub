import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text("homescreen"),
       ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /*--- Fetch button ---*/
          // ElevatedButton(
          //   onPressed: () {
          //     fetchData();
          //   },
          //   child: const Text("Fetch Data"),
          // ),
          // const SizedBox(height: 16),

          /*--- Send button ---*/
          // ElevatedButton(
          //   onPressed: () {
          //     sendData();
          //   },
          //   child: const Text("Send Data"),
          // ),

         ],
       ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      //color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              backgroundColor: Colors.black, 
              foregroundColor: Color.fromRGBO(255, 255, 255, 1)
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
