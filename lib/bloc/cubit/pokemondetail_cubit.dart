import 'package:bloc/bloc.dart';
import 'package:pokedex_app_bloc/model/pokemon_detail.dart';
import 'package:pokedex_app_bloc/model/pokemon_info.dart';
import 'package:pokedex_app_bloc/model/pokemon_species_info.dart';
import 'package:pokedex_app_bloc/repository/pokemon_repository.dart';

class PokemondetailCubit extends Cubit<PokemonDetail> {
  final _pokemonRepository = PokemonRepository();
  PokemondetailCubit() : super(null);

  void getPokemonDetail(int pokemonId) async {
    final response = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId),
    ]);
    final pokemonInfo = response[0] as PokemonInfo;
    final speciesInfo = response[1] as PokemonSpeciesInfo;

    emit(PokemonDetail(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
  }

  void clearPokemonDetail() => emit(null);
}
