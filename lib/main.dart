 import 'package:ecommercelayoutsy/src/screens/mobile_number_screen.dart';
 import 'package:flutter/material.dart';
 import 'src/screens/bottom_navigation_screen.dart';
 void main() {
   runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Ecommerce App',
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       home: MobileNumberPage(),
     );
   }
 }
