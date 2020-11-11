import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommercelayoutsy/src/utils/colors_page.dart';

class TopContainer extends StatelessWidget {
  final String assetName = 'assets/top_curve_screen.png';
  final String assetNameSecond = 'assets/lady.png';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      width: width,
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              assetName,
               fit: BoxFit.fill,
               height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width,
             ),
           ),
          Positioned(
            top: 70,
            left: 30,
            child: AutoSizeText("Title of Application",style:
            GoogleFonts.montserrat(
                fontSize: 25,
                color: WidgetColors.MainTitleColor,
//                fontWeight: FontWeight.bold
            ),),
          ),
        Positioned(
          right: 40,
          bottom: 60,
          child: Image.asset(
            assetNameSecond,
            height: MediaQuery.of(context).size.height / 4.3,
            ),
        )
        ],
      ),
    );
  }
}



