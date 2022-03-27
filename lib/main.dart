import 'package:flutter/material.dart';
import 'package:mix_chat_app/screens/login_screen.dart';
import 'package:mix_chat_app/screens/registration_screen.dart';


void main() {
  runApp ( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignIn(),
    );

  }

}
