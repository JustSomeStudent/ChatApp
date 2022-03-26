import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _SignInState();
}

class _SignInState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (

        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text ('MixChat v0.1'),
        ),

        backgroundColor: Colors.blueGrey,

        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text ('Vartotojo anketa',
                style: TextStyle(fontSize: 30),
              ),

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
                  labelText: 'El. paštas',
                  hintText: 'Įveskite savo el. paštą'

                ),
              ),

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
                  hintText: 'Įveskite savo vardą'
              ),
              ),

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
                  hintText: 'Įveskite savo pavardę',

                ),
              ),

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
                    labelText: 'Slapyvardis',
                    hintText: 'Įveskite slapyvardį'
                ),
              ),

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
                  labelText: 'Slaptažodis',
                  hintText: 'Įveskite slaptažodį'
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    shape: const StadiumBorder()
                ),
                child: const Text("Registruotis"),
                onPressed: (){},
              )
            ],
          ),
          decoration: const BoxDecoration(
            color: Colors.white60
            ),
          ),
        ),

    );

  }
}
