import 'package:hive/hive.dart';

part 'WordModel.g.dart';

@HiveType(typeId: 0)
class WordModel {
  @HiveField(0)
  final String word;
  @HiveField(1)
  final String definition;
  @HiveField(2)
  String example = '';
  @HiveField(3)
  String partsOfSpeech = '';
  @HiveField(4)
  String isFavourite = 0.toString();



  WordModel({this.word, this.definition,this.example, this.partsOfSpeech,this.isFavourite});

  @override
  String toString() {
    return 'WordModel{word: $word, definition: $definition, partsOfSpeech: $partsOfSpeech, isFav: $isFavourite}';
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