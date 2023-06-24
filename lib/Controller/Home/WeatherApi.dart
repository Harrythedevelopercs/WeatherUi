import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class WeatherApi{

  static getCurrentArchiveCities(List cityName) async {
    // var key = "c76dbe34804c44318c005234232306";
    // var url = "http://api.weatherapi.com/v1/current.json?key=${key}&q=${cityName}&aqi=no";
    // var convertURL = Uri.parse(url);
    // var response = await http.get(convertURL);
    // var resultJson = jsonDecode(response.body);
    // print(resultJson.length);
    // return resultJson;

    List location = [];
    var countId = 0;
    cityName.forEach((element) {
      location.add({"q":"${element}","custom_id":"${++countId}"});
    });

    var headers = {
      'Access-Control-Request-Headers': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://api.weatherapi.com/v1/current.json?key=c76dbe34804c44318c005234232306&q=bulk'));
    request.body = json.encode({
      "locations": location
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString() ;
      final decodedMap = json.decode(responseString);
      return decodedMap['bulk'];
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static getFutureWeather(String CityName) async {
    var key = "c76dbe34804c44318c005234232306";
    var url = "https://api.weatherapi.com/v1/forecast.json?key=c76dbe34804c44318c005234232306&q=${CityName}&days=5&aqi=yes&alerts=no";
    var convertURL = Uri.parse(url);
    var response = await http.get(convertURL);
    var resultJson = jsonDecode(response.body);
    return resultJson['forecast']['forecastday'];
  }

}