import 'package:flutter/material.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
        title: Text('Choose location'),
      ),
      backgroundColor: Colors.grey[200],
      body: Text('choose location screen'),
    );
  }
}
