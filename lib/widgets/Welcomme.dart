import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class WelcommeWidget extends StatelessWidget {
  const WelcommeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("WELCOMME!",
      style: GoogleFonts.aBeeZee(
          fontSize:28
      ));
  }
}
