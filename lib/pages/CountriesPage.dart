import 'package:countriesapp/model/Countrie.dart';
import 'package:countriesapp/pages/CountriePage.dart';
import 'package:countriesapp/pages/SearchPage.dart';
import 'package:flutter/material.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Countrie>>(
        future: Countrie.fetchCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CountrieItem(countrie: snapshot.data![index]);
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('une erreur est survenu!'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchPage()));
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}

class CountrieItem extends StatelessWidget {
  const CountrieItem({super.key, required this.countrie});
  final Countrie countrie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CountrieDetails(countrie: countrie)));
      },
      child: Hero(
        tag: countrie.flag,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                        width: 200,
                        height: 120,
                        child: Image.network(
                          countrie.flag,
                          fit: BoxFit.fill,
                        ))),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          countrie.official,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18),
                        ),
                        Text(
                          countrie.common,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
