import 'package:flutter/material.dart';
import 'package:pokedex_application/model/poke_type.dart';
import 'package:pokedex_application/model/pokemon.dart';
import 'package:pokedex_application/widgets/pokemon_cell.dart';

class PokemonList extends StatelessWidget {
  final List<Pokemon> pokemons;

  const PokemonList({super.key, required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 30),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 30,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (builder) => SingleChildScrollView(
                      child: PokemonCell(selectedPokemon: pokemon),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Image.network(
                    pokemon.imageUrl!,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: pokemon.type.color,
                ),
                alignment: Alignment.center,
                child: Text(
                  pokemon.name,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
