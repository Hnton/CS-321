import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_final/data.dart';

class WeatherDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data data = Provider.of(context);
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("data.weather.name")],
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
