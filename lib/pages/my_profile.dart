import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/auth/auth_gate.dart';
import 'package:flutter_test_application_1/components/my_bottomwidget.dart';
import 'package:flutter_test_application_1/components/my_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_application_1/components/my_textfield.dart';
// import 'package:flutter_test_application_1/services/delete_account.dart';


class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // logout account
  void logout(BuildContext context) async {
    
    ///--- Logout account ---///
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text(AppLocalizations.of(context)!.confirm_logout),
          content: Text(AppLocalizations.of(context)!.logout_confirm_text),
          actions: <Widget>[
            // Cancel button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(AppLocalizations.of(context)!.cancel),
            ),

            // Confirm Logout button
            TextButton(
              onPressed: () {
                auth.signOut();
                Navigator.of(context).pop(true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthGate())
                );
              },
              child: Text(AppLocalizations.of(context)!.confirm),
            ),
          ],
        );
      },
    );
  }

  // get the current user
  User? getCurrentUser(){
    return auth.currentUser;
   }
  // get the current mail address
  getCurrentUsermail(){
    return auth.currentUser?.email;
  }
  // get the current UID
  getCurrentUserUID(){
    return auth.currentUser?.uid;
  }

  // Get info profile
  String? getUserInfo(context) {

    final user = getCurrentUser();

    if (user != null) {
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;
      bool emailVerified = user.emailVerified;
      String uid = user.uid;

      String myInfoList = "Name: $name \nEmail: $email \nPhotoURL: $photoUrl \nEmailVerified: $emailVerified \nUID: $uid";

      return myInfoList;
    }
    return null;
  }

  ///--- Delete account ---///
  void delete(BuildContext context) async {

  final TextEditingController passwordController = TextEditingController();

    // Delete account Dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.delete_account),
          content: Column(
            children: [
              Text(AppLocalizations.of(context)!.delete_confirm_text),
              MyTextField(
                hintText: AppLocalizations.of(context)!.password,
                obscureText: true,
                controller: passwordController,
              ),
            ],
          ),

          actions: <Widget>[    
            // Cancel button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); 
              },
              child: Text(AppLocalizations.of(context)!.cancel),
            ),

            TextButton(
            // Confirm Delete button
              onPressed: () {
                deleteUser(context, passwordController, getCurrentUsermail(), getCurrentUserUID());
                
                Navigator.of(context).pop(true);
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AuthGate())
                );
              },
              child: Text(AppLocalizations.of(context)!.confirm),
            ),
          ]
        );
      },
    );
  }

  Future<void> deleteUser(context, passwordController, mail, uid) async {

    try {
      ///--- Delete User Account ---///
      AuthCredential credential = EmailAuthProvider.credential(
        email: mail,
        password: passwordController.text,
      );
      await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(credential);
      await FirebaseAuth.instance.currentUser!.delete();

      ///--- Delete User Data ---///
    
      await _firestore
      .collection("Users")
      .doc(uid)
      .delete();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("account Deleted"),
        ),
      ); 
    
    } catch (e) {
      if (context.mounted){ // to resolve "Don't use 'BuildContext' across async gaps around showDialog" warning
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.my_profile),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.tertiary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 50,
                    ),
                    Text(
                      //user?.email ?? AppLocalizations.of(context)!.unknown_user,
                      getUserInfo(context) ?? AppLocalizations.of(context)!.unknown_user,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              
              // Logout account
              ListTile(
                title: Padding(
                  
                  padding: const EdgeInsets.all(0),
                  child: Text(AppLocalizations.of(context)!.logout),
                ),
                leading: Padding( 
                  padding: const EdgeInsets.only(left: 20),
                  child: const Icon(Icons.logout)
                ),
                onTap: () => logout(context),
              ),
              SizedBox(height: 20),

              // Delete account
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16), // Adjust the padding as needed
                child: ListTile(
                  title: Text(AppLocalizations.of(context)!.delete_account),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.white),
                  ),
                  tileColor: Colors.red,
                  leading: Padding( 
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(Icons.delete),
                  ),
                  onTap: () => delete(context)
                ),
              ),

            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomWidget(),
    );
  }
}