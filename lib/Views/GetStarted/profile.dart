import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/Model/providers.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {


  TextEditingController nameText = new TextEditingController();
  TextEditingController emailText = new TextEditingController();
  late String errorNameMessage = "";
  late String errorEmailMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Profile",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 35),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller:nameText,
                  keyboardType: TextInputType.name,
                  style: GoogleFonts.montserrat(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: GoogleFonts.montserrat(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Colors.white), //<-- SEE HERE
                    ),
                  ),
                ),
                Text("${errorNameMessage}",style: GoogleFonts.montserrat(color: Colors.red)),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller:emailText,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.montserrat(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: GoogleFonts.montserrat(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Colors.white), //<-- SEE HERE
                    ),
                  ),
                ),
                Text("${errorEmailMessage}",style: GoogleFonts.montserrat(color: Colors.red)),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          if(nameText.text == ""){
                            setState(() {
                              errorNameMessage = "Please Enter Name";
                              Future.delayed(
                                Duration(seconds: 2),
                                  (){
                                    setState(() {
                                      errorNameMessage = "";
                                    });
                                  }
                              );
                            });
                          }else{
                            if(emailText.text == ""){
                              setState(() {
                                errorEmailMessage = "Please Enter Email";
                                Future.delayed(
                                    Duration(seconds: 2),
                                        (){
                                      setState(() {
                                        errorEmailMessage = "";
                                      });
                                    }
                                );
                              });
                            }
                            else{
                              await AppProvider.setName(nameText.text).then(
                                  await AppProvider.setName(emailText.text).then(
                                    Navigator.pushNamed(context, '/dashboard')
                                  )
                              );

                            }
                          }

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        child: const Text("Save Profile")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/cities");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        child: const Text("Update Cities")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
