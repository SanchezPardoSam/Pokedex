import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/features/pokemon_dictionary/presentation/pages/pokemon_detail.dart';
import 'package:pokemon_dictionary/features/pokemon_dictionary/presentation/widgets/card.dart';
import 'features/pokemon_dictionary/domain/entities/color.dart';
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Pokedex"),
          actions: [Icon(Icons.search)],
          //backgroundColor: Colors.grey,
        ),
        body: Stack(
          children: [
            Positioned(
                top: -20,
                right: -20,
                child: Image.network(
                    'https://raw.githubusercontent.com/Codeaamy/Pokedex/master/images/pokeball.png',
                    height: 180,
                    fit: BoxFit.fitHeight)),
            Positioned(
              top: 60,
              bottom: 0,
              width: width,
              child: Column(
                children: [
                  // ignore: unnecessary_null_comparison
                  _pokedex != null
                      ? Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.4),
                            itemCount: _pokedex.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: CardPokemon(_pokedex[index]),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PokemonDetail(
                                          pokemonDetail: _pokedex[index],
                                          color: HexColor.fromHex(
                                              _pokedex[index]
                                                  .getColorBackground(
                                                      _pokedex[index].type[0])),
                                          heroTag: index,
                                        ),
                                      ));
                                },
                              );
                            },
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ],
              ),
            ),
          ],
        ));
  }
}
