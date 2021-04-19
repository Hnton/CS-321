import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_final/data.dart';
import 'package:weather_app_final/layout.dart';
import 'package:weather_app_final/weatherDrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: ChangeNotifierProvider(
          create: (context) => Data(context),
          child: Scaffold(
            backgroundColor: Colors.lightBlue,
            drawer: WeatherDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: Text('Weather App'),
            ),
            body: Layout(),
          ),
        ),
      ),
    );
  }
}
