import 'package:mix_chat_app/constants.dart';
import 'package:mix_chat_app/screens/account_screen.dart';
import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mix_chat_app/screens/main_screen.dart';

class Registration extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String nickname = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MixChat'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()));},
        ),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('lib/img/chat.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                //  obscureText: true,
                onChanged: (value) {
                  nickname = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Įveskite slapyvardį'),
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
                kTextFieldDecoration.copyWith(hintText: 'Įveskite el.paštą'),
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
                    hintText: 'Įveskite slaptažodį'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Colors.blueAccent,
                  title: 'Registruotis',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser =
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
