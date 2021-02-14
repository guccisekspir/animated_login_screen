import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginEntryField(
    {
      bool isPass,
      TextEditingController textEditingController,
      BuildContext context,
      FocusNode focusNode}) {
  //hidden code kayıt mı login mi anlamak için
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child:Container(
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
              focusNode: focusNode,
              controller: textEditingController,
              keyboardType:
              isPass ? TextInputType.text : TextInputType.emailAddress,
              obscureText: isPass,
            ),
    ),


  );
}