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
     debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: Color(0XFFF72585),
        accentColor: Color(0XFF140439),
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginSignScreens()
    );
  }
}

class LoginSignScreens extends StatefulWidget {
  @override
  _LoginSignScreensState createState() => _LoginSignScreensState();
}

class _LoginSignScreensState extends State<LoginSignScreens> {
  bool isLogin=true;
  Widget Loginn;
  Widget Sign;
  Widget myLoginScreen;

  @override
  void initState() {
    // TODO: implement initState
    Loginn= LoginScreen(isLogin: true,switchPage:()=> setState(() {
      debugPrint("Geldi");

      setState(() {
        isLogin=false;
        myLoginScreen=Sign;
      });
    }),);
    if(isLogin)myLoginScreen=Loginn;
    Sign= LoginScreen(isLogin: false,switchPage:()=> setState(() {
      myLoginScreen=Loginn;
      isLogin=true;
    }),);
    super.initState();
  }




  @override
  Widget build(BuildContext context) {


    return  Scaffold(

      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).accentColor,
                    Colors.deepPurple
                  ]
              )
          ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          child: isLogin?Loginn:Sign,
        ),
      ),
    );
  }

}



