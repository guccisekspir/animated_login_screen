import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginEntryField(
    {
      GlobalKey key,
      bool isPass,
      TextEditingController textEditingController,
      BuildContext context,
      FocusNode focusNode}) {
  //hidden code kayıt mı login mi anlamak için
  return Container(
    key: key,
    width: 300,
    child: TextFormField(

            decoration: InputDecoration(
              labelText: isPass?"Password":"Email",
              labelStyle: TextStyle(color:Theme.of(context).primaryColor),
              suffixIcon: isPass?Icon(Icons.vpn_key,color: Theme.of(context).primaryColor,):Icon(Icons.mail_outline,color: Theme.of(context).primaryColor,),
              hoverColor: Theme.of(context).primaryColor,
              fillColor: Theme.of(context).primaryColor,
              enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)) ,
              border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor))
            ),
            style: TextStyle(color: Colors.pink),
            focusNode: focusNode,
            controller: textEditingController,
            keyboardType:
            isPass ? TextInputType.text : TextInputType.emailAddress,
            obscureText: isPass,
          ),
  );
}

Widget submitButton(
    {
      VoidCallback voidCallback,
      bool isLogin,
      double height}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: GestureDetector(
      onTap: () {
        voidCallback();
        debugPrint("validate");
      },
      child: Container(
        height: height*0.068,
        width: height*0.3,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1.0,spreadRadius:1.0,offset: Offset(1,4))
          ],
          gradient: LinearGradient(

              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            colors: [
              Colors.deepPurpleAccent,
              Colors.deepPurple.shade800
            ]
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isLogin?"Log In":"Sign Up",
              style: TextStyle(fontSize: height*0.04,color: Colors.pink),
            ),
          ),
        ),
      ),
    ),
  );
}