import 'package:flutter/material.dart';
import 'pokemon.dart';

class CardPokemon extends StatefulWidget {
  final Pokemon item;

  const CardPokemon({Key? key, required this.item}) : super(key: key);
  @override
  _CardPokemonState createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name ?? ''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: const BorderRadius.all(const Radius.circular(8)),
            ),
            height: 250,
            width: 250,
            child: Image.network(widget.item.thumbnailImage ?? ''),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(const Radius.circular(8)),
            ),
            child: Text(widget.item.description ?? ''),
          ),
          Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(const Radius.circular(8)),
              ),
              child: Text('Tipo: \n ${widget.item.type}')),
          Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(const Radius.circular(8)),
              ),
              child: Text('Fraquezas: \n ${widget.item.weakness}')),
        ],
      ),
    );
  }
}
