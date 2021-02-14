import 'package:animated_login_screen/helpers/sizeHelper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isMounted = false;

  SizeHelper _sizeHelper;

  @override
  void initState() {
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
              children: [
                Positioned(
                  top: _sizeHelper.height / 2,
                  child: Text(
                    "asldksaşdkasldasl",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          )
        : Container(
            color: Colors.white,
          );
  }
}
