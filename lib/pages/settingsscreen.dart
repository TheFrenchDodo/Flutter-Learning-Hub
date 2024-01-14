import 'package:flutter/material.dart';
import 'package:dorian/components/my_bottomwidget.dart';
import 'package:dorian/components/my_drawer.dart';
import 'package:dorian/themes/theme_provider.dart';
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
      bottomNavigationBar: BottomWidget(),
    );
  }
      
      // TODO: Add a app version button
      // Add a button to navigate to the 'Info' page
      // floatingActionButton: FloatingActionButton(

      //   onPressed: () async{
      //     PackageInfo packageInfo = await PackageInfo.fromPlatform();
      //     String appVersion = packageInfo.version;
      //     print("App Version: $appVersion");

      //     showDialog(
      //       context: context,
      //       builder: (context) => AlertDialog(
      //         title: Text('App Version: $appVersion'),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.info),
      // ),



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
