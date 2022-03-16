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
          title: const Text ('Testing text!'),
        ),

        backgroundColor: Colors.blueGrey,


        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {

          },
        ),
        body: Container(
          child: Column(
            children: const [
              Text ('Text on the screen',
                style: TextStyle(fontSize: 40),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.perm_identity),
                  labelText: 'Vartotojo vardas',

                ),
              ),
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
