import 'package:countriesapp/pages/RegionDetails.dart';
import 'package:flutter/material.dart';

class ContinentsPage extends StatelessWidget {
  const ContinentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        children: [
           InkWell(
             onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder:(context) => RegionDetailsPage(region: "africa")));
             },
             child: Container(
               padding: EdgeInsets.all(8),
               margin: EdgeInsets.all(8),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.yellow,
               ),
               child: const Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Text("AFRIQUE",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                   SizedBox(height: 10,),
                   Icon(Icons.south_america,
                   color: Colors.red,
                     size: 28,
                   )
                 ],
               ),
             ),
           ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => RegionDetailsPage(region: "americ")));
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pink[300],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("USA",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Icon(Icons.south_america,
                    color: Colors.red,
                    size: 28,)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => RegionDetailsPage(region: "asia")));
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[300],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ASIE",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 10,),
                  Icon(Icons.south_america,
                      color: Colors.red,
                      size: 28)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => RegionDetailsPage(region: "europe")));
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[300],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("EUROPE",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 10,),
                  Icon(Icons.south_america,
                      color: Colors.red,
                      size: 28)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
