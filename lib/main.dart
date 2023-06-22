

import 'package:flutter/material.dart';
import 'package:weatherapp/Model/providers.dart';
import 'package:weatherapp/Views/GetStarted/main.dart';
import 'package:weatherapp/Views/GetStarted/profile.dart';
import 'package:weatherapp/Views/GetStarted/setcities.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppProvider.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    late dynamic response;
    String isValid = '/';
    response = AppProvider.getEmail();
    if(response == null ){
      isValid = '/';
    }
    else{
      isValid = '/dashboard';
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isValid.toString(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const GetStartedScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/cities': (context) => const SetCitiesScreen(),
        '/profile': (context) => const UserProfile(),
        '/dashboard': (context) => const UserProfile(),
      },
    );
  }
}
