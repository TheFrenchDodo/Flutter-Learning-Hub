// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dorian/components/my_circular_indicator.dart';
import 'package:dorian/components/user_tile.dart';
import 'package:dorian/pages/chat_page.dart';
import 'package:dorian/services/auth/auth_service.dart';
import 'package:dorian/services/chat/chat_services.dart';


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
      String nameToShow = userData["email"].split("@")[0];
      return UserTile(
        text: nameToShow,
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
