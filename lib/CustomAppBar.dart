import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';


PreferredSize header(BuildContext context, String title){
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: ClipShadow(
      clipper: CustomAppBar(),
      boxShadow: [BoxShadow(
        color: Colors.blueGrey, blurRadius:10, spreadRadius: 5, offset:Offset(0.0,0.8)
      )],
      child: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: "SuezOne",
                    fontWeight: FontWeight.normal,
                    fontSize: 28
                  ),
                ),

              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.teal.shade200,
                Colors.teal.shade400,
              ]
            ),
          ),
//        child: ,
        ),
      ),
    ),
  );
}

class CustomAppBar extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);

//    var firstEndPoint = Offset(size.width/5, (size.height/2)+20);
//    var firstControlPoint = Offset(size.width/10, (size.height/2)+20);
//    path.quadraticBezierTo(firstControlPoint.dx,firstControlPoint.dy ,
//            firstEndPoint.dx, firstEndPoint.dy);
//    path.lineTo(8*size.width/10, (size.height/2)+20);
//    var lastEndPoint = Offset(size.width, size.height);
//    var lastControlPoint = Offset(9*size.width/10, (size.height/2)+20);
//    path.quadraticBezierTo(lastControlPoint.dx,lastControlPoint.dy ,
//            lastEndPoint.dx, lastEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}