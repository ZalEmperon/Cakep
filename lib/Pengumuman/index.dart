import 'package:flutter/material.dart';
import 'package:cakapp/shared/navbk.dart';

class pengumuman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengumuman"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("pengumuman")
          ],
        ),
      ),
    );
  }
}