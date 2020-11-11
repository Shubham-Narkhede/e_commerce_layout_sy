import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCorrosule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageCorrosule();
  }
}
List<String> imgList = [
  "assets/corosul/c_1.png",
  "assets/corosul/c_2.png",
  "assets/corosul/c_3.png"
  ];

class _ImageCorrosule extends State<ImageCorrosule> {
  int _current = 0;




  final List<Widget> imageSliders = imgList.map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset(item, fit: BoxFit.contain, width: 1000.0),
      ),
    ),
  )).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('Carousel with indicator demo')),
      body: Column(
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 5.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
          ]
      ),
    );
  }
}