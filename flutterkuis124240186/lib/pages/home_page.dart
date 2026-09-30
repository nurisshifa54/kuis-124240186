import 'package:flutter/material.dart';
import '../data/pokemon.dart';
import '../models/pokemon.dart';
import 'pokemon_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon App'),
      ),
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          Pokemon poke = pokemonList[index];

          return ListTile(
            leading: Image.network(
              poke.image,
              width: 50,
              height: 50,
            ),
            title: Text(poke.name),
            subtitle: Text(poke.types.join(', ')),
            trailing: const Icon(Icons.info_outline),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetailPage(
                    pokemon: poke,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}