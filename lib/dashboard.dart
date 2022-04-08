// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:pethlab/forum.dart';
import 'package:pethlab/forumData.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width*0.85;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF04999f),
        title: const Text('PETHLAB'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/hospital');
              },
              child: Icon(
                IconData(0xeaa5, fontFamily: 'MaterialIcons'),
                size: 26.0,
              ),
            )
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
          child: SizedBox (
          width: cWidth,
          child: ListView.builder(
            itemCount: forums.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/info', arguments: forums[index]);
                },
                child: buildForumCard(forums[index]),
              );
            },
          ),
        )
      )
      
    );
  }

  Widget buildForumCard(Forum forum) {
    return Card(
      color: Color(0xFFE0E0E0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset(forum.imgURL, width: 300),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              forum.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}