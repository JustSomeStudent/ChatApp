import 'package:mix_chat_app/constants.dart';
import 'package:mix_chat_app/screens/account_screen.dart';
import 'package:mix_chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:mix_chat_app/screens/main_screen.dart';
import 'rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mix_chat_app/screens/forgot_password_screen.dart';

class SignIn extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
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
                height: 24.0,
              ),
              TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Įveskite el.paštą')),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Įveskite slaptažodį',
                  )),
              const SizedBox(
                height: 15.0,
              ),
              RoundedButton(
                  color: Colors.lightBlueAccent,
                  title: 'Prisijungti',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }),

              RoundedButton(
                  color: Colors.lightBlueAccent,
                  title: 'Pamiršau slaptažodį',
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()));},
                  ),

              RoundedButton(
                  color: Colors.lightBlueAccent,
                  title: 'Eiti į savo paskyrą',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AccountScreen()));
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


/*import 'package:flutter/material.dart';
import 'package:mix_chat_app/screens/conversation_screen.dart';
import 'package:mix_chat_app/screens/forgot_password_screen.dart';
import 'package:mix_chat_app/screens/login_screen.dart';
*/
/*class ChatRoom extends StatefulWidget {
  static Route get route => MaterialPageRoute(
    builder: (context) => ChatRoom(),
  );
  const ChatRoom({Key? key}) : super(key: key);
  @override
  State<ChatRoom> createState() => _ChatRoomState();
}
class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
          appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text ('Pagrindinis langas: kontaktai'),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => SignIn()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
          floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
        },
      ),
          body: Container(
            child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 40),
                      shape: const StadiumBorder()
                  ),
                  child: const Text('Siųsti žinutę'),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPassword()
                        ));
                    },
                )
            ),
/*
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/img/kalnai.jpg"),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
 */
          )
      );
  }
}*/