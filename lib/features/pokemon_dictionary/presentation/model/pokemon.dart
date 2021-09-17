class Pokemon {
  String name;
  String img;
  int id;
  var type ;

  factory Pokemon(Map jsonMap) {
    try {
      return new Pokemon.deserialize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  Pokemon.deserialize(Map json)
      : id = json["id"],
        img = json["img"],
        type = json["type"].toList(),
        name = json["name"];
}
