import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/services.dart';
import 'package:sastobazar/constraints/constants.dart';
import 'package:sastobazar/widgets/custom_input.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

String searchValue = "";

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 140.0,
      child: new Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/furnitures.jpg'),
          AssetImage('assets/car.png'),
          AssetImage('assets/phone.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        indicatorBgPadding: 7.0,
      ),
    );
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomInput(
                hintText: "What are you looking for? ",
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                  });
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                icons: Icon(Icons.search),
                keyboardType: TextInputType.text,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // children: [image_carousel],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text("$searchValue")),
              Center(child: Text("Catogory2")),
              Center(child: Text("Catogory1")),
              Center(child: Text("Catogory2")),
              Center(child: Text("Catogory1")),
              Center(child: Text("Catogory2")),
              Center(child: Text("Catogory1")),
              Center(child: Text("Catogory2")),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text("Recent ads1")),
              Center(child: Text("Recent ads2")),
            ],
          ),
        ],
      ),
      // body: new ListView(
      //   children: <Widget>[image_carousel],
      // ),
    );
  }
}
