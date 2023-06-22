import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/Model/cities.dart';
import 'package:weatherapp/Model/providers.dart';
import 'dart:convert';

class SetCitiesScreen extends StatelessWidget {
  const SetCitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 35),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Please Select Cities ",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 15),
            ),
            const CitiesContainer()
          ],
        ),
      ),
    );
  }
}

class CitiesContainer extends StatefulWidget {
  const CitiesContainer({Key? key}) : super(key: key);

  @override
  State<CitiesContainer> createState() => _CitiesState();
}

class _CitiesState extends State<CitiesContainer> {
  late List<String> selectedCities ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCities = [];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(25.0),
            width: 500,
            height: 500,
            child: MultiSelectCheckList(
              textStyles: const MultiSelectTextStyles(
                  selectedTextStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              itemsDecoration: MultiSelectDecorations(
                  selectedDecoration:
                      BoxDecoration(color: Colors.indigo.withOpacity(0.8))),
              listViewSettings: ListViewSettings(
                  separatorBuilder: (context, index) => const Divider(
                        height: 0,
                      )),
              items: List.generate(
                  CitiesList.allCities.length,
                  (index) => CheckListCard(
                      value: CitiesList.allCities[index],
                      title: Text(CitiesList.allCities[index].toString()),
                      subtitle: Text(CitiesList.allCities[index].toString()),
                      textStyles: const MultiSelectItemTextStyles(
                          textStyle: TextStyle(color: Colors.white)),
                      selectedColor: Colors.white,
                      checkColor: Colors.indigo,
                      checkBoxBorderSide: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
              onChange: (allSelectedItems, selectedItem) async {

                selectedCities.clear();
                setState(() {
                  allSelectedItems.forEach((element) {
                    selectedCities.add(element);
                  });
                });


                await AppProvider.setCities(selectedCities).then((value) {
                  const snackBar = SnackBar(
                    content: Text('City Added'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
            )),
        OutlinedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(250, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            side: const BorderSide(width: 1.0, color: Colors.white),
          ),
          child: Text(
            'Next',
            style: GoogleFonts.montserrat(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        )
      ],
    );
  }
}
