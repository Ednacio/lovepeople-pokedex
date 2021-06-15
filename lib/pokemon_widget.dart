import 'package:pokedex/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemoncard.dart';

class PokemonWidget extends StatelessWidget {
  final Pokemon item ;
  const PokemonWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.name!),
        leading: Image.network(item.thumbnailImage!),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CardPokemon(item: item),
            ),
          );
        },
        trailing: Text(
          '#00${item.id}',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
