import 'package:mix_chat_app/screens/login_screen.dart';
import 'package:mix_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {



  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                title: 'Prisijungti',
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, SignIn.id);
                }),
            RoundedButton(
                color: Colors.blueAccent,
                title: 'Registruotis',
                onPressed: () {
                  Navigator.pushNamed(context, Registration.id);
                })
          ],
        ),
      ),
    );
  }
}