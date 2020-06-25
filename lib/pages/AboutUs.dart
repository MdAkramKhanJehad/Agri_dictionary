import 'package:agridictionaryoffline/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'WordDetails.dart';


class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String sub = 'Suggestions About Agri-Dictionary';
  String body  = '';

  _launchURL() async {

    final url = 'mailto:a.jehadkhan@gmail.com?subject=$sub&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blueGrey.shade700,
            Colors.grey.shade300
          ]
        ),
      ),
//      color: Colors.blueGrey.shade100,
      padding: EdgeInsets.all(40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40,),
            FadeAnimation(1,Text(
              'About Us',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'OdibeeSans',
                fontWeight: FontWeight.bold
              ),
            )),
            SizedBox(height: 10,),
            Center(
              child: FadeAnimation(1.1,Text(
                'Agri-Science Society(AgSS)',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w100
                ),
              )),
            ),
            FadeAnimation(1.2,Text(
              '"Let\'s Make a Future of Agriculture"',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w100
              ),
            )),
            SizedBox(height: 5,),
            AspectRatio(
              aspectRatio: 16/9,
              child: FadeAnimation(1.3,Image(image: AssetImage('assets/leaf.png'),))
            ),
            SizedBox(height: 35,),
            FadeAnimation(1.4,Text(
              'Any Suggestions?',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w100
              ),
            )),
            Center(
              child: FadeAnimation(1.5,RaisedButton(
                hoverElevation: 1,
                color: Colors.cyan,
                onPressed: _launchURL,
                child: Text('Mail AgSS'),
              )),
            ),

          ],
        ),
      ),
    );
  }
}

