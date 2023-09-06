import 'package:countriesapp/pages/CountriesPage.dart';
import 'package:flutter/material.dart';

class CountriesMainPage extends StatelessWidget {
  const CountriesMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.account_box),
                child: Text(
                  "Continents",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Tab(
                icon: Icon(Icons.place),
                child: Text(
                  "Pays ",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[CountriesPage(), CountriesPage()],
        ),
      ),
    );
  }
}
