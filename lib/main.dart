import 'package:flutter/material.dart';

void main() {
  runApp ( const MyApp() );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


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
                  labelText: 'Vartotojo vardas',

                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.perm_identity),
                  labelText: 'Slaptažodis',

                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40),
                    shape: const StadiumBorder()
                ),
                  child: const Text("LOGIN"),
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
