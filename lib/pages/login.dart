import 'package:flutter/material.dart';
import 'package:project/pages/map.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caffee"),
      ),
      body: Center(
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Caffee Login',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                child: const Text('ENTER'),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MapsPage()));
                },
                style: ElevatedButton.styleFrom(primary: Colors.brown,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
