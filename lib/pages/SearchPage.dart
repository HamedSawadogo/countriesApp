import 'package:countriesapp/pages/CountriePage.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

import '../model/Countrie.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchPage> {
  String searchValue = 'a';
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
          backgroundColor: Colors.red,
          suggestions: _suggestions,
          title: const Text(
            'recherher un pays',
            style: TextStyle(color: Colors.white),
          ),
          onSearch: (value) => setState(() => searchValue = value),
          // suggestions: _suggestions
        ),
        body: FutureBuilder<List<Countrie>>(
          future: Countrie.fetchCountriesByName(searchValue),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CountrieDetails(countrie:snapshot.data![index])))
                    },
                    child: ListTile(
                      title: Text(
                        snapshot.data![index].common,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(snapshot.data![index].region,
                          style: const TextStyle(color: Colors.black54)),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data![index].flag),
                      ),
                      trailing: const Icon(Icons.more_horiz),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Aucun pays trouvé'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
