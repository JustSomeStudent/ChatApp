import 'package:flutter/material.dart';
import 'package:mix_chat_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/12/19/21/36/woman-1919143_960_720.jpg'
                          )
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                          width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white
                          ),
                          color: Colors.blue
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),

              TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    icon: Icon(Icons.perm_identity),
                    labelText: 'Vardas',
                ),
              ),

              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  icon: Icon(Icons.perm_identity),
                  labelText: 'Pavardė',
                ),
              ),

              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    icon: Icon(Icons.person),
                    labelText: 'Slapyvardis'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Šis laukas yra privalomas';
                  }
                  if (value.trim().length < 4) {
                    return 'Slapyvardį turi sudaryti min 4 simboliai';
                  }
                  // Return null if the entered username is valid
                  return null;
                },
                onChanged: (value) => isObscurePassword
              ),

              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    icon: Icon(Icons.mail),
                    labelText: 'El. paštas'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El. paštą būtina nurodyti!';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Įvesk galiojantį el. pašto adresą";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    icon: Icon(Icons.lock),
                    labelText: 'Slaptažodis'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Šis laukas yra privalomas';
                  }
                  if (value.trim().length < 8) {
                    return 'Slaptažodį turi sudaryti min 8 simboliai';
                  }
                  if (!RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return 'Slaptažodį turi sudaryti bent viena didžioji raidė, simbolis';
                  }
                  // Return null if the entered password is valid
                  return null;
                },
                onChanged: (value) => isObscurePassword
              ),

              const SizedBox(height: 15),
             
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       minimumSize: const Size(150, 40),
                       shape: const StadiumBorder()
                   ),
                   child: const Text("Redaguoti profilį"),
                   onPressed: (){},
                 ),

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
