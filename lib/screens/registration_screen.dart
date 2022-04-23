/*import 'package:cloud_functions/cloud_functions.dart';*/
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
/*import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';*/


  class Registration extends StatefulWidget {
    static Route get route =>
        MaterialPageRoute(
          builder: (context) => const Registration(),
        );

    const Registration({Key? key}) : super(key: key);

    @override
    State<Registration> createState() => _RegistrationState();
  }

  class _RegistrationState extends State<Registration> {
    final auth = firebase.FirebaseAuth.instance;
    final functions = FirebaseAuth.instance;

    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _surnameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    final _emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    bool _loading = false;

    /*get logger => null;*/

    Future<void> _registration() async {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _loading = true;
        });
        try {
          // Authenticate with Firebase
          final creds =
          await firebase.FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
        }
        on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
        var creds;
        final user = creds.user;
        if (user == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User is empty')),
          );
          return;
        }

        // Set Firebase display name and profile picture
        List<Future<void>> futures = [
          creds.user!.updateDisplayName(_nameController.text),
          if (_surnameController.text.isNotEmpty)
            creds.user!.updatePhotoURL(_surnameController.text)
        ];

        await Future.wait(futures);

        // Create Stream user and get token using Firebase Functions
        /*final callable = functions.httpsCallable('createStreamUserAndGetToken');
  final results = await callable();*/

        // Connect user to Stream and set user data
        /*final client = StreamChatCore.of(context).client;
  await client.connectUser(
  User(
  id: creds.user!.uid,
  name: _nameController.text,
  image: _profilePictureController.text,
  ),
  results.data,
  );*/

        // Navigate to home screen
        /*await Navigator.of(context).pushReplacement(ChatRoom().route);
  } on firebase.FirebaseAuthException catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text(e.message ?? 'Auth error')),
  );*
  } catch (e, st) {
  logger.e('Sign up error', e, st);
  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('An error occured')),
  );
  }
  setState(() {
  _loading = false;
  });
  }*/


        String? _nameInputValidator(String? value) {
          if (value == null || value.isEmpty) {
            return 'Cannot be empty';
          }
          return null;
        }

        String? _surnameInputValidator(String? value) {
          if (value == null || value.isEmpty) {
            return 'Cannot be empty';
          }
          return null;
        }

        String? _emailInputValidator(String? value) {
          if (value == null || value.isEmpty) {
            return 'Cannot be empty';
          }
          if (!_emailRegex.hasMatch(value)) {
            return 'Not a valid email';
          }
          return null;
        }

        String? _passwordInputValidator(String? value) {
          if (value == null || value.isEmpty) {
            return 'Cannot be empty';
          }
          if (value.length <= 6) {
            return 'Password needs to be longer than 6 characters';
          }
          return null;
        }

        @override
        void dispose() {
          _emailController.dispose();
          _passwordController.dispose();
          _surnameController.dispose();
          _nameController.dispose();
          super.dispose();
        }
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('abc'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: (_loading)
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 24),
                  child: Text(
                    'Užsiregistruoti',
                    style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameController,
                    validator: _nameInputValidator,
                    decoration: const InputDecoration(hintText: 'Vardas'),
                    keyboardType: TextInputType.name,
                    autofillHints: const [
                      AutofillHints.name,
                      AutofillHints.username
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _surnameController,
                    validator: _nameInputValidator,
                    decoration: const InputDecoration(hintText: 'Pavardė'),
                    keyboardType: TextInputType.name,
                    autofillHints: const [
                      AutofillHints.name,
                      AutofillHints.username
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: _emailInputValidator,
                    decoration: const InputDecoration(hintText: 'El. paštas'),
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: _passwordInputValidator,
                    decoration: const InputDecoration(
                      hintText: 'Slaptažodis',
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _registration,
                    child: const Text('Sukurti paskyrą'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

    String? _nameInputValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Negali būti tuščia!';
      }
      return null;
    }

    String? _emailInputValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Negali būti tuščia!!';
      }
      if (!_emailRegex.hasMatch(value)) {
        return 'Netinkamas el.paštas';
      }
      return null;
    }

    String? _passwordInputValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Negali būti tuščia!';
      }
      if (value.length <= 6) {
        return 'Slaptažodis turi būti bent iš 6 simbolių';
      }
      return null;
    }
}

