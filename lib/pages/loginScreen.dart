import 'package:animated_login_screen/helpers/sizeHelper.dart';
import 'package:animated_login_screen/widgets/myEntryField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isMounted = false;

  SizeHelper _sizeHelper;

  TextEditingController _mailController;
  TextEditingController _passController;
  FocusNode _mailFocusNode;
  FocusNode _passFocusNode;

  @override
  void initState() {
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
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isMounted
        ? Scaffold(
            backgroundColor: Theme.of(context).accentColor,
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  top: _sizeHelper.height*0.02,
                  child: Container(
                    width: _sizeHelper.width*0.32,
                    height: _sizeHelper.height*0.32 ,
                    child: Image.asset("assets/logod.png"),
                  ),
                ),
                Positioned(
                  top: _sizeHelper.height*0.35,

                  child: Column(
                    children: [
                      loginEntryField(
                        isPass: false,
                        textEditingController: _mailController,
                        context: context,
                        focusNode: _mailFocusNode,
                      ),
                      SizedBox(height: 30,),
                      loginEntryField(
                        isPass: true,
                        textEditingController: _passController,
                        context: context,
                        focusNode:_passFocusNode,
                      ),
                      SizedBox(height: 30,),
                      submitButton(isLogin: true,height: _sizeHelper.height)
                    ],
                  ),),

              ],
            ),
          )
        : Container(
            color: Colors.white,
          );
  }
}
