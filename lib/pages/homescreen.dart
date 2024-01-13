import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/components/my_bottomwidget.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,

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
