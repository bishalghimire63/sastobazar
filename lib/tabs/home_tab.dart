import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sastobazar/widgets/custom_input.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

String searchValue = "";

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
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
