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
        alignment: Alignment.center,
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
              left: 40,
              child: Text(
                widget.pokemonDetail.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              )),
          Positioned(
              top: 45,
              right: 20,
              child: Text(
                '#' + widget.pokemonDetail.number,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              )),
          Positioned(
            top: 90,
            left: 22,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 4.0, top: 4.0),
                child: Text(
                  widget.pokemonDetail.type.join(", "),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.black26,
              ),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Name:',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              widget.pokemonDetail.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Height:',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              widget.pokemonDetail.height,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Weight:',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              widget.pokemonDetail.weight,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Spawn Time:',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              widget.pokemonDetail.spawnTime,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Weakness:',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail.weakness.toList().join(', '),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Evolution:',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
                            ),
                          ),
                          widget.pokemonDetail.evolution != null
                              ? SizedBox(
                                  height: 20,
                                  width: width * 0.40,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.pokemonDetail.evolution
                                        .toList()
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          widget.pokemonDetail.evolution
                                              .toList()[index]['name'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Text(
                                  "Maxed Out",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Pre Form:',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
                            ),
                          ),
                          widget.pokemonDetail.preForm != null
                              ? SizedBox(
                                  height: 20,
                                  width: width * 0.40,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.pokemonDetail.preForm
                                        .toList()
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          widget.pokemonDetail.preForm
                                              .toList()[index]['name'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Text(
                                  "Just Hatchet",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * 0.18),
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.heroTag,
              child: Image.network(
                widget.pokemonDetail.img,
                height: 250,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
