import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/Model/cities.dart';

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
            Text("Welcome",style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 35
            ),),
            const SizedBox(height: 5,),
            Text("Please Select CitiesContainer ",style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 15
            ),),
            CitiesContainer()
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



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(25.0),
        width: 500,
        height: 600,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: CitiesList.allCities.length,
          itemBuilder: (context, index) {
            return  MultiSelectCheckList(
              maxSelectableCount: 10,
              textStyles:  MultiSelectTextStyles(
                textStyle: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
                disabledTextStyle: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
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
                      title: Text(CitiesList.allCities[index]['city'].toString()),
                      subtitle: Text(CitiesList.allCities[index]['country'].toString()),
                      selectedColor: Colors.white,
                      checkColor: Colors.indigo,
                      checkBoxBorderSide:
                      const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
              onChange: (allSelectedItems, selectedItem) {
              },
              onMaximumSelected: (allSelectedItems, selectedItem) {
                const snackBar = SnackBar(
                  content: Text('The limit has been reached'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            );
          },
        ),
      ),
    );
  }
}
