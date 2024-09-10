import 'package:flutter/material.dart';
import 'package:pokedex_application/model/pokemon.dart';

class PokemonSearchDelegate extends SearchDelegate {
  final List<Pokemon> pokemons;

  PokemonSearchDelegate({required this.pokemons});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = pokemons
        .where((pokemon) =>
            pokemon.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final pokemon = results[index];
        return ListTile(
          title: Text(pokemon.name),
          onTap: () {
            // Handle tap on the result item
            Navigator.pop(context, pokemon);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = pokemons
        .where((pokemon) =>
            pokemon.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final pokemon = suggestions[index];
        return ListTile(
          title: Text(pokemon.name),
          onTap: () {
            query = pokemon.name;
            showResults(context);
          },
        );
      },
    );
  }
}
