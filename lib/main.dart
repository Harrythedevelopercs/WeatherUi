import 'package:flutter/material.dart';
import 'package:weatherapp/Views/GetStarted/main.dart';
import 'package:weatherapp/Views/GetStarted/setcities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const GetStartedScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/cities': (context) => const SetCitiesScreen(),
      },
    );
  }
}
