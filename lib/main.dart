import 'package:flutter/material.dart';
import 'package:project/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Caffee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Caffee')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
                children: [
                const SizedBox( height: 24,),
                  ElevatedButton(
                        child: const Text('Start'),
                        onPressed: () {
                       Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const MyLogin()));
              },
              style: ElevatedButton.styleFrom(primary: Colors.brown,),)
                ]
             ),
          ),
        ),
      );
  }
}