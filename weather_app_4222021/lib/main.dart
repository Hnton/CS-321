import 'dart:convert';
import 'dart:ui';

import 'package:bezier_chart/bezier_chart.dart';
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

  var moonPhase;
  var moonRise;
  var lunarNoon;
  var moonSet;
  var lunarMidnight;
  var nextFull;
  var nextNew;
  var totalDaylight;
  var totalNight;
  var sunsetHours;
  var sunriseHours;
  DateTime dt = DateTime.now();

  // HOURLY 1
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
  var windDeg1;
  var windDirection1;
  double chart1Double = 0;

  // Hourly 2
  var two;
  var dt2;
  var formattedDt2;
  var feels2;
  var description2;
  var humidity2;
  var dewPoint2;
  var cloudCoverage2;
  var visibility2;
  var windSpeed2;
  var windDeg2;
  var windDirection2;
  double chart2Double = 0;

  // Hourly 3
  var three;
  var dt3;
  var formattedDt3;
  var feels3;
  var description3;
  var humidity3;
  var dewPoint3;
  var cloudCoverage3;
  var visibility3;
  var windSpeed3;
  var windDeg3;
  var windDirection3;
  double chart3Double = 0;

  // Hourly 4
  var four;
  var dt4;
  var formattedDt4;
  var feels4;
  var description4;
  var humidity4;
  var dewPoint4;
  var cloudCoverage4;
  var visibility4;
  var windSpeed4;
  var windDeg4;
  var windDirection4;
  double chart4Double = 0;

  // Hourly 5
  var five;
  var dt5;
  var formattedDt5;
  var feels5;
  var description5;
  var humidity5;
  var dewPoint5;
  var cloudCoverage5;
  var visibility5;
  var windSpeed5;
  var windDeg5;
  var windDirection5;
  double chart5Double = 0;

  // DAILY 1
  var oneDay;
  var oneDaym;
  var dt1Day;
  var formattedDt1Day;
  var feels1Day;
  var description1Day;
  var humidity1Day;
  var dewPoint1Day;
  var cloudCoverage1Day;
  var visibility1Day;
  var windSpeed1Day;
  var windDeg1Day;
  var windDirection1Day;
  double chartD1Double = 0;

  // DAILY 2
  var twoDay;
  var twoDaym;
  var dt2Day;
  var formattedDt2Day;
  var feels2Day;
  var description2Day;
  var humidity2Day;
  var dewPoint2Day;
  var cloudCoverage2Day;
  var visibility2Day;
  var windSpeed2Day;
  var windDeg2Day;
  var windDirection2Day;
  double chartD2Double = 0;

  // DAILY 3
  var threeDay;
  var threeDaym;
  var dt3Day;
  var formattedDt3Day;
  var feels3Day;
  var description3Day;
  var humidity3Day;
  var dewPoint3Day;
  var cloudCoverage3Day;
  var visibility3Day;
  var windSpeed3Day;
  var windDeg3Day;
  var windDirection3Day;
  double chartD3Double = 0;

  // DAILY 4
  var fourDay;
  var fourDaym;
  var dt4Day;
  var formattedDt4Day;
  var feels4Day;
  var description4Day;
  var humidity4Day;
  var dewPoint4Day;
  var cloudCoverage4Day;
  var visibility4Day;
  var windSpeed4Day;
  var windDeg4Day;
  var windDirection4Day;
  double chartD4Double = 0;

  // DAILY 5
  var fiveDay;
  var fiveDaym;
  var dt5Day;
  var formattedDt5Day;
  var feels5Day;
  var description5Day;
  var humidity5Day;
  var dewPoint5Day;
  var cloudCoverage5Day;
  var visibility5Day;
  var windSpeed5Day;
  var windDeg5Day;
  var windDirection5Day;
  double chartD5Double = 0;

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
      formattedDt = DateFormat.Hms().format(dt1);
      this.feels = results1['hourly'][3]['feels_like'];
      this.description1 = results1['hourly'][3]['weather'][0]['description'];
      this.humidity1 = results1['hourly'][3]['humidity'];
      this.dewPoint = results1['hourly'][3]['dew_point'];
      this.cloudCoverage = results1['hourly'][3]['clouds'];
      this.visibility = results1['hourly'][3]['visibility'];
      this.windSpeed1 = results1['hourly'][3]['wind_speed'];
      this.windDeg1 = results1['hourly'][3]['wind_deg'];
      this.windDirection1 = getWindDirection(this.windDeg1);
      this.chart1Double = one;

      /*
      Hourly
       */
      //in 2 hours
      this.two = results1['hourly'][4]['temp'];
      dt2 = dt.add(new Duration(hours: 2));
      formattedDt2 = DateFormat.Hms().format(dt2);
      this.feels2 = results1['hourly'][4]['feels_like'];
      this.description2 = results1['hourly'][4]['weather'][0]['description'];
      this.humidity2 = results1['hourly'][4]['humidity'];
      this.dewPoint2 = results1['hourly'][4]['dew_point'];
      this.cloudCoverage2 = results1['hourly'][4]['clouds'];
      this.visibility2 = results1['hourly'][4]['visibility'];
      this.windSpeed2 = results1['hourly'][4]['wind_speed'];
      this.windDeg2 = results1['hourly'][4]['wind_deg'];
      this.windDirection2 = getWindDirection(this.windDeg2);
      this.chart2Double = two;

      /*
      Hourly
       */
      //in 3 hours
      this.three = results1['hourly'][5]['temp'];
      dt3 = dt.add(new Duration(hours: 3));
      formattedDt3 = DateFormat.Hms().format(dt3);
      this.feels3 = results1['hourly'][5]['feels_like'];
      this.description3 = results1['hourly'][5]['weather'][0]['description'];
      this.humidity3 = results1['hourly'][5]['humidity'];
      this.dewPoint3 = results1['hourly'][5]['dew_point'];
      this.cloudCoverage3 = results1['hourly'][5]['clouds'];
      this.visibility3 = results1['hourly'][5]['visibility'];
      this.windSpeed3 = results1['hourly'][5]['wind_speed'];
      this.windDeg3 = results1['hourly'][5]['wind_deg'];
      this.windDirection3 = getWindDirection(this.windDeg3);
      this.chart3Double = three;

      /*
      Hourly
       */
      //in 4 hours
      this.four = results1['hourly'][6]['temp'];
      dt4 = dt.add(new Duration(hours: 4));
      formattedDt4 = DateFormat.Hms().format(dt4);
      this.feels4 = results1['hourly'][6]['feels_like'];
      this.description4 = results1['hourly'][6]['weather'][0]['description'];
      this.humidity4 = results1['hourly'][6]['humidity'];
      this.dewPoint4 = results1['hourly'][6]['dew_point'];
      this.cloudCoverage4 = results1['hourly'][6]['clouds'];
      this.visibility4 = results1['hourly'][6]['visibility'];
      this.windSpeed4 = results1['hourly'][6]['wind_speed'];
      this.windDeg4 = results1['hourly'][6]['wind_deg'];
      this.windDirection4 = getWindDirection(this.windDeg4);
      this.chart4Double = four;

      /*
      Hourly
       */
      //in 5 hours
      this.five = results1['hourly'][7]['temp'];
      dt5 = dt.add(new Duration(hours: 5));
      formattedDt5 = DateFormat.Hms().format(dt5);
      this.feels5 = results1['hourly'][7]['feels_like'];
      this.description5 = results1['hourly'][7]['weather'][0]['description'];
      this.humidity5 = results1['hourly'][7]['humidity'];
      this.dewPoint5 = results1['hourly'][7]['dew_point'];
      this.cloudCoverage5 = results1['hourly'][7]['clouds'];
      this.visibility5 = results1['hourly'][7]['visibility'];
      this.windSpeed5 = results1['hourly'][7]['wind_speed'];
      this.windDeg5 = results1['hourly'][7]['wind_deg'];
      this.windDirection5 = getWindDirection(this.windDeg5);
      this.chart5Double = five;

      /*
      Daily
       */
      //in a day
      this.oneDay = results1['daily'][1]['temp']['max'];
      this.oneDaym = results1['daily'][1]['temp']['min'];
      dt1Day = dt.add(new Duration(hours: 24));
      formattedDt1Day = DateFormat.MMMd().format(dt1Day);
      this.feels1Day = results1['daily'][1]['feels_like']['day'];
      this.description1Day = results1['daily'][1]['weather'][0]['description'];
      this.humidity1Day = results1['daily'][1]['humidity'];
      this.dewPoint1Day = results1['daily'][1]['dew_point'];
      this.cloudCoverage1Day = results1['daily'][1]['clouds'];
      this.visibility1Day = results1['daily'][1]['weather'][0]['main'];
      this.windSpeed1Day = results1['daily'][1]['wind_speed'];
      this.windDeg1Day = results1['daily'][1]['wind_deg'];
      this.windDirection1Day = getWindDirection(this.windDeg1Day);
      chartD1Double = oneDay;

      /*
      Daily
       */
      //in 2 days
      this.twoDay = results1['daily'][2]['temp']['max'];
      this.twoDaym = results1['daily'][2]['temp']['min'];
      dt2Day = dt.add(new Duration(hours: 48));
      formattedDt2Day = DateFormat.MMMd().format(dt2Day);
      this.feels2Day = results1['daily'][2]['feels_like']['day'];
      this.description2Day = results1['daily'][2]['weather'][0]['description'];
      this.humidity2Day = results1['daily'][2]['humidity'];
      this.dewPoint2Day = results1['daily'][2]['dew_point'];
      this.cloudCoverage2Day = results1['daily'][2]['clouds'];
      this.visibility2Day = results1['daily'][2]['weather'][0]['main'];
      this.windSpeed2Day = results1['daily'][2]['wind_speed'];
      this.windDeg2Day = results1['daily'][2]['wind_deg'];
      this.windDirection2Day = getWindDirection(this.windDeg2Day);
      chartD2Double = twoDay;

      /*
      Daily
       */
      //in 3 days
      this.threeDay = results1['daily'][3]['temp']['max'];
      this.threeDaym = results1['daily'][3]['temp']['min'];
      dt3Day = dt.add(new Duration(hours: 72));
      formattedDt3Day = DateFormat.MMMd().format(dt3Day);
      this.feels3Day = results1['daily'][3]['feels_like']['day'];
      this.description3Day = results1['daily'][3]['weather'][0]['description'];
      this.humidity3Day = results1['daily'][3]['humidity'];
      this.dewPoint3Day = results1['daily'][3]['dew_point'];
      this.cloudCoverage3Day = results1['daily'][3]['clouds'];
      this.visibility3Day = results1['daily'][3]['weather'][0]['main'];
      this.windSpeed3Day = results1['daily'][3]['wind_speed'];
      this.windDeg3Day = results1['daily'][3]['wind_deg'];
      this.windDirection3Day = getWindDirection(this.windDeg3Day);
      chartD3Double = threeDay;

      /*
      Daily
       */
      //in 4 days
      this.fourDay = results1['daily'][4]['temp']['max'];
      this.fourDaym = results1['daily'][4]['temp']['min'];
      dt4Day = dt.add(new Duration(hours: 96));
      formattedDt4Day = DateFormat.MMMd().format(dt3Day);
      this.feels4Day = results1['daily'][4]['feels_like']['day'];
      this.description4Day = results1['daily'][4]['weather'][0]['description'];
      this.humidity4Day = results1['daily'][4]['humidity'];
      this.dewPoint4Day = results1['daily'][4]['dew_point'];
      this.cloudCoverage4Day = results1['daily'][4]['clouds'];
      this.visibility4Day = results1['daily'][4]['weather'][0]['main'];
      this.windSpeed4Day = results1['daily'][4]['wind_speed'];
      this.windDeg4Day = results1['daily'][4]['wind_deg'];
      this.windDirection4Day = getWindDirection(this.windDeg4Day);
      chartD4Double = fourDay;

      /*
      Daily
       */
      //in 5 days
      this.fiveDay = results1['daily'][5]['temp']['max'];
      this.fiveDaym = results1['daily'][5]['temp']['min'];
      dt5Day = dt.add(new Duration(hours: 120));
      formattedDt5Day = DateFormat.MMMd().format(dt5Day);
      this.feels5Day = results1['daily'][5]['feels_like']['day'];
      this.description5Day = results1['daily'][5]['weather'][0]['description'];
      this.humidity5Day = results1['daily'][5]['humidity'];
      this.dewPoint5Day = results1['daily'][5]['dew_point'];
      this.cloudCoverage5Day = results1['daily'][5]['clouds'];
      this.visibility5Day = results1['daily'][5]['weather'][0]['main'];
      this.windSpeed5Day = results1['daily'][5]['wind_speed'];
      this.windDeg5Day = results1['daily'][5]['wind_deg'];
      this.windDirection5Day = getWindDirection(this.windDeg5Day);
      chartD5Double = fiveDay;
    });
  }

  String getWindDirection(var deg) {
    if (deg > 337.5) return "Northerly";
    if (deg > 292.5) return "North Westerly";
    if (deg > 247.5) return "Westerly";
    if (deg > 202.5) return "South Westerly";
    if (deg > 157.5) return "Southerly";
    if (deg > 122.5) return "South Easterly";
    if (deg > 67.5) return "Easterly";
    if (deg > 22.5) return "North Easterly";
    return "Northerly";
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
      this.sunrise = formatDateWithAmPm(
          results3['location']['time'][0]['sunrise']['time']);
      this.sunriseHours = results3['location']['time'][0]['sunrise']['time'];
      this.sunset =
          formatDateWithAmPm(results3['location']['time'][0]['sunset']['time']);
      this.sunsetHours = results3['location']['time'][0]['sunset']['time'];
      this.solarNoon = formatDateWithAmPm(
          results3['location']['time'][0]['solarnoon']['time']);
      this.solarMidnight = formatDateWithAmPm(
          results3['location']['time'][0]['solarmidnight']['time']);

      this.moonPhase = formatDateWithAmPm(
          results3['location']['time'][0]['moonphase']['time']);
      this.moonRise = formatDateWithAmPm(
          results3['location']['time'][0]['moonrise']['time']);
      this.lunarNoon = formatDateWithAmPm(
          results3['location']['time'][0]['high_moon']['time']);
      this.moonSet = formatDateWithAmPm(
          results3['location']['time'][0]['moonset']['time']);
      this.lunarMidnight = formatDateWithAmPm(
          results3['location']['time'][0]['low_moon']['time']);
      this.nextFull = "???";
      this.nextNew = "???";

      this.totalDaylight = formatDayLight(sunriseHours, sunsetHours);
      this.totalNight = formatDayDark(sunriseHours, sunsetHours);
    });
  }

  String formatDayLight(var rise, var set) {
    DateTime dateTimeRise = DateTime.parse(rise).toLocal();
    DateTime dateTimeSet = DateTime.parse(set).toLocal();
    int hourRise = dateTimeRise.hour;
    int hourSet = dateTimeSet.hour;

    var total = (hourSet - hourRise);
    return total.toString();
  }

  String formatDayDark(var rise, var set) {
    DateTime dateTimeRise = DateTime.parse(rise).toLocal();
    DateTime dateTimeSet = DateTime.parse(set).toLocal();
    int hourRise = dateTimeRise.hour;
    int hourSet = dateTimeSet.hour;

    var total = 24 - (hourSet - hourRise);
    return total.toString();
  }

  String formatDateWithAmPm(String t) {
    DateTime dateTime = DateTime.parse(t);
    var dateLocal = dateTime.toLocal();
    String amPm = 'AM';
    if (dateLocal.hour >= 12) {
      amPm = 'PM';
    }
    String hour = dateLocal.hour.toString();
    if (dateLocal.hour > 12) {
      hour = (dateLocal.hour - 12).toString();
    }

    String minute = dateLocal.minute.toString();
    if (dateLocal.minute < 10) {
      minute = '0${dateLocal.minute}';
    }

    return '$hour:$minute$amPm';
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
                                    //HOURLY
                                    Container(
                                      child: DefaultTabController(
                                        length: 5,
                                        initialIndex: 0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              height: 40,
                                              child: TabBar(
                                                labelColor: Colors.blue,
                                                unselectedLabelColor:
                                                    Colors.black,
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2.25,
                                              child: TabBarView(
                                                children: [
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //Hourly ONE
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(one !=
                                                                  null
                                                              ? one.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(feels !=
                                                                  null
                                                              ? feels.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity1 != null
                                                                  ? humidity1
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint != null
                                                                  ? dewPoint
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage !=
                                                                      null
                                                                  ? cloudCoverage
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Visibility"),
                                                          trailing: Text(
                                                              visibility != null
                                                                  ? visibility
                                                                          .toString() +
                                                                      " m"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed1 != null
                                                                  ? windSpeed1
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection1 !=
                                                                      null
                                                                  ? windDirection1
                                                                          .toString() +
                                                                      ""
                                                                  : "Loading"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //Hourly TWO
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(two !=
                                                                  null
                                                              ? two.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(feels2 !=
                                                                  null
                                                              ? feels2.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity2 != null
                                                                  ? humidity2
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint2 != null
                                                                  ? dewPoint2
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage2 !=
                                                                      null
                                                                  ? cloudCoverage2
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Visibility"),
                                                          trailing: Text(
                                                              visibility2 !=
                                                                      null
                                                                  ? visibility2
                                                                          .toString() +
                                                                      " m"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed2 != null
                                                                  ? windSpeed2
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection2 !=
                                                                      null
                                                                  ? windDirection2
                                                                          .toString() +
                                                                      ""
                                                                  : "Loading"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //Hourly THREE
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(three !=
                                                                  null
                                                              ? three.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(feels3 !=
                                                                  null
                                                              ? feels3.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity3 != null
                                                                  ? humidity3
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint3 != null
                                                                  ? dewPoint3
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage3 !=
                                                                      null
                                                                  ? cloudCoverage3
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Visibility"),
                                                          trailing: Text(
                                                              visibility3 !=
                                                                      null
                                                                  ? visibility3
                                                                          .toString() +
                                                                      " m"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed3 != null
                                                                  ? windSpeed3
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection3 !=
                                                                      null
                                                                  ? windDirection3
                                                                          .toString() +
                                                                      ""
                                                                  : "Loading"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //Hourly FOUR
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(four !=
                                                                  null
                                                              ? four.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(feels4 !=
                                                                  null
                                                              ? feels4.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity4 != null
                                                                  ? humidity4
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint4 != null
                                                                  ? dewPoint4
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage4 !=
                                                                      null
                                                                  ? cloudCoverage4
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Visibility"),
                                                          trailing: Text(
                                                              visibility4 !=
                                                                      null
                                                                  ? visibility4
                                                                          .toString() +
                                                                      " m"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed4 != null
                                                                  ? windSpeed4
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection4 !=
                                                                      null
                                                                  ? windDirection4
                                                                          .toString() +
                                                                      ""
                                                                  : "Loading"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //Hourly FIVE
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(five !=
                                                                  null
                                                              ? five.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(feels5 !=
                                                                  null
                                                              ? feels5.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity5 != null
                                                                  ? humidity5
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint5 != null
                                                                  ? dewPoint5
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage5 !=
                                                                      null
                                                                  ? cloudCoverage5
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Visibility"),
                                                          trailing: Text(
                                                              visibility5 !=
                                                                      null
                                                                  ? visibility5
                                                                          .toString() +
                                                                      " m"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed5 != null
                                                                  ? windSpeed5
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection5 !=
                                                                      null
                                                                  ? windDirection5
                                                                          .toString() +
                                                                      ""
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
                                    ),
                                    //DAILY
                                    Container(
                                      child: DefaultTabController(
                                        length: 5,
                                        initialIndex: 0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              height: 40,
                                              child: TabBar(
                                                labelColor: Colors.blue,
                                                unselectedLabelColor:
                                                    Colors.black,
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2.25,
                                              child: TabBarView(
                                                children: [
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //DAILY ONE
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(oneDay !=
                                                                  null
                                                              ? oneDay.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(
                                                              feels1Day != null
                                                                  ? feels1Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity1Day !=
                                                                      null
                                                                  ? humidity1Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint1Day !=
                                                                      null
                                                                  ? dewPoint1Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage1Day !=
                                                                      null
                                                                  ? cloudCoverage1Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed1Day !=
                                                                      null
                                                                  ? windSpeed1Day
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection1Day !=
                                                                      null
                                                                  ? windDirection1Day
                                                                          .toString() +
                                                                      ""
                                                                  : "Loading"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //DAILY two
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(twoDay !=
                                                                  null
                                                              ? twoDay.toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(
                                                              feels2Day != null
                                                                  ? feels2Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity2Day !=
                                                                      null
                                                                  ? humidity2Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint2Day !=
                                                                      null
                                                                  ? dewPoint2Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage2Day !=
                                                                      null
                                                                  ? cloudCoverage2Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed2Day !=
                                                                      null
                                                                  ? windSpeed2Day
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection2Day !=
                                                                      null
                                                                  ? windDirection2Day
                                                                          .toString() +
                                                                      ""
                                                                  : "Loading"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //DAILY three
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(
                                                              threeDay != null
                                                                  ? threeDay
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(
                                                              feels3Day != null
                                                                  ? feels3Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity3Day !=
                                                                      null
                                                                  ? humidity3Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint3Day !=
                                                                      null
                                                                  ? dewPoint3Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage3Day !=
                                                                      null
                                                                  ? cloudCoverage3Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed3Day !=
                                                                      null
                                                                  ? windSpeed3Day
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection3Day !=
                                                                      null
                                                                  ? windDirection3Day
                                                                          .toString() +
                                                                      ""
                                                                  : "Loading"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //DAILY four
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(fourDay !=
                                                                  null
                                                              ? fourDay
                                                                      .toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(
                                                              feels4Day != null
                                                                  ? feels4Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity4Day !=
                                                                      null
                                                                  ? humidity4Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint4Day !=
                                                                      null
                                                                  ? dewPoint4Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage4Day !=
                                                                      null
                                                                  ? cloudCoverage4Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed4Day !=
                                                                      null
                                                                  ? windSpeed4Day
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection4Day !=
                                                                      null
                                                                  ? windDirection4Day
                                                                          .toString() +
                                                                      ""
                                                                  : "Loading"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: ListView(
                                                      children: [
                                                        //DAILY five
                                                        ListTile(
                                                          title: Text(
                                                              "Temperature"),
                                                          trailing: Text(fiveDay !=
                                                                  null
                                                              ? fiveDay
                                                                      .toString() +
                                                                  "\u00B0"
                                                              : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Feels Like"),
                                                          trailing: Text(
                                                              feels5Day != null
                                                                  ? feels5Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Humidity"),
                                                          trailing: Text(
                                                              humidity5Day !=
                                                                      null
                                                                  ? humidity5Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title:
                                                              Text("Dew Point"),
                                                          trailing: Text(
                                                              dewPoint5Day !=
                                                                      null
                                                                  ? dewPoint5Day
                                                                          .toString() +
                                                                      "\u00B0"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Cloud Coverage"),
                                                          trailing: Text(
                                                              cloudCoverage5Day !=
                                                                      null
                                                                  ? cloudCoverage5Day
                                                                          .toString() +
                                                                      "%"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Speed"),
                                                          trailing: Text(
                                                              windSpeed5Day !=
                                                                      null
                                                                  ? windSpeed5Day
                                                                          .toString() +
                                                                      " MPH"
                                                                  : "Loading"),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              "Wind Direction"),
                                                          trailing: Text(
                                                              windDirection5Day !=
                                                                      null
                                                                  ? windDirection5Day
                                                                          .toString() +
                                                                      ""
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
                                    trailing: Text(totalDaylight != null
                                        ? totalDaylight.toString() + " Hrs"
                                        : "Loading"),
                                  ),
                                  ListTile(
                                    leading: FaIcon(FontAwesomeIcons.bed),
                                    title: Text("Hours of Dark"),
                                    trailing: Text(totalNight != null
                                        ? totalNight.toString() + " Hrs"
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
                                  // ListTile(
                                  //   leading:
                                  //       FaIcon(FontAwesomeIcons.solidCircle),
                                  //   title: Text("Next Full Moon"),
                                  //   trailing: Text(nextFull != null
                                  //       ? nextFull.toString()
                                  //       : "Loading"),
                                  // ),
                                  // ListTile(
                                  //   leading: FaIcon(FontAwesomeIcons.circle),
                                  //   title: Text("Next New Moon"),
                                  //   trailing: Text(nextNew != null
                                  //       ? nextNew.toString()
                                  //       : "Loading"),
                                  // ),
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
                      height: MediaQuery.of(context).size.height / 2,
                      child: TabBarView(
                        children: [
                          Center(
                            child: Container(
                              color: Colors.lightBlue,
                              height: MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: BezierChart(
                                bezierChartScale: BezierChartScale.CUSTOM,
                                xAxisCustomValues: const [
                                  1,
                                  2,
                                  3,
                                  4,
                                  5,
                                ],
                                series: [
                                  BezierLine(
                                    data: [
                                      DataPoint<double>(
                                          value: chart1Double, xAxis: 1),
                                      DataPoint<double>(
                                          value: chart2Double, xAxis: 2),
                                      DataPoint<double>(
                                          value: chart3Double, xAxis: 3),
                                      DataPoint<double>(
                                          value: chart4Double, xAxis: 4),
                                      DataPoint<double>(
                                          value: chart5Double, xAxis: 5),
                                    ],
                                  ),
                                ],
                                config: BezierChartConfig(
                                  verticalIndicatorStrokeWidth: 3.0,
                                  verticalIndicatorColor: Colors.black26,
                                  showVerticalIndicator: true,
                                  backgroundColor: Colors.lightBlue,
                                  startYAxisFromNonZeroValue: true,
                                  snap: false,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              color: Colors.lightBlue,
                              height: MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: BezierChart(
                                bezierChartScale: BezierChartScale.CUSTOM,
                                xAxisCustomValues: const [
                                  1,
                                  2,
                                  3,
                                  4,
                                  5,
                                ],
                                series: [
                                  BezierLine(
                                    data: [
                                      DataPoint<double>(
                                          value: chartD1Double, xAxis: 1),
                                      DataPoint<double>(
                                          value: chartD2Double, xAxis: 2),
                                      DataPoint<double>(
                                          value: chartD3Double, xAxis: 3),
                                      DataPoint<double>(
                                          value: chartD4Double, xAxis: 4),
                                      DataPoint<double>(
                                          value: chartD5Double, xAxis: 5),
                                    ],
                                  ),
                                ],
                                config: BezierChartConfig(
                                  verticalIndicatorStrokeWidth: 3.0,
                                  verticalIndicatorColor: Colors.black26,
                                  showVerticalIndicator: true,
                                  backgroundColor: Colors.lightBlue,
                                  snap: false,
                                ),
                              ),
                            ),
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
