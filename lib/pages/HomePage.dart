import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/Welcomme.dart';
import '../widgets/HomeButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            const WelcommeWidget(),
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset("assets/images/world.png"
                ,fit: BoxFit.fitWidth,),
            ),
            const Padding(padding: EdgeInsets.all(40)),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text("Connais-tu le monde ?",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20
                ),
              ),
            ),
             const SizedBox(height: 4,),
             const HomePageButton(),
         ]
     )
      )
    );
  }
}
