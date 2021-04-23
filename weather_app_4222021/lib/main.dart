import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_4222021/ad_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(Provider.value(
    value: adState,
    builder: (context, child) => MaterialApp(
      title: "Weather App",
      home: Home(),
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  // Data
  String cityValue;
  City activeCity;
  List<City> cities = <City>[];
  BannerAd banner;

  // OPEN WEATHER MAP WEATHER
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var lat;
  var lon;

  // USER DECIDED
  var units = "imperial";

  // SUN AND MOON
  var sunrise;
  var sunset;
  var solarNoon;
  var solarMidnight;
  var hrOfDay;
  var hrOfDark;
  var moonPhase;
  var moonRise;
  var lunarNoon;
  var moonSet;
  var lunarMidnight;
  var nextFull;
  var nextNew;

  DateTime dt = DateTime.now();

  // HOURLY
  var day;
  var month;
  var year;
  var one;
  var dt1;
  var chartDayDouble;
  var formattedDt;
  var feels;
  var description1;
  var humidity1;
  var dewPoint;
  var cloudCoverage;
  var visibility;
  var windSpeed1;

  // DAILY
  var oneDay;
  var oneDaym;
  var dt1Day;
  var formattedDt1Day;
  var chartH1Double;
  var feels1Day;
  var description1Day;
  var humidity1Day;
  var dewPoint1Day;
  var cloudCoverage1Day;
  var visibility1Day;
  var windSpeed1Day;

  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=" +
            activeCity.name.toString() +
            "&units=" +
            units.toString() +
            "&appid=10d4b9f412ce62da69709d0472238afe");

    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
      this.lat = results['coord']['lat'];
      this.lon = results['coord']['lon'];
    });
    getDailyHourly();
    getSunMoon();
  }

  Future getDailyHourly() async {
    http.Response response1 = await http.get(
        "https://api.openweathermap.org/data/2.5/onecall?lat=" +
            this.lat.toString() +
            "&lon=" +
            this.lon.toString() +
            "&units=" +
            this.units.toString() +
            "&exclude=current,minutely,alerts&appid=10d4b9f412ce62da69709d0472238afe");
    var results1 = jsonDecode(response1.body);
    setState(() {
      /*
      Hourly
       */
      //in an hour
      this.day = DateFormat.d().format(dt);
      this.month = DateFormat.MMMM().format(dt);
      this.year = DateFormat.y().format(dt);
      this.one = results1['hourly'][3]['temp'];
      dt1 = dt.add(new Duration(hours: 1));
      chartDayDouble = double.parse(one.toString());
      formattedDt = DateFormat.Hms().format(dt1);
      this.feels = results1['hourly'][3]['feels_like'];
      this.description1 = results1['hourly'][3]['weather'][0]['description'];
      this.humidity1 = results1['hourly'][3]['humidity'];
      this.dewPoint = results1['hourly'][3]['dew_point'];
      this.cloudCoverage = results1['hourly'][3]['clouds'];
      this.visibility = results1['hourly'][3]['visibility'];
      this.windSpeed1 = results1['hourly'][3]['wind_speed'];

      /*
      Daily
       */
      //in a day
      this.oneDay = results1['daily'][1]['temp']['max'];
      this.oneDaym = results1['daily'][1]['temp']['min'];
      dt1Day = dt.add(new Duration(hours: 24));
      formattedDt1Day = DateFormat.MMMd().format(dt1Day);
      chartH1Double = double.parse(oneDay.toString());
      this.feels1Day = results1['daily'][1]['feels_like']['day'];
      this.description1Day = results1['daily'][1]['weather'][0]['description'];
      this.humidity1Day = results1['daily'][1]['humidity'];
      this.dewPoint1Day = results1['daily'][1]['dew_point'];
      this.cloudCoverage1Day = results1['daily'][1]['clouds'];
      this.visibility1Day = results1['daily'][1]['weather'][0]['main'];
      this.windSpeed1Day = results1['daily'][1]['wind_speed'];
    });
  }

  Future getSunMoon() async {
    http.Response response3 = await http.get(
        "https://api.met.no/weatherapi/sunrise/2.0/.json?lat=" +
            this.lat.toString() +
            "&lon=" +
            this.lon.toString() +
            "&date=2021-04-21&offset=-05:00");
    var results3 = jsonDecode(response3.body);
    setState(() {
      this.sunrise = results3['location']['time'][0]['sunrise']['time'];
      this.sunset = results3['location']['time'][0]['sunset']['time'];
      this.solarNoon = results3['location']['time'][0]['solarnoon']['time'];
      this.solarMidnight =
          results3['location']['time'][0]['solarmidnight']['time'];
      this.hrOfDay = "??";
      this.hrOfDark = "??";
      this.moonPhase = results3['location']['time'][0]['moonphase']['time'];
      this.moonRise = results3['location']['time'][0]['moonrise']['time'];
      this.lunarNoon = results3['location']['time'][0]['high_moon']['time'];
      this.moonSet = results3['location']['time'][0]['moonset']['time'];
      this.lunarMidnight = results3['location']['time'][0]['low_moon']['time'];
      this.nextFull = "???";
      this.nextNew = "???";
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: null,
        )..load();
      });
    });
  }

  void addCityToList(String v) {
    setState(() {
      int i = 1;
      cities.insert(
          i,
          City(
              v,
              Icon(
                Icons.location_city_rounded,
                color: Colors.white,
              )));
      i++;
    });
  }

  void addInitialCityToList() {
    setState(() {
      cities.insert(
        0,
        City(
            'Parkersburg',
            Icon(
              Icons.home_rounded,
              color: Colors.white,
            )),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
    addInitialCityToList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                "Weather App",
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter A City Name'),
              onFieldSubmitted: (value) {
                setState(() {
                  this.addCityToList(value);
                });
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Weather App"),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                if (banner == null)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .075,
                    width: MediaQuery.of(context).size.width,
                  )
                else
                  Container(
                    height: MediaQuery.of(context).size.height * .075,
                    width: MediaQuery.of(context).size.width,
                    child: AdWidget(
                      ad: banner,
                    ),
                  ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.561,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.lightBlue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          child: DropdownButton<City>(
                            hint: Text(
                              "Select City",
                              style: TextStyle(color: Colors.white),
                            ),
                            value: activeCity,
                            onChanged: (City value) {
                              setState(() {
                                activeCity = value;
                                this.getWeather();
                              });
                            },
                            items: cities.map((City city) {
                              return DropdownMenuItem<City>(
                                  value: city,
                                  child: Row(
                                    children: [
                                      city.icon,
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        city.name,
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  ));
                            }).toList(),
                          )),
                      Container(
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                child: TabBar(
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.black,
                                  tabs: [
                                    Tab(
                                      text: 'Hourly',
                                    ),
                                    Tab(text: "Daily")
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height / 2,
                                child: TabBarView(
                                  children: [
                                    Container(
                                      child: Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(1),
                                          child: ListView(
                                            children: [
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerFull),
                                                title: Text("Temperature"),
                                                trailing: Text(one != null
                                                    ? one.toString() + "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Feels Like"),
                                                trailing: Text(feels != null
                                                    ? feels.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloud),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity1 != null
                                                    ? humidity1.toString() + "%"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.water),
                                                title: Text("Dew Point"),
                                                trailing: Text(dewPoint != null
                                                    ? dewPoint.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud Coverage"),
                                                trailing: Text(cloudCoverage !=
                                                        null
                                                    ? cloudCoverage.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.glasses),
                                                title: Text("Visibility"),
                                                trailing: Text(visibility !=
                                                        null
                                                    ? visibility.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind Speed"),
                                                trailing: Text(windSpeed1 !=
                                                        null
                                                    ? windSpeed1.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.compass),
                                                title: Text("Wind Direction"),
                                                trailing: Text(temp != null
                                                    ? temp.toString() + "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .cloudSunRain),
                                                title: Text(
                                                    "Possibility of Precipitation"),
                                                trailing: Text(temp != null
                                                    ? temp.toString() + "\u00B0"
                                                    : "Loading"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(1),
                                          child: ListView(
                                            children: [
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerFull),
                                                title: Text("Temperature"),
                                                trailing: Text(temp != null
                                                    ? oneDay.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Feels Like"),
                                                trailing: Text(feels != null
                                                    ? feels1Day.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloud),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity1Day !=
                                                        null
                                                    ? humidity1Day.toString() +
                                                        "%"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.water),
                                                title: Text("Dew Point"),
                                                trailing: Text(dewPoint1Day !=
                                                        null
                                                    ? dewPoint1Day.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud Coverage"),
                                                trailing: Text(
                                                    cloudCoverage1Day != null
                                                        ? cloudCoverage1Day
                                                                .toString() +
                                                            "\u00B0"
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.glasses),
                                                title: Text("Visibility"),
                                                trailing: Text(
                                                    visibility1Day != null
                                                        ? visibility1Day
                                                                .toString() +
                                                            "\u00B0"
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind Speed"),
                                                trailing: Text(windSpeed1Day !=
                                                        null
                                                    ? windSpeed1Day.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.compass),
                                                title: Text("Wind Direction"),
                                                trailing: Text(temp != null
                                                    ? temp.toString() + "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .cloudSunRain),
                                                title: Text(
                                                    "Possibility of Precipitation"),
                                                trailing: Text(temp != null
                                                    ? temp.toString() + "\u00B0"
                                                    : "Loading"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: TabBar(
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: 'Sun'),
                        Tab(text: 'Moon'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 2,
                    child: TabBarView(
                      children: [
                        Container(
                          child: Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: ListView(
                                children: [
                                  // SUNN
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.sun),
                                    title: Text("Sunrise"),
                                    trailing: Text(sunrise != null
                                        ? sunrise.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.solidSun),
                                    title: Text("Sunset"),
                                    trailing: Text(sunset != null
                                        ? sunset.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.clock),
                                    title: Text("Solar Noon"),
                                    trailing: Text(solarNoon != null
                                        ? solarNoon.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.clock),
                                    title: Text("Solar Midnight"),
                                    trailing: Text(solarMidnight != null
                                        ? solarMidnight.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.running),
                                    title: Text("Hours of Daylight"),
                                    trailing: Text(hrOfDay != null
                                        ? hrOfDay.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.bed),
                                    title: Text("Hours of Dark"),
                                    trailing: Text(hrOfDark != null
                                        ? hrOfDark.toString()
                                        : "Loading"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: ListView(
                                children: [
                                  // MOON
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.moon),
                                    title: Text("Moon Phase"),
                                    trailing: Text(moonPhase != null
                                        ? moonPhase.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.solidMoon),
                                    title: Text("Moon Rise"),
                                    trailing: Text(moonRise != null
                                        ? moonRise.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.clock),
                                    title: Text("Lunar Noon"),
                                    trailing: Text(lunarNoon != null
                                        ? lunarNoon.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.clock),
                                    title: Text("Moon Set"),
                                    trailing: Text(moonSet != null
                                        ? moonSet.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading:
                                        FaIcon(FontAwesomeIcons.solidClock),
                                    title: Text("Lunar Midnight"),
                                    trailing: Text(lunarMidnight != null
                                        ? lunarMidnight.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading:
                                        FaIcon(FontAwesomeIcons.solidCircle),
                                    title: Text("Next Full Moon"),
                                    trailing: Text(nextFull != null
                                        ? nextFull.toString()
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.circle),
                                    title: Text("Next New Moon"),
                                    trailing: Text(nextNew != null
                                        ? nextNew.toString()
                                        : "Loading"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: TabBar(
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: 'Next 4 Hours',
                          ),
                          Tab(
                            text: 'Next 4 Days',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: [
                          Container(
                            // child: BezierChart(
                            //
                            // ),
                            child: Text("Chart 1"),
                          ),
                          Container(
                            // child: BezierChart(),
                            child: Text("Chart 2"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class City {
  City(this.name, this.icon);
  String name;
  Icon icon;
}
