import 'package:agridictionaryoffline/CustomAppBar.dart';
import 'package:agridictionaryoffline/Model/WordModel.dart';
import 'package:agridictionaryoffline/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:agridictionaryoffline/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hive/hive.dart';

class WordDetails extends StatefulWidget {
  WordModel wordModel;
  String heroTag;
  WordDetails({this.wordModel,this.heroTag});
  @override
  _WordDetailsState createState() => _WordDetailsState();
}

class _WordDetailsState extends State<WordDetails> {
  final FlutterTts flutterTts = FlutterTts();


  _speak() async{
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.8);
    await flutterTts.setVolume(1);
    await flutterTts.setPitch(0.8);
    await flutterTts.speak(widget.wordModel.word);
  }

  makeWordFavouriteOrNot() async {
    if (widget.wordModel.isFavourite == false){
      widget.wordModel.isFavourite = true;
    } else{
      widget.wordModel.isFavourite = false;
    }
    final wordBox = Hive.box<WordModel>(wordBoxName);
    setState(() {
      wordBox.put(widget.wordModel.word, widget.wordModel);
    });

  }

  Widget ttsAndFavourite(){
    return Container(
      height: 48,
      color: Colors.grey.shade400,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                child:
                Image.asset(
                  'assets/speak.png',
                  width:32,
                  height: 32,
                  fit:BoxFit.fill,
                ),
                onTap: () {
                  print('*****tag:${widget.heroTag}*****');
                  _speak();
                  } ,
              ),
//
              SizedBox(width: 11,),
              IconButton(
                icon: widget.wordModel.isFavourite ? Icon(Icons.bookmark, size: 30,color: Colors.yellow,):
                Icon(Icons.bookmark_border, size: 31,color: Colors.yellow,),
                onPressed: () => makeWordFavouriteOrNot(),
              ),
              SizedBox(width: 22,)
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.heroTag,
      child: Scaffold(
        appBar: header(context, 'Agri-Dictionary'),
        body: Container(
//        padding:
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
              FadeAnimation(1,ttsAndFavourite()),
                Container(
                  padding:EdgeInsets.only(left:0, top: 0, bottom: 20, right: 0) ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: <Widget>[
                      FadeAnimation(1.1,Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          color: Colors.lightGreen.shade200,
                          width: MediaQuery.of(context).size.width,
                          height: 33,
                          child: Text(
                            'Word',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.black
                            ),
                          ),
                        ),
                      )),
                      SizedBox(height: 4,),
                      FadeAnimation(1.15,Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          widget.wordModel.word,
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      )),
                      SizedBox(height: 38,),
                      FadeAnimation(1.2,Center(
                        child: Container(
                          color: Colors.lightGreen.shade200,
                          padding: EdgeInsets.only(left: 20),
                          height: 33,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Bangla Meaning',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.black
                            ),
                          ),
                        ),
                      )),
                      SizedBox(height: 4,),
                      FadeAnimation(1.25,Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          widget.wordModel.banglaMeaning,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      )),
                      SizedBox(height: 38,),
                      FadeAnimation(1.3,Center(
                        child: Container(
                          height: 33,
                          color: Colors.lightGreen.shade200,
                          padding: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'English Meaning',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.black
                            ),
                          ),
                        ),
                      )),
                      SizedBox(height: 4,),
                      FadeAnimation(1.35,Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          widget.wordModel.englishMeaning,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      )),
                      SizedBox(height: 38,),
                      FadeAnimation(1.4,Center(
                        child: Container(
                          height: 33,
                          color: Colors.lightGreen.shade200,
                          padding: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Definition',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.black
                            ),
                          ),
                        ),
                      )),
                      SizedBox(height: 4,),
                      FadeAnimation(1.45,Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          widget.wordModel.definition,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
