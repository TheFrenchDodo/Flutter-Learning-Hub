import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
      throw 'Error during sign up: $e';
    }
  }

  // // delete profile
  // Future<void> deleteUser(context) async {

  //   ///--- Delete User Account ---///
  //   // // email textfield
  //   // MyTextField(
  //   //   hintText: "email@example.com",
  //   //   obscureText: false, 
  //   //   controller: _emailController,
  //   // );

  //   // const SizedBox(height: 16);
    
  //   // // password textfield
  //   // MyTextField(
  //   //   hintText: AppLocalizations.of(context)!.password,
  //   //   obscureText: true,
  //   //   controller: _passwordController,
  //   // );

  //   AuthCredential credential = EmailAuthProvider.credential(
  //     email: getCurrentUser()!.email!,
  //     password: _passwordController.text,
  //   );

  //   try {
  //     await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(credential);
  //     await FirebaseAuth.instance.currentUser!.delete();

  //   ///--- Delete User Data ---///
  //   String docID = FirebaseAuth.instance.currentUser!.uid;
    
  //   await _firestore
  //     .collection("Users")
  //     .doc(docID)
  //     .delete();
    
  //   } catch (e) {
  //     if (context.mounted){ // to resolve "Don't use 'BuildContext' across async gaps around showDialog" warning
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text(e.toString()),
  //       ),
  //     );
  //     }
  //   }
  // }

  // sign out
  Future<void> signOut() async{
    return await _auth.signOut();
  }
}
