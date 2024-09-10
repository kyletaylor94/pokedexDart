import 'package:pokedex_application/model/poke_type.dart';
import 'package:pokedex_application/model/evolution_chain.dart';

class Pokemon {
  final int id;
  final String name;
  final String? imageUrl;
  final String description;
  final int height;
  final int weight;
  final int attack;
  final int defense;
  final PokeType type;
  final List<EvolutionChain>? evolutionChain;

  Pokemon({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.description,
    required this.attack,
    required this.defense,
    required this.height,
    required this.weight,
    this.evolutionChain,
    required this.type,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      height: json['height'],
      weight: json['weight'],
      attack: json['attack'],
      defense: json['defense'],
      type: PokeType.values
          .firstWhere((e) => e.toString().split('.').last == json['type']),
      evolutionChain: json['evolutionChain'] != null
          ? (json['evolutionChain'] as List)
              .map((e) => EvolutionChain.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}
