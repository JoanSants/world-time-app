import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String dateTime;
  String location;
  String flag;
  String url;
  
  WorldTime({ this.dateTime, this.location, this.flag, this.url });

  Future<void> fetchWorldTime () async {
    try {
      http.Response response = await http.get(Uri.https('worldtimeapi.org', '/api/timezone/$url'));
      Map<String, dynamic> json = jsonDecode(response.body);

      int offset = int.parse((json['utc_offset'] as String).substring(0,3));
      DateTime now = DateTime.parse(json['datetime']);

      now = offset > 0 ? now.add(Duration(hours: offset)) : now.subtract(Duration(hours: offset.abs()));

      dateTime = DateFormat.jm().format(now);
    } catch (e) {
      dateTime = 'Could not fetch the time';
    }
  }
}