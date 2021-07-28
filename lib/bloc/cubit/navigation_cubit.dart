import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_app_bloc/bloc/cubit/pokemondetail_cubit.dart';

class NavigationCubit extends Cubit<int> {
  PokemondetailCubit pokemondetailCubit;
  NavigationCubit({@required this.pokemondetailCubit}) : super(null);

  void showPokemonDetail(int pokemonId) {
    pokemondetailCubit.getPokemonDetail(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(null);
    pokemondetailCubit.clearPokemonDetail();
  }
}
