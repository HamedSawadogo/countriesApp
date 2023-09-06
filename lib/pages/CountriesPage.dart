import 'package:countriesapp/model/Countrie.dart';
import 'package:countriesapp/pages/CountriePage.dart';
import 'package:countriesapp/pages/SearchPage.dart';
import 'package:flutter/material.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List<Countrie>>(
        future:Countrie.fetchCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CountrieDetails(countrie: snapshot.data![index])));
                  },
                  child: ListTile(
                      title: Text(snapshot.data![index].common),
                      subtitle: Text(snapshot.data![index].region),
                      leading:CircleAvatar(
                        backgroundImage:NetworkImage(snapshot.data![index].flag),
                      ) ,
                      trailing:InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CountrieDetails(countrie: snapshot.data![index])));
                        },
                        child: const Icon(Icons.more_horiz),
                      )
                  ),
                );
              },
            );
          }else if (snapshot.hasError) {
          return const Center(child: Text('une erreur est survenu!'));
        }
          return const Center(child: CircularProgressIndicator());
      },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const SearchPage()
           ));
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
