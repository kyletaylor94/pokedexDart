import 'package:flutter/material.dart';
import 'package:pokedex_application/model/pokemon.dart';
import 'package:pokedex_application/widgets/pokemon_stat.dart';

class PokemonCell extends StatelessWidget {
  const PokemonCell({super.key, required this.selectedPokemon});

  final Pokemon selectedPokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      color: Colors.transparent,
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      selectedPokemon.name.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    width: 100,
                    height: 100,
                    child: Image.network(
                      selectedPokemon.imageUrl!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 30),
                  PokemonStat(pokemon: selectedPokemon)
                ],
              ),
            ),
          )),
    );
  }
}
