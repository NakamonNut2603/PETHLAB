// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF04999f),
      body: Column(
        children: [
          Center(
            child: (
              Padding(
                padding: EdgeInsets.only(top:100),
                child: Image(image: AssetImage('assets/logo.jpg'))
              )
            )
          ),
          Center(
            child: SizedBox(
              width: 200, // <-- Your width
              height: 50,
              child: ElevatedButton(
                  child: const Text('Get Start', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0f3b66),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                    context,
                    "/dashboard"
                  );
                  }
              )
            ) 
          )
        ],
      )
    );
  }
}