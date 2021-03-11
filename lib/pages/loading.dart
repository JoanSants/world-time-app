import 'package:flutter/material.dart';
import 'package:world_time_app/services/world-time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'America/Sao_Paulo');
    await worldTime.fetchWorldTime();
    Navigator.pushNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'dateTime': worldTime.dateTime,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: CircularProgressIndicator(
            backgroundColor: Colors.white
          )
        )
      );
  }
}
