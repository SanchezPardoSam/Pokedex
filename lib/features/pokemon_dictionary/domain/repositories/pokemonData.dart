import 'dart:convert';
import 'dart:async';
import "package:http/http.dart" as http;
import 'package:pokemon_dictionary/features/pokemon_dictionary/presentation/model/pokemon.dart';

class PokemonData {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  String  name = "ooo";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Pokemon>> fetchPokemonData() {
    var url = Uri.http("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    return getJson(url).then((value) => 
      value['pokemon'].map<Pokemon>((pokemon) => new Pokemon(pokemon)).toList());    
  }
}
