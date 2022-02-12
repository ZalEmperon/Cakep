import 'package:flutter/material.dart';
import 'package:cakapp/shared/navbk.dart';

class guru_bk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: bk(),
    );
  }
}

class bk extends StatefulWidget {
  @override
  _bkState createState() => _bkState();
}

class _bkState extends State<bk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/telkomsch2.png',
            width: 90,
            height: 90,
          ),
          centerTitle: true,
        ),
        drawer: NavBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("guru bk")
            ],
          ),
        ),
    );
  }
}