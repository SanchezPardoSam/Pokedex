import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/features/pokemon_dictionary/presentation/model/pokemon.dart';

// ignore: must_be_immutable
class CardPokemon extends StatelessWidget {
  Pokemon pokemon;
  CardPokemon(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            pokemon.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          CachedNetworkImage(
            imageUrl: pokemon.img,
            //maxHeightDiskCache: 200,
            height: 60,
            width: 80,
          ),
          Text(TypePokemon(pokemon.type))
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
String TypePokemon(var pokemonList) {
  String type = "";

  for (var i = 0; i < pokemonList.toList().length; i++) {
    type += pokemonList.toList()[i] + ' ';
  } 
  return type;
}
