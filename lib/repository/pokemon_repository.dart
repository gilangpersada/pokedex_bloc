import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app_bloc/model/pokemon_info.dart';
import 'package:pokedex_app_bloc/model/pokemon_response.dart';
import 'package:pokedex_app_bloc/model/pokemon_species_info.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    final queryParameters = {
      'limit': '20',
      'offset': (pageIndex * 20).toString(),
    };

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);
    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonInfo> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfo.fromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future<PokemonSpeciesInfo> getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpeciesInfo.fromJson(json);
    } catch (e) {
      print(e);
    }
  }
}
