import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async{
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
        },
      );

      return userCredential;
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
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
        },
      );

        return userCredential;
    } on FirebaseAuthMultiFactorException catch (e) {
      throw Exception(e.code);
    } catch (e) {
    // Catch all other exceptions and throw a general exception
      throw Exception('Error during sign up: $e');
    }
  }


  // sign out
  Future<void> signOut() async{
    return await _auth.signOut();
  }

  // error

}
