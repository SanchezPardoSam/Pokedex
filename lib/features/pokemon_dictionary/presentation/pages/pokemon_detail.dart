import 'package:flutter/material.dart';

class PokemonDetail extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetail({
    Key? key,
    required this.color,
    required this.heroTag,
    this.pokemonDetail,
  }) : super(key: key);

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        children: [
          
          Positioned(
            top: 35,
            left: 1,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          
          Positioned(
            top: 40,
            left:40,
            child: Text(
            widget.pokemonDetail.name,
            style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: Colors.white, 
                fontSize: 30),
            )
          ),
          Positioned(
            top: 45,
            right:20,
            child: Text('#'+
            widget.pokemonDetail.number,
            style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: Colors.white, 
                fontSize: 25),
            )
          ),
          Positioned(
            top: 90,
            left:22,
            child: Text(widget.pokemonDetail.type.join(", "), 
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20),
                ),
            ),
          Positioned(
            top: height * 0.18,
            right: -30,
            child: Image.network(
              'https://raw.githubusercontent.com/Codeaamy/Pokedex/master/images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          ),
          Positioned(
            top: 120,
            right: 50,
            child: Image.network(widget.pokemonDetail.img,
            height: 250,
            fit: BoxFit.fitWidth,),
          ),
          
          
        ],
      ),
    );
  }
}
