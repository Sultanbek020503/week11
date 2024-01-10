import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main_page.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await registerUser(context);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerUser(BuildContext context) async {
    try {

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );

      print('User registered: ${userCredential.user?.email}');


      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(userCredential.user!)));
    } catch (e) {

      print('Error during registration: $e');

    }
  }}
