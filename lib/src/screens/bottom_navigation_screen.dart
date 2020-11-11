import 'package:ecommercelayoutsy/src/utils/colors_page.dart';
import 'package:ecommercelayoutsy/src/utils/controllers_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommercelayoutsy/src/widgets/text_lable.dart';
import 'bottom_nav_screens/home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {

  @override
  _BottomNavigationBarScreenState createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {

  int bottomSelectedIndex = 0;

  Widget title(var title){
    return new Text(title,style: GoogleFonts.montserrat(),);
  }
  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: bottomSelectedIndex == 0 || bottomSelectedIndex == "0" ? 
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,color: WidgetColors.MainTitleColor),
          child: Padding(padding: EdgeInsets.all(6),
          child: Image.asset("assets/bottom_nav_icons/b1.png",)),):
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,),
            child: Padding(padding: EdgeInsets.all(6),
                child: Image.asset("assets/bottom_nav_icons/b1.png",color: WidgetColors.fillColorShadow,)),),
          title: title("Home")
      ),

      BottomNavigationBarItem(
          icon: bottomSelectedIndex == 1 || bottomSelectedIndex == "1" ?
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,color: WidgetColors.MainTitleColor),
            child: Padding(padding: EdgeInsets.all(6),
                child: Image.asset("assets/bottom_nav_icons/b2.png",color: Colors.white,)),):
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,),
            child: Padding(padding: EdgeInsets.all(6),
                child: Image.asset("assets/bottom_nav_icons/b2.png",color: WidgetColors.fillColorShadow,)),),
          title: title("Basket")
      ),

      BottomNavigationBarItem(
          icon: bottomSelectedIndex == 2 || bottomSelectedIndex == "2" ?
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,color: WidgetColors.MainTitleColor),
            child: Padding(padding: EdgeInsets.all(6),
                child: Image.asset("assets/bottom_nav_icons/b3.png",color: Colors.white,)),):
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,),
            child: Padding(padding: EdgeInsets.all(6),
                child: Image.asset("assets/bottom_nav_icons/b3.png",color: WidgetColors.fillColorShadow,)),),
          title: title("Search")
      ),

      BottomNavigationBarItem(
          icon: bottomSelectedIndex == 3 || bottomSelectedIndex == "3" ?
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,color: WidgetColors.MainTitleColor),
            child: Padding(padding: EdgeInsets.all(6),
                child: Image.asset("assets/bottom_nav_icons/b4.png",color: Colors.white,)),):
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,),
            child: Padding(padding: EdgeInsets.all(6),
                child: Image.asset("assets/bottom_nav_icons/b4.png",color: WidgetColors.fillColorShadow,)),),
          title: title("Offers")
      ),

      BottomNavigationBarItem(
          icon: bottomSelectedIndex == 4 || bottomSelectedIndex == "4" ?
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,color: WidgetColors.MainTitleColor),
            child: Padding(padding: EdgeInsets.all(6),
                child: Image.asset("assets/bottom_nav_icons/b5.png",color: Colors.white,)),):
          Container(height: 30,width:30,decoration: BoxDecoration(shape: BoxShape.circle,),
            child: Padding(padding: EdgeInsets.all(6),
                child: Image.asset("assets/bottom_nav_icons/b5.png",color: WidgetColors.fillColorShadow,)),),
          title: title("Account")
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  static final GlobalKey<FormFieldState<String>>  orderFormKey = GlobalKey ();
  Widget buildPageView() {
    return PageView(
      key: orderFormKey,
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
        Blue(),
        Yellow(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
  static final GlobalKey<FormFieldState<String>> _orderFormKey = GlobalKey<FormFieldState<String>>();


Widget myWidget(){
    return  TextFormField(
      key: _orderFormKey,
      controller: AllControllers.areaController,
      decoration: InputDecoration(
          fillColor: WidgetColors.fillColor_,
          filled: true,
          prefixIcon: Icon(Icons.search,color: WidgetColors.MainTitleColor,),
          hintText: "What would you like to order..",
          hintStyle: GoogleFonts.montserrat(color: WidgetColors.HintColor,fontSize: 12)
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
      final _orderFormKey = GlobalKey<FormFieldState<String>>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(height / 5), // here the desired height
          child: AppBar(
            backgroundColor:  WidgetColors.MainTitleColor,
            leading:
            InkWell(
              child: Container(
                  height: 10,
                  child: Padding(padding: EdgeInsets.only(left: 20,right: 8,top: 8),child: Image.asset("assets/bottom_nav_icons/b6.png",height: 12,),)
              ),
              onTap: (){
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            title:TextLable(left: 2,right: 0,top: 10,bottom: 0,title: "Title of Application",fontWeight: FontWeight.w500,color: WidgetColors.fillColor_,fontsize: 16,) ,
            bottom: PreferredSize(child: Padding(padding: EdgeInsets.all(20),
            child: myWidget(),),
                preferredSize: Size.fromHeight(20.0)),
            actions: [
              IconButton(icon: Icon(Icons.notifications), onPressed: (){}),
              Container(width: 3,)
            ],
          )
      ),

//      CustomAppBar(
//        color: WidgetColors.MainTitleColor,
//        height: height / 5,
//        child: Column(
//          children: [
//            Row(
//              children: [
//                Image.asset("assets/bottom_nav_icons/b6.png"),
//              ],
//            )
//          ],
//        ),
//      ),
      body: SafeArea(
        child:  Stack(
          children: [
            buildPageView(),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child:
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft:Radius.circular(20) ),
                      boxShadow: [BoxShadow(
                          color: WidgetColors.iconColor,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-1,-1)
                      )]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft:Radius.circular(20) ),
                    child:  BottomNavigationBar(
                      elevation: 8,
                      selectedItemColor: Colors.deepPurple,
                      unselectedItemColor: Colors.grey,
                      unselectedFontSize: 12,
                      selectedIconTheme: IconThemeData(color: WidgetColors.MainTitleColor,size: 25),
                      unselectedIconTheme:IconThemeData(color: WidgetColors.iconColor,size: 20),
                      currentIndex: bottomSelectedIndex,
                      onTap: (index) {
                        bottomTapped(index);
                      },
                      items: buildBottomNavBarItems(),
                    ),
                  ),
                )
            ),
          ],
        ),
      )



    );
  }
}

class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;
  final Color color;

  CustomAppBar({@required this.child, this.height = kToolbarHeight, @required this.color});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: color,
      alignment: Alignment.center,
      child: child,
    );
  }
}

class Red extends StatefulWidget {
  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class Blue extends StatefulWidget {
  @override
  _BlueState createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.blueAccent,
    );
  }
}

class Yellow extends StatefulWidget {
  @override
  _YellowState createState() => _YellowState();
}

class _YellowState extends State<Yellow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
    );
  }
}