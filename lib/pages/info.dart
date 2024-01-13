// import 'package:flutter/material.dart';
// import 'package:flutter_test_application_1/components/my_circular_indicator.dart';
// import 'package:package_info/package_info.dart';

// class InfoPage extends StatefulWidget {
//   @override
//   InfoPageState createState() => InfoPageState();
// }

// /* --- Test from ChatGPT but not working --- */

// class InfoPageState extends State<InfoPage> {
//   late String appVersion;

//   @override
//   void initState() {
//     super.initState();
//     _getAppVersion();
//   }

//   Future<void> _getAppVersion() async {
//     try {
//       PackageInfo packageInfo = await PackageInfo.fromPlatform();
//       setState(() {
//         appVersion = packageInfo.version;
//       });
//     } catch (e) {
//       print("Error getting app version: $e");
//     }
//   }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('App Info'),
//     ),
//     body: Center(
//       child: appVersion != null
//           ? _buildAppVersionText()
//           : const MyCircularIndicator(), // Show loading indicator while fetching app version
//     ),
//   );
// }

// Widget _buildAppVersionText() {
//   return Text(
//     'App Version: $appVersion',
//     style: TextStyle(fontSize: 18),
//   );
// }

// }
