import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app_bloc/bloc/cubit/navigation_cubit.dart';
import 'package:pokedex_app_bloc/bloc/pokemon_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonLoaded) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: state.pokemonListings.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationCubit>(context)
                        .showPokemonDetail(state.pokemonListings[index].id);
                  },
                  child: Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(state.pokemonListings[index].getImage),
                          Text(state.pokemonListings[index].name),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
