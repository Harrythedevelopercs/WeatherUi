import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/Model/providers.dart';
import 'package:http/http.dart';

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

  print(results);
  return ListView.builder(
    itemCount: results.length,
    itemBuilder: (context, index) {
      return Container(
        width: 800,
        height: 140,
        margin: EdgeInsets.only(top: 10, bottom: 10),
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
              child: Text(
                "12",
                style: GoogleFonts.montserrat(
                  fontSize: 65,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
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
                      "${results[index]}",
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "03:20 AM",
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
      );
    },
  );
}
