import 'package:flutter/material.dart';
import 'package:flash_chat_flutter_app/components/rounded_button.dart';
import 'package:flash_chat_flutter_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter_app/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String screen = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance; // firebase auth instance
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your Email')
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your Password')
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Register',
                  color: Colors.lightBlueAccent,
                  onPressed: () async {
                    // start spinner
                    setState(() {
                      showSpinner = true;
                    });

                    // navigate to the chat home screen
                    // register user
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      // check if user is valid
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.screen);
                      }

                      // stop the spinner once user is logged in
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (error) {
                      print('Error: $error');
                    }
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}