import 'package:flutter/cupertino.dart';

class hourly_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'One'),
                  Tab(text: 'Two'),
                  Tab(text: 'Three'),
                  Tab(text: 'Four'),
                  Tab(text: 'Five'),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 2,
              child: TabBarView(
                children: [
                  Container(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Temperature"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Feels Like"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Humidity"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Dew Point"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Cloud Coverage"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Visibility"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Speed"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Direction"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Possibility of Precipitation"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Temperature"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Feels Like"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Humidity"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Dew Point"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Cloud Coverage"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Visibility"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Speed"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Direction"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Possibility of Precipitation"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Temperature"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Feels Like"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Humidity"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Dew Point"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Cloud Coverage"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Visibility"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Speed"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Direction"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Possibility of Precipitation"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Temperature"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Feels Like"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Humidity"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Dew Point"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Cloud Coverage"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Visibility"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Speed"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Direction"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Possibility of Precipitation"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Temperature"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Feels Like"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Humidity"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Dew Point"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Cloud Coverage"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Visibility"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Speed"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Wind Direction"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Possibility of Precipitation"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
