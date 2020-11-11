import 'package:ecommercelayoutsy/src/utils/colors_page.dart';
import 'package:ecommercelayoutsy/src/widgets/text_lable.dart';
import 'package:ecommercelayoutsy/src/widgets/vertical_corrosol.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homeScreen();
  }
}

class _homeScreen extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Padding(padding: EdgeInsets.only(left: 10,right: 10),child:
        Scrollbar(child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ImageCorrosule(),
                height: height / 3.2,
              ),
              TextLable(
                title: "Categories",
                fontWeight: FontWeight.bold,
                color: WidgetColors.TextColor,
                fontsize: 14,
                left: 0,right: 0,top: 0,bottom: 0,
              ),

              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextLable(top: 10,right: 0,left: 10,bottom: 0,fontsize: 10,title: "Milk",color: WidgetColors.TextColor,),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: WidgetColors.fillColorShadow,
                              spreadRadius:1,
                              blurRadius: 2,
                              offset: Offset(2, 2)
                          )
                        ],
                        color: WidgetColors.fillColorMilk,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    height: 115,
                    width: 100,
                  ),
                  Container(
                    width: width / 25,
                  ),
                  Container(
                    child: TextLable(top: 10,right: 0,left: 10,bottom: 0,fontsize: 10,title: "Eggs",color: WidgetColors.TextColor,),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: WidgetColors.fillColorShadow,
                              spreadRadius:1,
                              blurRadius: 2,
                              offset: Offset(2, 2)
                          )
                        ],
                        color: WidgetColors.fillColorEgs,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    height: 115,
                    width: 100,
                  ),

                  Container(
                    width: width / 25,
                  ),
                  Container(
                    child: TextLable(top: 10,right: 0,left: 10,bottom: 0,fontsize: 10,title: "Bread",color: WidgetColors.TextColor,),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: WidgetColors.fillColorShadow,
                              spreadRadius:1,
                              blurRadius: 2,
                              offset: Offset(2, 2)
                          )
                        ],
                        color: WidgetColors.fillColorBread,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    height: 115,
                    width: 100,
                  ),
                ],
              ),
              Container(
                height: height / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextLable(top: 10,right: 0,left: 10,bottom: 0,fontsize: 10,title: "Ready to Cook",color: WidgetColors.TextColor,),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: WidgetColors.fillColorShadow,
                              spreadRadius:1,
                              blurRadius: 2,
                              offset: Offset(2, 2)
                          )
                        ],
                        color: WidgetColors.fillColorCook,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    height: 115,
                    width: 100,
                  ),
                  Container(
                    width: width / 25,
                  ),
                  Container(
                    child: TextLable(top: 10,right: 0,left: 10,bottom: 0,fontsize: 10,title: "Dairy Products",color: WidgetColors.TextColor,),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: WidgetColors.fillColorShadow,
                              spreadRadius:1,
                              blurRadius: 2,
                              offset: Offset(2, 2)
                          )
                        ],
                        color: WidgetColors.fillColorDaily,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    height: 115,
                    width: 100,
                  ),

                  Container(
                    width: width / 25,
                  ),
                  Container(
                    child: TextLable(top: 10,right: 0,left: 10,bottom: 0,fontsize: 10,title: "Snacks",color: WidgetColors.TextColor,),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: WidgetColors.fillColorShadow,
                              spreadRadius:1,
                              blurRadius: 2,
                              offset: Offset(2, 2)
                          )
                        ],
                        color: WidgetColors.fillColorSnaks,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    height: 115,
                    width: 100,
                  ),
                ],
              ),
              Container(
                height: 80,
              ),

            ],
          ),
        )),)
      ) ,
    );
  }

}