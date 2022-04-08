// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:pethlab/forum.dart';

class ForumInfo extends StatelessWidget {
  const ForumInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width*0.7;
    final forum = ModalRoute.of(context)!.settings.arguments as Forum;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF04999f),
        title: const Text('PETHLAB'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(forum.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(forum.imgURL, width: 250)
                ),
                Container (
                  padding: const EdgeInsets.all(16.0),
                  width: cWidth,
                  child: (
                    Text(forum.article, style: TextStyle(fontSize: 20))
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}