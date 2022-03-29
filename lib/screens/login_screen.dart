import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  final _formKey = GlobalKey<FormState>();


  String _password = '';


  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Puiku!');
      debugPrint(_password);

    }
  }


  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }

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
                  onChanged: (value) => _password = value,
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
