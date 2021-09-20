import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/features/pokemon_dictionary/domain/entities/color.dart';
import 'package:pokemon_dictionary/features/pokemon_dictionary/presentation/model/pokemon.dart';

// ignore: must_be_immutable
class CardPokemon extends StatelessWidget {
  Pokemon pokemon;
  CardPokemon(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor.fromHex(typePokemon(pokemon.type[0])),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: -10,
            child: (Image.network(
                'https://raw.githubusercontent.com/Codeaamy/Pokedex/master/images/pokeball.png',
                height: 100,
                fit: BoxFit.fitHeight)),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: (Text(
              pokemon.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
          ),
          Positioned(
            top: 47,
            left: 20,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 4, bottom: 4, right: 8.0),
                child: (Text(
                  pokemon.type.toList()[0],
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
              decoration: BoxDecoration(
                  color: HexColor.fromHex('#DC2626'),
                  //pokemon.getColorType(pokemon.type[0]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: (CachedNetworkImage(
              imageUrl: pokemon.img,
              height: 80,
              fit: BoxFit.fitHeight,
            )),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  String typePokemon(String pokemonList) {
    List<String> typeColor = [];
    typeColor = pokemon.getColorListType(pokemonList);
    return typeColor;
  }
}
