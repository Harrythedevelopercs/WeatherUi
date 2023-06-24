import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/Controller/Home/WeatherApi.dart';
import 'package:weatherapp/Model/providers.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/Views/Dashboard/SingleCity.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = AppProvider.getName();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Welcome : ${name}",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              width: 500,
              height: 700,
              child: citiesToShow(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget citiesToShow() {
  List results = AppProvider.getCities();
  var response = WeatherApi.getCurrentArchiveCities(results);
  return FutureBuilder(
    future: response,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      if(snapshot.hasData){
        return ListView.builder(
          itemCount: snapshot.data.length  ,
          itemBuilder: (context, index){
            final timme = snapshot.data[index]['query']['location']['localtime'].toString();

            final localtimeString = timme;
            final localtimeParts = localtimeString.split(' ');
            final timeParts = localtimeParts[1].split(':');
            final adjustedTimeString = "${localtimeParts[0]} ${timeParts[0].padLeft(2, '0')}:${timeParts[1]}";

            final localtime = DateTime.parse(adjustedTimeString);
            final formattedTime = DateFormat('hh:mm a').format(localtime);



            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleCity(citydata: snapshot.data[index]),
                  ),
                );
              },
              child: Container(
                width: 800,
                height: 140,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.grey,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 450,
                        height: 100,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 10,
                      child: Container(
                        width:320,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${snapshot.data[index]['query']['current']['temp_c']}",
                              style: GoogleFonts.montserrat(
                                fontSize: 65,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              width: 130,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                    border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                    style: BorderStyle.solid,
                                  )
                              ),
                              child: Text(
                                "${snapshot.data[index]['query']['location']['country']}",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 75,
                      left: 10,
                      child: Container(
                        width: 320,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${snapshot.data[index]['query']['location']['name']}",
                              style: GoogleFonts.montserrat(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${formattedTime}",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        );
      }else{
        return Center(
          child: Text("loading"),
        );
      }
    },
  );
}
