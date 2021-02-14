import 'package:flutter/material.dart';

Widget loginEntryField(
    {String title,
      bool isPass,
      TextEditingController textEditingController,
      BuildContext context,
      FocusNode focusNode}) {
  //hidden code kayıt mı login mi anlamak için
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            focusNode: focusNode,
            controller: textEditingController,
            keyboardType:
            isPass ? TextInputType.text : TextInputType.emailAddress,
            obscureText: isPass,
          )
        ],
      ),
    ),
  );
}