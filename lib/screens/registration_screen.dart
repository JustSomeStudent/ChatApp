import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';


  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Puiku!');
      debugPrint(_userEmail);
      debugPrint(_userName);
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
      debugShowCheckedModeBanner: false,
      home: Scaffold (

        backgroundColor: Colors.transparent,

        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text ('MixChat v0.1'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text ('Vartotojo anketa',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
              const SizedBox(height: 25),
              TextButton(
                  onPressed: _saveForm, child: const Text('Neteisingai nurodytas el. paštas')),
              const SizedBox(height: 25),
              _isValid ? const Text('El. paštas tinkamas!') : Container(),



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
                onChanged: (value) => _userName = value,
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



              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    shape: const StadiumBorder()
                ),

                child: const Text("Registruotis"),
                onPressed: (){},
              ),
            ],
          ),
          decoration: const BoxDecoration(
              color: Colors.white,

          ),
        ),
      ),

    );
  }
}
