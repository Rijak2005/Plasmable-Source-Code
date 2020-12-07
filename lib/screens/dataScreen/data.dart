import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/components/my_nav_bar.dart';
import 'package:furniture_app/screens/dataScreen/info_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../../constant2.dart';
import 'components/counter.dart';
import 'components/my_header.dart';

class DataScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Can't Open URL";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: <Widget>[
              MyHeader(
                image: "assets/icons/Drcorona.svg",
                textTop: "All you need to do",
                textBottom: "is stay at home.",
                left: 147.0,
                offset: offset,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Real Time Data\n",
                                style: kTitleTextstyle,
                              ),
                              TextSpan(
                                text: "Data is up to date",
                                style: TextStyle(
                                  color: kTextLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                                "https://www.worldometers.info/coronavirus/country/india/");
                          },
                          child: Text(
                            "See details",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Counter(
                            color: kInfectedColor,
                            number: Container(
                              child: FutureBuilder<DataModel>(
                                future: fetchData(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      "${snapshot.data.confirmed}",
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: kInfectedColor,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text(
                                      "N.A.",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: kInfectedColor,
                                      ),
                                    );
                                  } else {
                                    return CircularProgressIndicator(
                                      backgroundColor: Color(0xFFF10205),
                                    );
                                  }
                                },
                              ),
                            ),
                            title: "Infected",
                          ),
                          Counter(
                            color: kDeathColor,
                            number: FutureBuilder<DataModel>(
                              future: fetchData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    "${snapshot.data.deaths}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: kDeathColor,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                    "N.A.",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: kDeathColor,
                                    ),
                                  );
                                } else {
                                  return CircularProgressIndicator(
                                    backgroundColor: Color(0xFFF10205),
                                  );
                                }
                              },
                            ),
                            title: "Deaths",
                          ),
                          Counter(
                            color: kRecovercolor,
                            number: FutureBuilder<DataModel>(
                              future: fetchData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    "${snapshot.data.recovered}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: kRecovercolor,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                    "N.A.",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: kRecovercolor,
                                    ),
                                  );
                                } else {
                                  return CircularProgressIndicator(
                                    backgroundColor: Color(0xFFF10205),
                                  );
                                }
                              },
                            ),
                            title: "Recovered",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Spread of Virus",
                          style: kTitleTextstyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                                "https://news.google.com/covid19/map?hl=en-IN&mid=%2Fm%2F03rk0&gl=IN&ceid=IN%3Aen");
                          },
                          child: Text(
                            "See details",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(20),
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 30,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/map.png",
                        width: 300.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataModel {
  final int confirmed;
  final int recovered;
  final int deaths;
  DataModel({this.confirmed, this.recovered, this.deaths});

  factory DataModel.convertToObject(var json) {
    return DataModel(
        confirmed: json["confirmed"],
        deaths: json["deaths"],
        recovered: json["recovered"]);
  }
}

Future<DataModel> fetchData() async {
  var url = "https://api.covidindiatracker.com/total.json";
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var responseJson = jsonDecode(response.body);
    return DataModel.convertToObject(responseJson);
  } else {
    throw Exception();
  }
}
