import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_final/data.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    Data data = Provider.of(context);
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .07,
          color: Colors.yellow,
          child: Text("Ads"),
        ),
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .07,
          child: Text(
            "Location",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Daily_Hourly_Tabs(),
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .10,
                  width: MediaQuery.of(context).size.width * .5,
                  color: Colors.brown,
                  alignment: Alignment.center,
                  child: Text("Daily"),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .10,
                  width: MediaQuery.of(context).size.width * .5,
                  color: Colors.indigo,
                  alignment: Alignment.center,
                  child: Text("Hourly"),
                ),
              ],
            ),
          ],
        ),
        Table(
          border: TableBorder.symmetric(),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(5),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: FlexColumnWidth(),
            4: FlexColumnWidth(),
            5: FlexColumnWidth(),
            6: FlexColumnWidth(),
          },
          children: [
            TableRow(children: [
              Text(
                "Day/Hour",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text("1",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("2",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("3",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("4",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("5",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ]),
            TableRow(children: [
              Text(
                "Temperature",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ]),
            TableRow(children: [
              Text(
                "Feels Like",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ]),
            TableRow(children: [
              Text(
                "Possibility of Precipitation",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ]),
            TableRow(children: [
              Text("Humidity",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ]),
            TableRow(children: [
              Text("Dew Point",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ]),
            TableRow(children: [
              Text("Cloud Coverage",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ]),
            TableRow(children: [
              Text("Visibility",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ]),
            TableRow(children: [
              Text("Wind Speed",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ]),
            TableRow(children: [
              Text("Wind Direction",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ]),
          ],
        ),
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .10,
              width: MediaQuery.of(context).size.width * .5,
              color: Colors.brown,
              alignment: Alignment.center,
              child: Text("Sun"),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .10,
              width: MediaQuery.of(context).size.width * .5,
              color: Colors.indigo,
              alignment: Alignment.center,
              child: Text("Moon"),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * .30,
          width: MediaQuery.of(context).size.width * .5,
          color: Colors.yellow,
          alignment: Alignment.center,
          child: Text("Sun/Moon Data"),
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .5,
            child: Column(
              children: [Text("Pressure"), Text("Temp"), Text("etc...")],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .30,
          width: MediaQuery.of(context).size.width * .5,
          color: Colors.yellow,
          alignment: Alignment.center,
          child: Text("map"),
        ),
      ],
    );
  }
}
