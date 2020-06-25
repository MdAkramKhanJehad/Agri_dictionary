import 'dart:io';
import 'package:agridictionaryoffline/Model/WordModel.dart';
import 'package:agridictionaryoffline/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';


const String wordBoxName = 'dictionary';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(WordModelAdapter());
//  final box = await
  await Hive.openBox<WordModel>(wordBoxName);
  runApp(MyApp());

}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Box<WordModel> wordBox;

  retrieveDataFromFile() async{

    String str = await rootBundle.loadString('assets/test.txt');
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(str);

    print('*****in main retrieve from file******');
    return rowsAsListOfValues;
  }

  insertInBox() async{
    List<List<dynamic>> allTheWords = await retrieveDataFromFile();
    print("*****inserting::length:${allTheWords.length} ******");
    for(int i=0;i<allTheWords.length;i++){
      final wordModel = WordModel(isFavourite: false,word: allTheWords[i][0],
          banglaMeaning: allTheWords[i][1],englishMeaning: allTheWords[i][2],
            definition: allTheWords[i][3]);
      print('no ${i+1}: ${wordModel.toString()}');
      wordBox.put(wordModel.word, wordModel);
    }
  }

  @override
  void initState() {
    super.initState();
    wordBox = Hive.box<WordModel>(wordBoxName);
    if(wordBox.isEmpty){
      insertInBox();
    } else{
      print('*******BOX IS NOT EMPTY::Size:${wordBox.length} **');
//      makeCustomDialog();
    }
  }

@override
  void dispose() {
    super.dispose();
    Hive.close();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home() ,
    );
  }
}


