import 'package:flutter/material.dart';
import 'pages/Home.dart';
import 'pages/choose_location.dart';
import 'pages/Loading.dart';
import 'pages/MainProfile.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/choose_location':(context) => ChooseLocation(),
      '/main_profile':(context) => Mainprofile(),
    },
  ));
}

