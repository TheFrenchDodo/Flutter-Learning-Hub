import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_application_1/components/my_circular_indicator.dart';
import 'package:flutter_test_application_1/components/user_tile.dart';
import 'package:flutter_test_application_1/pages/chat_page.dart';
import 'package:flutter_test_application_1/services/auth/auth_service.dart';
import 'package:flutter_test_application_1/services/chat/chat_services.dart';


class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.contact_page),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: Center(
      child: _buildUserList(),
      )
    );
  }

    Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot){

        if (snapshot.connectionState == ConnectionState.waiting){
          //return const Text("Loading...");
          return MyCircularIndicator();
        }

        else if (snapshot.hasError){
          return Text(AppLocalizations.of(context)!.error);
        }
        
        //return the list view
        return ListView(
          children: snapshot.data!.map<Widget>(
            (userData) => _buildUserListItem(
              userData, // userData only get the email and uid
              context)).toList(),
        );
      }
    );
  }

  // build list tile for user     // the 'Map' contains that user data
  Widget _buildUserListItem(Map<String, dynamic> userData,BuildContext context){
    if (userData["uid"] != _authService.getCurrentUser()?.uid){
      // String name = userData["name"] ?? "test";
      // print(userData);
      // userData.addAll({"name": name});
      // print(userData);
      return UserTile(
        text: userData["email"],
        // text: name,
        onTap:(){
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                var offsetAnimation = animation.drive(tween);

                return SlideTransition(position: offsetAnimation, child: child);
              },
            ),
          );
        },
      );
      
    } else{
      return Container();
    }
  }
}
