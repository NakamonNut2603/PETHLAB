// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:pethlab/hospital.dart';

class HospitalInfo extends StatelessWidget {
  const HospitalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width*0.7;
    final hospital = ModalRoute.of(context)!.settings.arguments as Hospital;
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
                SizedBox(height: 20),
                Center(
                  child: Text(hospital.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(hospital.img, width: 250)
                ),
                Container (
                  padding: const EdgeInsets.all(5.0),
                  width: cWidth,
                  child: (
                    Text(hospital.address, style: TextStyle(fontSize: 20))
                  ),
                ),
                Container (
                  padding: const EdgeInsets.all(5.0),
                  width: cWidth,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Available: " + hospital.openTime + " - " + hospital.closeTime, style: TextStyle(fontSize: 20)),
                  )
                ),
                Container (
                  padding: const EdgeInsets.all(5.0),
                  width: cWidth,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Phonenumber: " + hospital.tel, style: TextStyle(fontSize: 20)),
                  )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}