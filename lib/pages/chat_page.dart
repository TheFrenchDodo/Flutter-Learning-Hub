import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorian/components/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:dorian/components/my_circular_indicator.dart';
import 'package:dorian/components/my_textfield.dart';
import 'package:dorian/services/auth/auth_service.dart';
import 'package:dorian/services/chat/chat_services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatPage extends StatelessWidget{
  final String receiverEmail;
  final String receiverID;

  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  
  // send message
  void sendMessage()async{
    if (_messageController.text.isNotEmpty){
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(receiverEmail),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput(context),
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID), 
      builder: (context, snapshot){
     
         if (snapshot.hasError){
          return Text(AppLocalizations.of(context)!.error);
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child:
            MyCircularIndicator());
        }

        // return list view
        return ListView(
          children: 
          snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // build message item
  Widget _buildMessageItem (DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data["senderEmail"] == _authService.getCurrentUser()!.uid;
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft; 
    
    return Container(
      alignment: alignment, 
      // color: color, 
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children:[
          MyChatBubble(
            message: data["message"], 
            isCurrentUser: isCurrentUser
            ),
          
        ],
      ),
    );
  }

  // build message input
  Widget _buildUserInput(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 20, 10),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              hintText: AppLocalizations.of(context)!.type_message,
              obscureText: false,
              controller: _messageController,
            ),
          ),

          // send button
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.arrow_circle_up_rounded),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary, 
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
          )
        ],
      )
    );
  }
}

