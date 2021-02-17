import 'package:animated_login_screen/blocs/pageSwitchBloc/page_switcher/page_switcher_bloc.dart';
import 'package:animated_login_screen/helpers/sizeHelper.dart';
import 'package:animated_login_screen/pages/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
          create: (context)=>PageSwitcherBloc(),
          child: LoginSignScreens())
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

  PageSwitcherBloc pageSwitcherBloc;

  @override
  void initState() {
    pageSwitcherBloc= BlocProvider.of<PageSwitcherBloc>(context);
    // TODO: implement initState
    Loginn= LoginScreen(isLogin: true,pageSwitcherBloc: pageSwitcherBloc,);
    if(isLogin)myLoginScreen=Loginn;
    Sign= LoginScreen(isLogin: false,pageSwitcherBloc: pageSwitcherBloc,);
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
        child: BlocListener(
          cubit: pageSwitcherBloc,
          listener: (BuildContext context,PageSwitcherState state){
            if(state is PageLoginState){
              debugPrint("Login");
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Loginn));

              }
            if(state is PageSignState){

              debugPrint("Sign Listener");
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen(isLogin: false,pageSwitcherBloc: pageSwitcherBloc,)));
              }
          },
          child: myLoginScreen,
        ),
      ),
    );
  }

}



