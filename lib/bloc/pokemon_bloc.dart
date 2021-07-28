import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex_app_bloc/model/pokemon_response.dart';
import 'package:pokedex_app_bloc/repository/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();
  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(
    PokemonEvent event,
  ) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoading();

      try {
        final pokemonPageResponse =
            await _pokemonRepository.getPokemonPage(event.page);
        yield PokemonLoaded(
          canLoadNextPage: pokemonPageResponse.canLoadNextPage,
          pokemonListings: pokemonPageResponse.pokemonListings,
        );
      } catch (e) {
        yield PokemonError(error: e);
      }
    }
  }
}
