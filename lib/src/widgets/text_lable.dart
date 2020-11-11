import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLable extends StatelessWidget{
  double left, right, top, bottom, fontsize;
  var title;
  FontWeight fontWeight;
  Color color;
  TextLable({
    this.left,this.right, this.top, this.bottom, this.fontsize, this.title, this.fontWeight, this.color
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.only(left: left, right: right,top: top,bottom: bottom),
      child: Text(
        title,
        style: GoogleFonts.montserrat(fontWeight: fontWeight, color: color, fontSize: fontsize ),
      ),);
//      Container(
//      child: Padding(padding: EdgeInsets.only(left: left, right: right,top: top,bottom: bottom),
//      child: Text(
//        title,
//        style: GoogleFonts.montserrat(fontWeight: fontWeight, color: color, fontSize: fontsize ),
//      ),),
//    );
  }
}