// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pethlab/Dashboard.dart';
import 'package:pethlab/forumInfo.dart';
import 'package:pethlab/hospitalInfo.dart';
import 'package:pethlab/hospitalLocation.dart';
import 'package:pethlab/hospitalRoute.dart';
import 'package:pethlab/landingPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Google Maps Demo',
      initialRoute: '/',
      routes: {
        "/": (context) => LandingPage(),
        "/dashboard": (context) => Dashboard(),
        "/info": (context) => ForumInfo(),
        "/hospital": (context) => HospitalLocation(),
        "/direction": (context) => HospitalRoute(),
        "/hospitalinfo": (context) => HospitalInfo(),
      },
    );
  }
}