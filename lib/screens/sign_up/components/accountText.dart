import 'package:flutter/material.dart';
import 'package:furniture_app/screens/sign_in/sign_in_screen.dart';

import '../../../constants.dart';
import '../../../sizeConfigSplash.dart';

class AccountText extends StatelessWidget {
  const AccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignInScreen();
                },
              ),
            );
          }, // => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign In",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
