import 'package:animated_login_screen/helpers/sizeHelper.dart';
import 'package:animated_login_screen/widgets/myEntryField.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  bool isMounted = false;

  SizeHelper _sizeHelper;

  TextEditingController _mailController;
  TextEditingController _passController;
  FocusNode _mailFocusNode;
  FocusNode _passFocusNode;

  Animation animation;
  AnimationController animationController;

  GlobalKey _keyMail=GlobalKey();
  GlobalKey _keyPass=GlobalKey();

  @override
  void initState() {
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    animation=CurvedAnimation(
      curve: Curves.easeIn,
      parent: animationController
    );

    _mailController=TextEditingController(text: "");
    _passController=TextEditingController(text: "");
    _mailFocusNode=FocusNode();
    _passFocusNode=FocusNode();
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      _sizeHelper = SizeHelper(fetchedContext: context);

      setState(() {
        isMounted = true;
      });
      _afterLayout();
    });

    super.initState();
  }

  _afterLayout()async{

    Future.delayed(Duration(milliseconds: 4000)).then((value) => _getPositions());


  }

  @override
  Widget build(BuildContext context) {
    return isMounted
        ? Scaffold(
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
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: _sizeHelper.width,
                    height: _sizeHelper.height,
                    child: FlareActor(
                      "assets/cloud.flr",
                      fit: BoxFit.fill,
                      animation: "paralax",


                    ),
                  ),
                  Positioned(
                    top: _sizeHelper.height*0.02+50,
                    child: AnimatedBuilder(

                      animation: animation,
                      builder: (BuildContext context,Widget child){
                        debugPrint("sdasdasdsa");

                        return Opacity(
                            opacity: 1- animation.value,
                            child: Transform.translate(offset: Offset(0,_sizeHelper.height*0.03-(animation.value*60)),child: child,));


                      },
                      child: Container(
                        width: _sizeHelper.width*0.32,
                        height: _sizeHelper.height*0.32 ,
                        child: Image.asset("assets/logod.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    top: _sizeHelper.height*0.35,

                    child: Column(
                      children: [
                        AnimatedBuilder(
                          animation:animation,
                          builder: (BuildContext context,Widget child){
                            return Opacity(
                                opacity: 1-animation.value,
                                child: Transform.translate(offset: Offset(0,0-animation.value*60),child: child,));
                          },
                          child: loginEntryField(
                            key: _keyMail,
                            isPass: false,
                            textEditingController: _mailController,
                            context: context,
                            focusNode: _mailFocusNode,
                          ),
                        ),
                        SizedBox(height: 30,),
                        AnimatedBuilder(
                          animation: animation,
                          builder: (BuildContext context,Widget child){
                            return Opacity(
                              opacity: 1-animation.value,
                              child: Transform.translate(offset: Offset(0,0-animation.value*60),child: child,),
                            );
                          },
                          child: loginEntryField(
                            key: _keyPass,
                            isPass: true,
                            textEditingController: _passController,
                            context: context,
                            focusNode:_passFocusNode,
                          ),
                        ),
                        SizedBox(height: 30,),
                        AnimatedBuilder(
                          animation: animation,
                          builder: (BuildContext context,Widget child){
                            return Opacity(
                              opacity: 1-animation.value,
                              child: Transform.translate(offset: Offset(0,0-animation.value*60),child: child,),
                            );
                          },
                          child: submitButton(isLogin: true,height: _sizeHelper.height)
                        ),

                      ],
                    ),),
                 Positioned(
                   bottom: 25,
                   child: AnimatedBuilder(
                     animation: animation,
                     builder: (BuildContext context,Widget child){
                       return Transform.translate(offset: Offset(0,0),child: child,);
                     },
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: GestureDetector(
                         onTap: (){
                           animationController.forward();
                           animationController.addListener(() {
                             debugPrint(animationController.value.toString());
                           });
                         },
                         child: Container(
                           width: _sizeHelper.width,

                           child: Text(
                             "Don't have an account? Come Join Us",
                             textAlign: TextAlign.center,
                             style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                           ),
                         ),
                       ),
                     ),
                   ),
                 )

                ],
              ),
            ),
          )
        : Container(
            color: Colors.white,
          );
  }


  _getPositions() {
    final RenderBox renderBoxRed = _keyMail.currentContext.findRenderObject();
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of Red: $positionRed ");
  }
}
