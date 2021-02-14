import 'package:animated_login_screen/helpers/sizeHelper.dart';
import 'package:animated_login_screen/pages/loginScreen.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: Color(0XFFF72585),
        accentColor: Color(0XFF140439),
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}


