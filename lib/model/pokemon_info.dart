import 'dart:convert';

import 'package:flutter/foundation.dart';

class PokemonInfo {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;

  PokemonInfo(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.types,
      @required this.height,
      @required this.weight});

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((types) => types['type']['name'] as String)
        .toList();
    return PokemonInfo(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      types: types,
      height: json['height'],
      weight: json['weight'],
    );
  }
}
