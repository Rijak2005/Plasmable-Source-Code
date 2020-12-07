import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/product.dart';

import '../../../constants.dart';
import '../../../constants.dart';
import '../../../constants.dart';
import '../../../constants.dart';

class ChatAndAddToCart extends StatelessWidget {
  const ChatAndAddToCart({Key key, this.product}) : super(key: key);

  final Product product;

  void launchEmail(String email) async {
    var emailUrl =
        "mailto:$email?subject=Message from Plasmable &body=I require plasma at the earliest, so kindly share your contact details so we can communicate further.\nThank You!";
    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw "unable to contact at the moment";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchEmail(product.email);
      },
      child: Container(
        margin: EdgeInsets.all(kDefaultPadding),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        decoration: BoxDecoration(
          color: kBlueColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: 18,
            ),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              "Get In Touch",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // it will cover all available spaces
            // Spacer(),
            // FlatButton.icon(
            //   onPressed: () {},
            //   icon: SvgPicture.asset(
            //     "assets/icons/shopping-bag.svg",
            //     height: 18,
            //   ),
            //   label: Text(
            //     "Add to Cart",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
