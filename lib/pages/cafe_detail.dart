/*import 'package:flutter/material.dart';
import 'package:project/content/cafe.dart';
import 'cafe.dart';

class CafeDetail extends StatefulWidget {
  final Cafe cafe;

  const CafeDetail({
    Key? key,
    required this.cafe,
  }) : super(key: key);

  @override
  _CafeDetailState createState() {
    return _CafeDetailState();
  }
}

class _CafeDetailState extends State<CafeDetail> {


  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cafe.label),
      ),
      // 2
      body: SafeArea(
        // 3
        child: Column(
          children: <Widget>[
            // 4
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.cafe.imageUrl),
              ),
            ),
            // 5
            const SizedBox(
              height: 4,
            ),
            // 6
            Text(
              widget.cafe.label,
              style: const TextStyle(fontSize: 18),
            ),
            // 7
          ],
        ),
      ),
    );
  }
}

 */

