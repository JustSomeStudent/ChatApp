import 'package:flutter/material.dart';
import 'package:mix_chat_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants.dart';


//final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class AccountScreen extends StatefulWidget {
  static const String id = 'Account_screen';

  @override
  _AccountScreenState createState() => _AccountScreenState();
}
class _AccountScreenState extends State<AccountScreen>{

  void deleteAccount() async{

    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print(currentUser.uid);
    }
    try {
      await FirebaseAuth.instance.currentUser.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('The user must reauthenticate before this operation can be executed.');
      }
    }
  }
  String nickname = "";
  String email = "";
  String password = "";

  bool isObscurePassword = true;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text ('MixChat v0.1'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignIn()));},
        ),
      ),
      body: Container(
          padding:  EdgeInsets.only(left: 15,top: 20, right: 15),
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [

                SizedBox(height: 40),


                TextField(
                  textAlign: TextAlign.center,
                  //  obscureText: true,
                  onChanged: (value) {
                    nickname = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Slapyvardis'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                  kTextFieldDecoration.copyWith(hintText: 'El.paštas'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Slaptažodį'),
                ),
                const SizedBox(
                  height: 24.0,
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,

                          minimumSize: const Size(150, 40),
                          shape: const StadiumBorder()

                      ),
                      child: const Text("Ištrinti profilį"),
                      onPressed: (){
                        deleteAccount();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()
                            ));
                      },
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}