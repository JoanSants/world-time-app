import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map urlData = {};

  @override
  Widget build(BuildContext context) {
    urlData = urlData.isNotEmpty ? urlData : ModalRoute.of(context).settings.arguments;
    String bgImage = urlData['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = urlData['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                  children: <Widget>[
                    TextButton.icon(
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context, '/location');
                          setState(() {
                            urlData = {
                              'location': result['location'],
                              'flag': result['flag'],
                              'dateTime': result['dateTime'],
                              'isDayTime': result['isDayTime']
                            };
                          });
                        },
                        icon: Icon(
                            Icons.edit_location,
                            color: Colors.white,
                        )
                        ,
                        label: Text(
                            'Edit location',
                            style: TextStyle(
                              color: Colors.white
                            ),
                        )
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            urlData['location'],
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: 2,
                              color: Colors.white
                            ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      urlData['dateTime'],
                      style: TextStyle(
                        fontSize: 66,
                        color: Colors.white
                      ),
                    )
                  ],
              ),
            ),
          )
      ),
    );
  }
}
