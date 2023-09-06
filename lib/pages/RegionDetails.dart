import 'package:flutter/material.dart';
import '../model/Countrie.dart';
import 'CountriePage.dart';

// ignore: must_be_immutable
class RegionDetailsPage extends StatelessWidget {
  RegionDetailsPage({Key? key,required this.region}) : super(key: key);
  String region;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(" $region"),
      ),
      body: Center(
        child: FutureBuilder<List<Countrie>>(
          future:Countrie.fetchCountriesByRegion(region),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ListTile(
                        title: Text(snapshot.data![index].common),
                        subtitle: Text(snapshot.data![index].region),
                        leading:CircleAvatar(
                          backgroundImage:NetworkImage(snapshot.data![index].flag),
                        ) ,
                        trailing:InkWell(
                          onTap: () {
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CountrieDetails(countrie:snapshot.data![index])));
                          },
                          child: const Icon(Icons.more_horiz),
                        )
                    ),
                  );
                },
              );
            }else if (snapshot.hasError) {
              return const Text('une erreur est survenu!');
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
      ),
    );
  }
}
