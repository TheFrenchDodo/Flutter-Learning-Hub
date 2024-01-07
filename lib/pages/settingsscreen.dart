import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/pages/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  TextEditingController textFieldController = TextEditingController();
  String retrievedData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Settings"),
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 50),
                  Image(
                    image: AssetImage("assets/ours.gif"),
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 16),

                  TextField(
                    maxLength: 10,
                    controller: textFieldController,
                    decoration: InputDecoration(labelText: "Enter Data"),
                  ),
                  SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () async {
                      // Call storeData method with the entered text
                      await storeData(textFieldController.text);
                    },
                    child: Text("Store Data"),
                  ),
                  SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () async {
                      // Call retrieveData method and update the retrievedData state
                      await retrieveData();
                      setState(() {});
                    },
                    child: Text("Retrieve Data"),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Retrieved Data: $retrievedData",
                    style: TextStyle(fontSize: 16),
                  ),

                  SizedBox(height: 16),
                  
                  ElevatedButton(
                    onPressed: clearData,
                    child: Text("Clear Data"),
                  )
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 16,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Pop the current route and go back to the previous screen
          //       Navigator.pop(context);
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.black,
          //       foregroundColor: Color.fromRGBO(255, 255, 255, 1),
          //     ),
          //     child: Text("Go Back"),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }

  Future<void> storeData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("stored_data", data);
  }

  Future<void> retrieveData() async {
    final prefs = await SharedPreferences.getInstance();
    final storedData = prefs.getString("stored_data") ?? "No data stored";
    setState(() {
      retrievedData = storedData;
    });
  }

  Future<void> clearData() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
