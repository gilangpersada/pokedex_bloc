import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app_bloc/bloc/cubit/navigation_cubit.dart';
import 'package:pokedex_app_bloc/view/home_screen.dart';
import 'package:pokedex_app_bloc/view/pokemon_screen.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, pokemonId) {
        return Navigator(
          pages: [
            MaterialPage(child: HomeScreen()),
            if (pokemonId != null) MaterialPage(child: PokemonScreen())
          ],
          onPopPage: (route, result) {
            BlocProvider.of<NavigationCubit>(context).popToPokedex();
            return route.didPop(result);
          },
        );
      },
    );
  }
}
