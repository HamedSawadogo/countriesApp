import 'package:countriesapp/model/Countrie.dart';
import 'package:flutter/material.dart';
class CountrieDetails extends StatelessWidget{
   CountrieDetails({Key? key,required this.countrie}) : super(key: key);
   final Countrie countrie;

   String formatPopulation(int population) {
     if (population >= 1000000000) {
       final double populationInBillions = population / 1000000000;
       return '${populationInBillions.toStringAsFixed(2)} B';
     } else if (population >= 1000000) {
       final double populationInMillions = population / 1000000;
       return '${populationInMillions.toStringAsFixed(2)} M';
     } else if (population >= 1000) {
       final int populationInThousands = population ~/ 1000;
       return '$populationInThousands Mille';
     } else {
       return population.toString();
     }
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(countrie.common),
      ),
      body: Hero(
        tag: countrie.common,
        child: Column(
          children: [
             Container(
               margin: const EdgeInsets.all(20),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 border: Border.all(
                   color: Colors.black,
                   width: 3
                 )
               ),
               height: 230,
                 width: double.infinity,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   child: Image.network(countrie.flag,
                   fit: BoxFit.fill,),
                 )
             ),

          ],
        ),
      ),
    );
  }
}

