import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/components/my_bottomwidget.dart';
import 'package:flutter_test_application_1/components/my_drawer.dart';
import 'package:flutter_test_application_1/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsScreen extends StatelessWidget {
  final TextEditingController textFieldController = TextEditingController();
  final String retrievedData = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
        automaticallyImplyLeading: true, // top left button
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        //foregroundColor: Theme.of(context).colorScheme.primary,
        //titleTextStyle: TextStyle(
        //   color: Colors.black,
        //   fontSize: 20),
        // elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(AppLocalizations.of(context)!.dark_mode),
            Switch(
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
              onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            ),
          ],
        ),
      ),
      
      // Add a button to navigate to the 'Info' page
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => InfoPage(),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.info),
      // ),

      bottomNavigationBar: BottomWidget(),
    );
  }

  /*
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
                      //await retrieveData();   ///--- à corriger ---///
                      //setState(() {});
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
  }*/

  Future<void> storeData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("stored_data", data);
  }

  //--- à corriger ---//

  // Future<void> retrieveData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final storedData = prefs.getString("stored_data") ?? "No data stored";
  //   setState(() {
  //     retrievedData = storedData;
  //   });
  // }

  Future<void> clearData() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
