import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialButtonClassPage extends StatelessWidget{
  double minwidth;
  Function onPress;
  var buttonName;
  Color color;
  BorderRadiusGeometry radius;
  double height;
  MaterialButtonClassPage({@required this.buttonName, this.minwidth,@required this.onPress, this.color,  this.radius, this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (Platform.isAndroid){
      return Center(child: MaterialButton(
        height: height,
        minWidth: minwidth,
        onPressed: (){
          onPress();
        },
        color: color,
        splashColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: radius
        ),
        child: Text(buttonName,style: GoogleFonts.montserrat(color: Colors.white),),
      ));
    } else {
      return Center(
          child: CupertinoButton (
            onPressed: (){
              onPress;
            },
            color: color,
            borderRadius: radius,
            child:
            new Text(buttonName,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          )
      );
    }
  }
}