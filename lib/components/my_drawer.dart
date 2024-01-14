import 'package:flutter/material.dart';
import 'package:dorian/pages/home_page.dart';
import 'package:dorian/pages/my_profile.dart';
import 'package:dorian/pages/learningscreen.dart';
import 'package:dorian/pages/settingsscreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              children: [
              //logo
              DrawerHeader(
                child: Center(
                  child: Image.asset(
                    'assets/rau_logo.png', 
                    width: 80,
                    height: 80,
                  ),
                  ),
                ),

              // home tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text(AppLocalizations.of(context)!.home),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);

                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      )
                    );
                  },
                ),
              ),
              
              // settings tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text(AppLocalizations.of(context)!.settings),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to the settings
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(),
                      )
                    );
                  },
                ),
              ),

              // learning tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text(AppLocalizations.of(context)!.learning),
                  leading: const Icon(Icons.school),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to the learning
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LearningScreen(),
                      )
                    );
                  },
                ),
              ),
            ],
          ),

          // profile tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: Text(AppLocalizations.of(context)!.my_profile),
              leading: const Icon(Icons.account_box),
              onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to the learning
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProfile(),
                      )
                    );
                  },
            ),
          ),
        ],
      ),
    );
  }
}
