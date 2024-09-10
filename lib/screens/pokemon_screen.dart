import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex_application/model/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_application/widgets/pokemon_list.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  List<Pokemon> _allPokemons = [];
  List<Pokemon> _filteredPokemons = [];

  @override
  void initState() {
    super.initState();
    _fetchPokemons();
  }

  Future<void> _fetchPokemons() async {
    final url = Uri.parse('https://pokedex-bb36f.firebaseio.com/pokemon.json');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data == null) {
          setState(() {
            _allPokemons = [];
            _filteredPokemons = [];
          });
          return;
        }

        if (data is List) {
          _allPokemons = data
              .where((e) => e != null) // Szűrd ki a null elemeket
              .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
              .toList();
        } else if (data is Map<String, dynamic>) {
          _allPokemons = [Pokemon.fromJson(data)];
        }

        _filteredPokemons = _allPokemons;
        setState(() {});
      } else {
        setState(() {
          _allPokemons = [];
          _filteredPokemons = [];
        });
      }
    } catch (error, stackTrace) {
      print('Error fetching data: $error');
      print('Stack trace: $stackTrace');
      setState(() {
        _allPokemons = [];
        _filteredPokemons = [];
      });
    }
  }

  void _updateSearchQuery(String query) {
    setState(() {
      //_searchQuery = query;
      _filteredPokemons = _allPokemons
          .where((pokemon) =>
              pokemon.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: _updateSearchQuery,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: 'Search..',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Additional action if needed
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: _filteredPokemons.isEmpty
          ? const Center(child: Text('No Pokémon to show.'))
          : PokemonList(pokemons: _filteredPokemons),
    );
  }
}
