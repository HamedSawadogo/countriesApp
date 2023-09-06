import 'package:countriesapp/model/CountriesMain.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Positioned(
        child: ElevatedButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CountriesMainPage(),));
        },
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(5),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
              ),
              backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
          child: Text("allez c'est parti!",
            style: GoogleFonts.aBeeZee(fontSize: 18),),
        ),
      ),
    );
  }
}
