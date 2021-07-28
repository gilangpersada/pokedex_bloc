import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app_bloc/bloc/cubit/navigation_cubit.dart';
import 'package:pokedex_app_bloc/bloc/cubit/pokemondetail_cubit.dart';
import 'package:pokedex_app_bloc/bloc/pokemon_bloc.dart';
import 'package:pokedex_app_bloc/view/home_screen.dart';
import 'package:pokedex_app_bloc/view/route/app_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pokemondetailCubit = PokemondetailCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.red,
        accentColor: Colors.redAccent,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonBloc>(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0)),
          ),
          BlocProvider<NavigationCubit>(
            create: (context) =>
                NavigationCubit(pokemondetailCubit: pokemondetailCubit),
          ),
          BlocProvider<PokemondetailCubit>(
            create: (context) => pokemondetailCubit,
          ),
        ],
        child: AppNavigator(),
      ),
    );
  }
}
