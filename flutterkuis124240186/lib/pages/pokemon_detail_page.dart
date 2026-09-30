import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // debug dulu
    // print(pokemon.name);
    return Scaffold(
      appBar: AppBar(title: Text('Detail: ' + pokemon.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(pokemon.image, height: 150),
            SizedBox(height: 12),
            Text(pokemon.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 6,
              children: pokemon.types.map((t) => Chip(label: Text(t))).toList(),
            ),
            SizedBox(height: 16),
            // tampilin semua attr
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${pokemon.id}'),
                  Text('Ability: ${pokemon.ability}'),
                  Text('Height: ${pokemon.height}'),
                  Text('Weight: ${pokemon.weight}'),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}