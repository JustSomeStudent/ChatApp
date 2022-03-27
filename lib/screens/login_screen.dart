import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              const Text ('Prisijungimas',
                style: TextStyle(fontSize: 40),
              ),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.perm_identity),
                  labelText: 'Vartotojo vardas arba el. paštas',

                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.lock),
                  labelText: 'Slaptažodis',

                ),
              ),

              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white70,
                ),
                child: const Text("Pamiršau slaptažodį"),
                onPressed: (){},
              ),
              


              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    shape: const StadiumBorder()
                ),
                child: const Text("PRISIJUNGTI"),
                onPressed: (){},
              ),

              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white70,
                ),
                child: const Text("Dar neužsiregistravęs?"),
                onPressed: (){},
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 40),
                      shape: const StadiumBorder()
                  ),
                  child: const Text('REGISTRUOTIS'),
                  onPressed: (){},
              )

            ],
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/img/kalnai.jpg"),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
        ),
      ),
    );

  }
}
