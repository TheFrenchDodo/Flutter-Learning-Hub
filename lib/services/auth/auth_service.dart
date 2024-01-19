import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AuthService {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get the current user
  User? getCurrentUser(){
    return _auth.currentUser;
  }
  // get the name of the user
  String? getCurrentUserName(){
    return _auth.currentUser?.displayName;
  }

  // get the name of the user
  String? getCurrentUID(){
    return _auth.currentUser?.uid;
  }
  
  // sign in
  Future<UserCredential> signInWithEmailPassword(context, String email, password) async{
    try{
      // sign user in 
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // save user info
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          "uid": userCredential.user!.uid,
          "email": email,
          // "name": null
        },
      );
      return userCredential;
      
    }
     catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Center(child:Text(AppLocalizations.of(context)!.invalid_email),)
            ),
          );
        }
        else if (e.code == 'invalid-password') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Center(child:Text(AppLocalizations.of(context)!.invalid_password),)
            ),
          );
        }
        else if (e.code == 'channel-error') {
          showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(child:Text(AppLocalizations.of(context)!.channel_error),)
            )
          );
        }
        else{
          showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(child: Text(AppLocalizations.of(context)!.error),)
            )
          );
        }
          throw Exception(e);
        }
      throw Exception(e);
      }
    }

  // sign up
  Future<UserCredential> signUpWithEmailPassword(context, String email, password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      // save user info
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          "uid": userCredential.user!.uid,
          "email": email,
          // "name": AppLocalizations.of(context)!.unknown_user
        },
      );
        return userCredential;
    } on FirebaseAuthMultiFactorException catch (e) {
      throw Exception(e.code);
      
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Center(child:Text(AppLocalizations.of(context)!.email_already_in_use),)
            ),
          );
          // throw Exception(e);
        }
        else if (e.code == 'weak-password') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Center(child:Text(AppLocalizations.of(context)!.weak_password),)
            ),
          );
        }
        else if (e.code == 'invalid-email') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Center(child:Text(AppLocalizations.of(context)!.invalid_email),)
            ),
          );
        }
        else if (e.code == 'operation-not-allowed') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Center(child:Text(AppLocalizations.of(context)!.operation_not_allowed),)
            ),
          );
        }
        else if (e.code == 'channel-error') {
          showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(child:Text(AppLocalizations.of(context)!.channel_error),)
            )
          );
        }
      }
      throw Exception(e);
    }
  }

  // sign out
  Future<void> signOut() async{
    return await _auth.signOut();
  }
}
