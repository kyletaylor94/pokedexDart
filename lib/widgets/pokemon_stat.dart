import 'package:flutter/material.dart';
import 'package:pokedex_application/model/pokemon.dart';

class PokemonStat extends StatelessWidget {
  const PokemonStat({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text(
                'Type:',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              const SizedBox(width: 5),
              Text(
                pokemon.type.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    'Defense:',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    pokemon.defense.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text(
                'Height:',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              const SizedBox(width: 5),
              Text(
                pokemon.height.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    'PokeDex ID:',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    pokemon.id.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Weight',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              const SizedBox(width: 5),
              Text(
                pokemon.weight.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    'Base Attack:',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    pokemon.attack.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            width: 300,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Description'.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            pokemon.description,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
