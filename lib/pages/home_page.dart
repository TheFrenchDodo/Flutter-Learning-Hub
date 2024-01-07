import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/components/my_drawer.dart';
import 'package:flutter_test_application_1/components/user_tile.dart';
import 'package:flutter_test_application_1/pages/chat_page.dart';
//import 'package:flutter_test_application_1/services/auth/auth_service.dart';
import 'package:flutter_test_application_1/services/chat/chat_services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat & auth service
  final ChatService _chatService = ChatService();
  //final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home_page"),
      ),
      // body: Stack(
      //   children: [
      //     SingleChildScrollView(
      //       child: Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             SizedBox(height: 50),
      //             Image(
      //               image: AssetImage("assets/rau_logo.png"),
      //               fit: BoxFit.fill,
      //             ),
      //             SizedBox(height: 16),
      //             // Add other widgets as needed
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot){
        // if error
        if (snapshot.hasError){
          return const Text("Error");
        }
        // if loading
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading...");
        }
        
        //return the list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      }
    );
  }

  // build list tile for user // the 'Map' contains that user data
  Widget _buildUserListItem(Map<String, dynamic> userData,BuildContext context){
    return UserTile(
      text: userData["email"],
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverEmail: userData["email"],
            ),
          ),
        );
      },
    );
  }
}


