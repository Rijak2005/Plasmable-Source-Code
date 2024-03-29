import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/components/my_nav_bar.dart';
import 'package:furniture_app/screens/dataScreen/data.dart';
import 'package:furniture_app/sizeConfigSplash.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant2.dart';
import 'components/my_header.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHeader(
                image: "assets/icons/coronadr.svg",
                textTop: "Get to know",
                textBottom: "About Covid-19.",
                offset: offset,
                left: 170.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Symptoms",
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SymptomCard(
                            image: "assets/images/headache.png",
                            title: "Headache",
                            isActive: true,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          SymptomCard(
                            image: "assets/images/caugh.png",
                            title: "Cough",
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          SymptomCard(
                            image: "assets/images/fever.png",
                            title: "Fever",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Text("Prevention", style: kTitleTextstyle),
                    SizedBox(height: 20),
                    PreventCard(
                      text:
                          "Wearing a facemask is absolutely essential and recommended by WHO.",
                      image: "assets/images/wear_mask.png",
                      title: "Wear face mask",
                    ),
                    PreventCard(
                      text:
                          "Washing your hands regularly for 20 seconds is advised.",
                      image: "assets/images/wash_hands.png",
                      title: "Wash your hands",
                    ),
                    PreventCard2(
                      text:
                          "Maintain a minimum distance of 2m from other people",
                      image: "assets/images/social-distancing.png",
                      title: "Social Distancing",
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(
                          "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public");
                    },
                    child: Text(
                      "Learn More about WHO guidlines",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: SvgPicture.asset("assets/icons/forward.svg"),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreventCard2 extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard2({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset(
                image,
                scale: 4.5,
              ),
            ),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: SvgPicture.asset("assets/icons/forward.svg"),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
