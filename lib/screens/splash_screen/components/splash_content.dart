import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../sizeConfigSplash.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            "Plasmable",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(34),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: getProportionateScreenWidth(13)),
          ),
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(278),
          width: getProportionateScreenWidth(390),
        ),
      ],
    );
  }
}
