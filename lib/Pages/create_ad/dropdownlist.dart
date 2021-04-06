import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  String label;

  DropDownList({this.label});
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  var _location = ['Kathmandu', 'Jhapa', 'Biratnagar'];
  var _category = ['Vehicles', 'Cars', 'Electronics'];
  var _currentItemSelected = 'Biratnagar';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 8),
            child: Text(
              widget.label,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 15,
                color: Color(0xff8f9db5),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[350],
                )),
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: DropdownButton<String>(
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 25,
                elevation: 16,
                style: TextStyle(color: Colors.grey),
                items: _location.map((String dropDownListitems) {
                  return DropdownMenuItem<String>(
                    value: dropDownListitems,
                    child: Text(dropDownListitems),
                  );
                }).toList(),
                focusColor: Color(0xff0962ff),
                isExpanded: true,
                underline: SizedBox(),
                onChanged: (String newValueSelected) {
                  setState(() {
                    this._currentItemSelected = newValueSelected;
                  });
                },
                value: _currentItemSelected,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
