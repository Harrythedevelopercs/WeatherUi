import 'package:shared_preferences/shared_preferences.dart';

class AppProvider{
   static late SharedPreferences _preferences;
   static const _keyUsername = 'pets';

   static const _keyclientName = 'clientName';
   static const _keyclientEmail = 'clientEmail';

   static Future init() async =>
       _preferences = await SharedPreferences.getInstance();

   static Future setCities(List<String> name) async =>
       await _preferences.setStringList(_keyUsername,name);

   static getCities() => _preferences.getStringList(_keyUsername);


   static setName(String SetName) async =>
       await _preferences.setString(_keyclientName,SetName);

   static setEmail(String SetEmail) async =>
       await _preferences.setString(_keyclientEmail,SetEmail);

   static getEmail() => _preferences.getStringList(_keyclientEmail);
   static getName() => _preferences.getStringList(_keyclientName);



}