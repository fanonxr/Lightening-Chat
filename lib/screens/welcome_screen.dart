import 'package:flutter/material.dart';
import 'package:flash_chat_flutter_app/screens/registration_screen.dart';
import 'package:flash_chat_flutter_app/screens/login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screen = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// mixin singleTicker is acting as a provider
class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin { // WelcomeScreen state can act as a ticker for an animation controller
  // building an animation controller
  AnimationController controller;
  // ability to use curves
  Animation animation;

  // override the init state of when the screen gets created
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 100
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);

    // getting the animation to start
    controller.forward();

    // adding a listener
    controller.addListener((){
      setState(() {});
    });
  }

  // dispose of animations so don't take up resources on a new screen
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                ScaleAnimatedTextKit(
                  onTap: (){},
                  text: ["Thunder Chat"],
                  textStyle: TextStyle(
                    fontSize: 47.0,
                    fontFamily: 'Sans Serif'
                  ),

                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Login',
              color: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.screen);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.screen);
              },
            ),
          ],
        ),
      ),
    );
  }
}