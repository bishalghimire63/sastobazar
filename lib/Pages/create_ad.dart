import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sastobazar/widgets/custom_input.dart';

class CreateAd extends StatefulWidget {
  @override
  _CreateAdState createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Location"),
              CustomInput(
                hintText: "Your Location ",
                onChanged: (value) {
                  setState(() {});
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                icons: Icon(Icons.edit),
                keyboardType: TextInputType.text,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Category"),
              CustomInput(
                hintText: "Good Category ",
                onChanged: (value) {
                  setState(() {});
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                icons: Icon(Icons.edit),
                keyboardType: TextInputType.text,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Photo"),
              CustomInput(
                hintText: "Photo",
                onChanged: (value) {
                  setState(() {});
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                icons: Icon(Icons.image),
                keyboardType: TextInputType.text,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Items Detail"),
              CustomInput(
                hintText: "Title",
                onChanged: (value) {
                  setState(() {});
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                keyboardType: TextInputType.text,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
              CustomInput(
                hintText: "Price",
                onChanged: (value) {
                  setState(() {});
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                keyboardType: TextInputType.number,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
              CustomInput(
                hintText: "Negotiable",
                onChanged: (value) {
                  setState(() {});
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                keyboardType: TextInputType.text,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
              CustomInput(
                hintText: "Phone",
                onChanged: (value) {
                  setState(() {});
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                keyboardType: TextInputType.number,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
              CustomInput(
                hintText: "Condition",
                onChanged: (value) {
                  setState(() {});
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                keyboardType: TextInputType.text,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
              CustomInput(
                hintText: "Description",
                onChanged: (value) {
                  setState(() {});
                },
                isPasswordField: false,
                onSubmitted: (value) {},
                hideIcon: false,
                keyboardType: TextInputType.text,
                formatter: FilteringTextInputFormatter.deny(""),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonTheme(
                minWidth: 340.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Create"),
                  textColor: Colors.white,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Create ads"),
      ),
    );
  }
}
