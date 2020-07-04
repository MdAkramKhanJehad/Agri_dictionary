import 'package:agridictionaryoffline/CustomAppBar.dart';
import 'package:agridictionaryoffline/CustomWidgets.dart';
import 'package:agridictionaryoffline/Model/WordModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChannels, rootBundle;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async';
import '../main.dart';
import 'WordDetails.dart';

class Favourite extends StatefulWidget {

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Box<WordModel> wordBox;

  @override
  void initState() {
    wordBox = Hive.box<WordModel>(wordBoxName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(context),
      backgroundColor: Colors.green.withOpacity(0.3),
      appBar: appBar(context,'Favourite Words'),
//      header(context, 'Favourite Words'),
//      customAppBar(context, 'Favourite Words'),
      body: Container(
//          color: Colors.green.withOpacity(0.3),
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//              begin: Alignment.topRight,
//              end: Alignment.bottomLeft,
//              colors: [
//                Colors.blueGrey.shade700,
//                Colors.grey.shade300
//              ]
//            ),
//          ),
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ValueListenableBuilder(
                  valueListenable: wordBox.listenable(),
                  builder: (context, Box<WordModel> words,_){

                    var favouriteWords = wordBox.values.where((item) =>
                                    item.isFavourite==1.toString()).toList();
                      return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
//                      scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (_, index){
                            final String key = favouriteWords[index].word;
                            final wordModel = wordBox.get(key);
                            return Hero(
                              tag: key,
                              child: Card(
                                  color: Colors.teal,
                                  child: ListTile(
                                    onTap: () => Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration: Duration(milliseconds: 500),
                                        pageBuilder: (_, __, ___) =>
                                          WordDetails(wordModel:wordModel,heroTag: key,))),
//                              Navigator.push(context, MaterialPageRoute(builder:
//                              (context) => WordDetails(wordModel:wordModel))),
                                    title:  Text(key, style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Volkhov',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400
                                    ),),
//                                    subtitle: Text(wordBox.get(key).example),
                                  ),

                              ),
                            );
                          },
                          separatorBuilder: (_, index) => Divider(),
                          itemCount: favouriteWords.length
                        );
                  },
                )

              ],

            ),
          ),

      ),
    );
  }
}
