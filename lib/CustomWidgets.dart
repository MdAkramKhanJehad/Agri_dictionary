import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String title){
  return AppBar(
    backgroundColor: Colors.teal.shade300,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontFamily: "OdibeeSans",
        fontWeight: FontWeight.w100,
        fontSize: 32
      ),
    ),
  );
}