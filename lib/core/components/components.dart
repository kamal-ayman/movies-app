import 'package:flutter/material.dart';

void navigatorPushReplacement(context, Widget screen){
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}