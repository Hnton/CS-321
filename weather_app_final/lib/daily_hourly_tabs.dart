import 'package:flutter/material.dart';

// ignore: camel_case_types
class Daily_Hourly_Tabs extends StatefulWidget {
  @override
  _Daily_Hourly_TabsState createState() => _Daily_Hourly_TabsState();
}

// ignore: camel_case_types
class _Daily_Hourly_TabsState extends State<Daily_Hourly_Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .10,
              width: MediaQuery.of(context).size.width * .5,
              child: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Daily'),
                    Tab(text: 'Hourly'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Colors.white,
                    child: Center(
                      child: Text('Daily'),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(
                      child: Text('Hourly'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
