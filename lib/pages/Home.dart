import 'package:agridictionaryoffline/Model/WordModel.dart';
import 'package:agridictionaryoffline/pages/AboutUs.dart';
import 'package:agridictionaryoffline/pages/Favourite.dart';
import 'package:agridictionaryoffline/pages/SearchPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//'Dictionary of Agriculture '
//'A service of Agri-Science Society(AgSS)


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int pageIndex = 0;
  int counter = 1;


  void onPageChanged(int index){
    if(this.mounted){
      setState(() {
        pageIndex = index;
      });
    }

  }

  onTap(int index){
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.linearToEaseOut
    );
  }


  Widget _getNavBar(){
    return CurvedNavigationBar(
      index: pageIndex,
      animationCurve: Curves.linearToEaseOut,
      animationDuration: Duration(milliseconds: 400),
      height: 50,
      color: Colors.teal,
      buttonBackgroundColor: Colors.teal.shade700,
      backgroundColor: Colors.white70,
      items: <Widget>[
        Icon(Icons.search, size: 25, color: Colors.black,),
        Icon(Icons.favorite_border, size: 25,color: Colors.black,),
        Icon(Icons.info, size: 25, color: Colors.black,)
      ],
      onTap: onTap,
    );
  }



  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  makeCustomDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext){
        Future.delayed(Duration(milliseconds:2500 ), () {
//          Navigator.push(context, MaterialPageRoute(builder:
//            (context) => Home()));
          Navigator.of(dialogContext).pop();
        });
        return Dialog(
//          key: _scaffoldKey,
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.all(Radius.circular(25)),
          ),
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.yellow.shade200,
                      Colors.cyan.shade200
                    ]
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: Colors.black87,
                    ),
                  ),
                ),

                padding: EdgeInsets.fromLTRB(5,19,5,10),
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45,),
                    Text(
                      'Dictionary of Agriculture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SuezOne',
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      'A service of Agri-Science Society(AgSS)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Image.asset('assets/leaf2.png',),
                ),
              )
            ],
          ),
        );
      }
    );
  }


  @override
  void initState() {
    super.initState();
    pageController = PageController();

  }

  @override
  Widget build(BuildContext context) {
    if(counter==1){
      Future.delayed(Duration.zero, () =>makeCustomDialog(_scaffoldKey.currentContext));
      counter++;
      print('***counter: $counter***');
    }

    return Scaffold(
      key: _scaffoldKey,
      body: PageView(
        children: <Widget>[
          SearchPage(),
          Favourite(),
          AboutUs(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
//        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: _getNavBar(),
    );
  }
}
