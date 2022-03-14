//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';



class AuthMethods {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  
  User currentUser;

  Future<User> getCurrentUser() async {
    this.currentUser = _auth.currentUser;
    return this.currentUser;
  }


  Future<UserCredential> signUp(email, password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      return user;
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Sign Up Failed',
          textColor: Colors.black,
          backgroundColor: Colors.white);
      print("Auth methods error");
      print(e.toString());
      return null;
    }
  }

  Future<bool> signIn(email, password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      if(user!=null){
        return true;
      }
      else{
        return false;
      }

    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Sign In Failed',
          textColor: Colors.black,
          backgroundColor: Colors.white);
      print("Auth methods error");
      print(e.toString());
      return false;
    }
  }

  Future<bool> authenticateUserMail(String email) async {
    QuerySnapshot result = await _fireStore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    final List<DocumentSnapshot> docs = result.docs;

    //if user is registered then length of list > 0 or else less than 0
    return docs.length == 0 ? false : true;
  }


  getCurrentUserDetails(String id) async {
    DocumentSnapshot currentUser =
    await _fireStore.collection('users').doc(id).get();
    return currentUser;
  }
 

}
