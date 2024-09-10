import 'package:flutter/material.dart';

enum PokeType {
  poison,
  fire,
  water,
  bug,
  flying,
  normal,
  electric,
  ground,
  fairy,
  grass,
  fighting,
  psychic,
  steel,
  ice,
  rock,
  dragon
}

extension PokeColor on PokeType {
  Color get color {
    switch (this) {
      case PokeType.poison:
        return Colors.green.withOpacity(0.8);
      case PokeType.fire:
        return Colors.red.withOpacity(0.8);
      case PokeType.water:
        return Colors.cyan.withOpacity(0.8);
      case PokeType.bug:
        return Colors.grey.withOpacity(0.8);
      case PokeType.flying:
        return Colors.grey.withOpacity(0.6);
      case PokeType.normal:
        return Colors.grey.withOpacity(0.9);
      case PokeType.electric:
        return Colors.orange.withOpacity(0.7);
      case PokeType.ground:
        return Colors.brown.withOpacity(0.7);
      case PokeType.fairy:
        return Colors.pink.withOpacity(0.7);
      case PokeType.grass:
        return Colors.green.withOpacity(0.6);
      case PokeType.fighting:
        return Colors.grey.withOpacity(0.4);
      case PokeType.psychic:
        return Colors.yellow.withOpacity(0.7);
      case PokeType.steel:
        return Colors.grey.withOpacity(0.3);
      case PokeType.ice:
        return Colors.blue.withOpacity(0.7);
      case PokeType.rock:
        return Colors.grey.withOpacity(0.5);
      case PokeType.dragon:
        return Colors.red.withOpacity(0.7);
    }
  }
}
