import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../../constants.dart';
import 'chat_and_add_to_cart.dart';
//import 'list_of_colors.dart';
import 'product_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${product.id}',
                      child: ProductPoster(
                        size: size,
                        image: product.image,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2),
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.water_damage_outlined,
                        color: kPrimaryColor,
                        size: 23.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '${product.price}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding / 3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: kPrimaryColor,
                        size: 23.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '${product.location}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding / 3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_hospital_outlined,
                        color: kPrimaryColor,
                        size: 23.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Recovered ${product.recovered} ago',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    child: Text(
                      product.description,
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
            ChatAndAddToCart(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
