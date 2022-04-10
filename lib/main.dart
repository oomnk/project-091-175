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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),

           Align(
             alignment: Alignment.topCenter,
             child: Padding(
               padding: const EdgeInsets.only(top:70),
               child: Container(
                 
                //  color: Colors.brown,
                          child:const Image(
                     image: AssetImage('assets/images/logo.png'),
                     fit: BoxFit.cover,
                     
                    ),
               ),
             ),
           ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width:MediaQuery.of(context).size.width*0.9,
                height: 70,
                child: ElevatedButton(
                  child: const Text('GET STARTED!'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyLogin()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
