import 'package:flutter/material.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Caffee')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Cafe Distance Between'),
          ],
        ),
      ),
    );
  }
}