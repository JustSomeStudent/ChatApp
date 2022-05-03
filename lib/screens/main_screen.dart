import 'package:flutter/material.dart';
import 'package:mix_chat_app/screens/conversation_screen.dart';
import 'package:mix_chat_app/screens/login_screen.dart';

class ChatRoom extends StatefulWidget {
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
                        MaterialPageRoute(builder: (context) => Conversation()
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
}
