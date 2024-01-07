import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/services/auth/auth_service.dart';
import 'package:flutter_test_application_1/pages/learningscreen.dart';
import 'package:flutter_test_application_1/pages/settingsscreen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

    void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              children: [
              //logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                  ),
                ),
              ),

              // home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              
              // settings tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
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
                  title: const Text("L E A R N I N G "),
                  leading: const Icon(Icons.school),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to the settings
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

          // lougout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          ),

        ],
      ),
    );
  }
}
