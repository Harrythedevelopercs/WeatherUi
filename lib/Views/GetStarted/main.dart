import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
             const Image(image: AssetImage("assets/images/earth.gif"),width: 500,height: 500,),
             Text("Just Weather",style: GoogleFonts.montserrat(
               fontSize: 35,
               fontWeight: FontWeight.w500,
               color: Colors.white
             ),),
            const SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                  Navigator.pushReplacementNamed(context, '/cities');
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(250, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                side: const BorderSide(width: 1.0, color: Colors.white),
              ),
              child: Text('Get Started',style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),),
            )
          ],
        ),
      ),
    );
  }
}
