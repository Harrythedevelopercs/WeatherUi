import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/Controller/Home/WeatherApi.dart';
import 'package:intl/intl.dart';

class SingleCity extends StatelessWidget {
  var citydata;

  SingleCity({Key? key, required this.citydata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cityName = citydata['query']['location']['name'];
    var CountryName = citydata['query']['location']['country'];
    var ImageThumbnail = citydata['query']['current']['condition']['icon'];
    var Condition = citydata['query']['current']['condition']['text'];
    var conditionCode = citydata['query']['current']['condition']['code'];
    var wind_kph = citydata['query']['current']['wind_kph'];
    var cloud = citydata['query']['current']['cloud'];
    var uv = citydata['query']['current']['uv'];
    var humidity = citydata['query']['current']['humidity'];

    var wind_dir = citydata['query']['current']['wind_dir'];

    var responseDays = WeatherApi.getFutureWeather(cityName);

    var gifIcon = "1003";
    if (conditionCode == 1003) {
      gifIcon = 'assets/images/cloudy-night.gif';
    } else if (conditionCode == 1000) {
      gifIcon = 'assets/images/sun.gif';
    } else if (conditionCode == 1006) {
      gifIcon = 'assets/images/clouds.gif';
    } else if (conditionCode == 1009) {
      gifIcon = 'assets/images/stratuscumulus.png';
    } else if (conditionCode == 1030) {
      gifIcon = 'assets/images/fog.png';
    } else if (conditionCode == 1183) {
      gifIcon = 'assets/images/rain.gif';
    } else if (conditionCode == 1243) {
      gifIcon = 'assets/images/rain_heavy.gif';
    } else if (conditionCode == 1189) {
      gifIcon = 'assets/images/rainy.gif';
    } else if (conditionCode == 1276) {
      gifIcon = 'assets/images/storm.gif';
    } else if (conditionCode == 1213) {
      gifIcon = 'assets/images/snow.gif';
    } else {
      gifIcon = 'assets/images/weather-news.png';
    }

    double size_height = 90;
    double size_width = 90;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("${cityName} - ${CountryName}"),
        titleTextStyle:
            GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Image(
                image: AssetImage(gifIcon),
                width: 180,
                height: 180,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "${Condition}",
                style:
                    GoogleFonts.montserrat(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: size_width,
                      height: size_height,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${wind_kph}",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "wind kph",
                            style: GoogleFonts.montserrat(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: size_width,
                      height: size_height,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${cloud}",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "Clouds",
                            style: GoogleFonts.montserrat(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: size_width,
                      height: size_height,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${uv}",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "UV",
                            style: GoogleFonts.montserrat(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: size_width,
                      height: size_height,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${humidity}",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "Humidity",
                            style: GoogleFonts.montserrat(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: size_width,
                      height: size_height,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${wind_dir}",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "wind dir",
                            style: GoogleFonts.montserrat(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 340,
                      child: FutureBuilder(
                        future: responseDays,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                final localtime = DateTime.parse(
                                    snapshot.data[index]['date']);
                                final formattedTime =
                                    DateFormat('dd-MM').format(localtime);
                                final formattedTimeDay =
                                    DateFormat('EEEEE').format(localtime);
                                return Container(
                                  margin: EdgeInsets.only(right: 15),
                                  width: 180,
                                  height: size_height,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${snapshot.data[index]['day']['maxtemp_c']}",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                      Text(
                                        "${formattedTimeDay}",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "${formattedTime}",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: Text('Loading'),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
