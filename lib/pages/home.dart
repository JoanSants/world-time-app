import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> urlData;

  @override
  Widget build(BuildContext context) {
    urlData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: Icon(Icons.edit_location),
                      label: Text('Edit location')
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          urlData['location'],
                          style: TextStyle(
                            fontSize: 28,
                            letterSpacing: 2
                          ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    urlData['dateTime'],
                    style: TextStyle(
                      fontSize: 66
                    ),
                  )
                ],
            ),
          )
      ),
    );
  }
}
