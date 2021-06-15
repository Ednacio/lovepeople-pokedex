import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_widget.dart';
import 'pokemon.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pokemon> pokemonList = [];

  @override
  void initState() {
    cardsPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokedex'), actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Image.network(
              'https://maxcdn.icons8.com/Share/icon/color/Gaming/pokeball1600.png'),
        )
      ]),
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (
          context,
          index,
        ) {
          return PokemonWidget(
            item: pokemonList[index],
          );
        },
      ),
    );
  }

  void cardsPokemon() {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    http.get(url).then((response) {
      if (response.statusCode == 200) {
        Map json = JsonDecoder().convert(response.body);

        setState(() {
          pokemonList = json['data'].map<Pokemon>((item) {
            return Pokemon.fromJson(item);
          }).toList();
        });
      }
    });
  }
}
