
import 'package:flutter/material.dart';
import 'package:project/Constants/config.dart';

class CoffeeCard extends StatelessWidget {
  final String? shopImage;
  final String? shopName;
  static const _endpoint = 'https://maps.googleapis.com/maps/api/place/photo';

  const CoffeeCard({Key? key, this.shopImage, this.shopName}) : super(key: key);

  String _photoApi() {

    print(shopImage);
    return _endpoint +
        '?maxheight=150&photoreference=' +
        shopImage! +
        '&key=' +
        apiKey;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      width: 300.0,
      child: Card(
        child: Column(
          children: <Widget>[
            // Image.network(
            //   _photoApi(),
            //   height: 150.0,
            //   width: 300.0,
            //   fit: BoxFit.cover,
            // ),
            Text(shopName!),
          ],
        ),
      ),
    );
  }
}