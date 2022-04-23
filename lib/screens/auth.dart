import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  getCurrentUser(){
    return _auth.currentUser;
  }
  /*
  Future signInWithEmailAndPassword(String email, String password){
    try {
      AuthResult result = await _auth.
    }catch(e){

    }
  }

   */
}