import 'package:hive/hive.dart';

part 'WordModel.g.dart';

@HiveType(typeId: 0)
class WordModel {
  @HiveField(0)
  final String word;
  @HiveField(1)
  final String banglaMeaning;
  @HiveField(2)
  final String englishMeaning;
  @HiveField(3)
  final String definition;
  @HiveField(4)
  bool isFavourite = false;



  WordModel({this.isFavourite,this.word, this.banglaMeaning, this.definition, this.englishMeaning});

  @override
  String toString() {
    return 'WordModel{word: $word, banglaMeaning: $banglaMeaning, englishMeaning: $englishMeaning, definition: $definition, isFavourite: $isFavourite}';
  }
//
//  Map<String, dynamic> toMap(){
//    var map = Map<String, dynamic>();
//
//    map['word'] = word;
//    map['banglaMeaning'] = banglaMeaning;
//    map['definition'] = definition;
//    map['englishMeaning'] = englishMeaning;
//    map['isFavourite'] = isFavourite;
//
//    return map;
//  }
//
//  factory WordModel.fromMapObject(Map<String, dynamic> map){
//    return WordModel(
//      word: map['word'],
//      banglaMeaning: map['banglaMeaning'],
//      englishMeaning: map['englishMeaning'],
//      definition: map['definition'],
//      isFavourite: map['isFavourite']
//    );
//  }

//  String listToString(List<String> meaning){
//    return '';
//  }
//  List<String> stringToList(String meaning){
//    return [''];
//  }

}