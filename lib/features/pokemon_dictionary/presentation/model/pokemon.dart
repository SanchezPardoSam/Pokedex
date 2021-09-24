import 'package:flutter/material.dart';

class Pokemon {
  String name;
  String img;
  int id;
  String number;
  var type;

  factory Pokemon(Map jsonMap) {
    try {
      return new Pokemon.deserialize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  Pokemon.deserialize(Map json)
      : id = json["id"],
        number = json["num"],
        img = json["img"],
        type = json["type"].toList(),
        name = json["name"];

  Map<String, List<String>> _genreMap = {
    'Grass': ["#047857", "#10B981"],
    "Poison": ["#4338CA", "#8B5CF6"],
    "Fire": ["#B91C1C", "#EF4444"],
    "Ice": ["#60A5FA", "#BFDBFE"],
    "Water": ["#1D4ED8", "#3B82F6"],
    "Ground": ["#78350F", "#B45309"],
    "Rock": ["#D97706", "#92400E"],
    "Psychic": ["#8B5CF6", "#6D28D9"],
    "Dragon": ["#818CF8", "#4F46E5"],
    "Electric": ["#FBBF24", "#F59E0B"],
    "Fighting": ["#D1D5DB", "#9CA3AF"],
    "Flying": ["#9CA3AF", "#93C5FD"],
    "Fairy": ["#F9A8D4", "#F472B6"],
    "Bug": ["#A78BFA", "#7C3AED"],
    "Normal": ["#9CA3AF", "#D1D5DB"],
    "Ghost": ["#6366F1", "#312E81"],
  };

  List<String>? getColorListType(String type) {
    return _genreMap[type];
  }

  String getColorBackground(String type) {
    var listColor = getColorListType(type);
    return listColor!.toList()[1];
  }

  String getColorType(String type) {
    var listColor = getColorListType(type);
    return listColor!.toList()[0];
  }
}
