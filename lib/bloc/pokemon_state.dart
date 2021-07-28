part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonLoaded(
      {@required this.canLoadNextPage, @required this.pokemonListings});
}

class PokemonError extends PokemonState {
  final Error error;

  PokemonError({@required this.error});
}
