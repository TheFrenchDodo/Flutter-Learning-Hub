import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learning_hub/models/message.dart';

class ChatService{
  // get final instance of firestore and auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String,dynamic>>> getUsersStream(){
    return _firestore.collection("Users").snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        // go trough each user
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String receiverID, message) async{
    // get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();


    // create a new message
    Message newMessage = Message(
      senderID: currentUserID, 
      senderEmail: currentUserEmail, 
      receiverID: receiverID, 
      message: message, 
      timestamp: timestamp,
    );

    // construct chat room ID
    List<String> userIDs = [currentUserID, receiverID];
    userIDs.sort(); 
    String chatRoomID = userIDs.join("_");

    // add new message to the database
    await _firestore
    .collection("chat_rooms")
    .doc(chatRoomID)
    .collection("messages")
    .add(newMessage.toMap());
  }

  // get message
  Stream<QuerySnapshot> getMessages(String userID, otherUserID){
    List<String> userIDs = [userID, otherUserID];
    userIDs.sort();
    String chatRoomID = userIDs.join("_");

    return _firestore
    .collection("chat_rooms")
    .doc(chatRoomID)
    .collection("messages")
    .orderBy("timestamp", descending: false)
    .snapshots();
  }

}
