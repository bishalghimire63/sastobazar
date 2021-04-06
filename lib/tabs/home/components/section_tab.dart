import 'package:flutter/material.dart';
import 'package:sastobazar/tabs/home/components/size_config.dart';

class Sectiontab extends StatelessWidget {
  const Sectiontab({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18), color: Colors.black),
          ),
          GestureDetector(onTap: press, child: Text("See More")),
        ],
      ),
    );
  }
}
