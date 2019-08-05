import 'package:flutter/material.dart';
import 'package:flash_chat_flutter_app/screens/welcome_screen.dart';
import 'package:flash_chat_flutter_app/screens/login_screen.dart';
import 'package:flash_chat_flutter_app/screens/registration_screen.dart';
import 'package:flash_chat_flutter_app/screens/chat_screen.dart';

void main() => runApp(LighteningChat());

class LighteningChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.screen,
      routes: {
        WelcomeScreen.screen: (context) => WelcomeScreen(),
        LoginScreen.screen: (context) => LoginScreen(),
        RegistrationScreen.screen: (context) => RegistrationScreen(),
        ChatScreen.screen: (context) => ChatScreen(),
      },
    );
  }
}