import 'package:flutter/material.dart';

Widget BackButton(BuildContext context){
  return IconButton(onPressed: (){
    Navigator.pop(context);
  }, icon: Icon(Icons.arrow_back));
}