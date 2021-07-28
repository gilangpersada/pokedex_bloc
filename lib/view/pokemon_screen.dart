import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app_bloc/bloc/cubit/pokemondetail_cubit.dart';
import 'package:pokedex_app_bloc/model/pokemon_detail.dart';

class PokemonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex details'),
      ),
      body: BlocBuilder<PokemondetailCubit, PokemonDetail>(
        builder: (context, pokemon) {
          return (pokemon != null)
              ? Container(
                  color: Colors.red,
                  child: Center(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(pokemon.imageUrl),
                          Text(pokemon.name),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
