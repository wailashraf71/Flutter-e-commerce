import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAccount extends StatefulWidget {
  @override
  _AdminAccountState createState() => _AdminAccountState();
}

class _AdminAccountState extends State<AdminAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account', style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Container(),
    );
  }
}
