import 'dart:convert' as convert;
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime
{
  bool isReady = false;
  bool isDaytime = false;
  String location;
  String time = '';
  String flagUrl;
  String url;


  Future<void> getData()async
  {
    int attempts = 0;
    const maxAttempts = 100;

    while (attempts < maxAttempts) {
      final String dateTime;
      final String offest;
      try {
        final urlHttp = Uri.https('worldtimeapi.org', '/api/timezone/$url');
        final response = await http.get(urlHttp).timeout(Duration(seconds: 10));

        if (response.statusCode == 200) {
          final json = convert.jsonDecode(response.body);

          dateTime = json['datetime'];
          offest = json['utc_offset'].substring(1,3);

          DateTime now = DateTime.parse(dateTime.toString());
          now = now.add(Duration(hours: int.parse(offest)));
          isDaytime = now.hour > 6 && now.hour < 20;
          time = DateFormat.jm().format(now);
          print('NOW:${now}');
          return;
        }
      } catch (e) {
        print('Try ${attempts + 1} error: $e');
      }
      await Future.delayed(Duration(seconds: pow(1, attempts).toInt()));
      attempts++;
    }

    throw Exception('$maxAttempts try');
  }

  WorldTime({required this.location,required this.flagUrl,required this.url,});
}

//America/Lima
//Africa/Abidjan