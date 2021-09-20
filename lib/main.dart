import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/features/pokemon_dictionary/presentation/widgets/card.dart';
import 'features/pokemon_dictionary/domain/repositories/pokemonData.dart';
import 'features/pokemon_dictionary/presentation/model/pokemon.dart';

void main() {
  runApp(new MaterialApp(
    home: PokemonDictionary(),
    theme: ThemeData.dark(),
  ));
}

class PokemonDictionary extends StatefulWidget {
  PokemonDictionary({Key? key}) : super(key: key);

  @override
  _PokemonDictionaryState createState() => _PokemonDictionaryState();
}

class _PokemonDictionaryState extends State<PokemonDictionary> {
  //PokemonData _data = new PokemonData();
  List<Pokemon> _pokedex = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      loadData();
    }
  }

  void loadData() async {
    var data = await PokemonData().fetchPokemonData();
    setState(() {
      _pokedex.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(       
        appBar: new AppBar(
            title: new Text("Pokemon Dictionary"),
            actions: [Icon(Icons.search)],
            //backgroundColor: Colors.grey,
            ),
        body: Column(
          children: [
            // ignore: unnecessary_null_comparison
            _pokedex != null ? Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.4),
                itemCount: _pokedex.length,
                itemBuilder: (context, index) {
                  return CardPokemon(_pokedex[index]);
                },
              ),
            ):Center(
              child: CircularProgressIndicator(),
            )
          ],
        ));
  }
}
