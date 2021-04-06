import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sastobazar/tabs/home/components/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
          color: Color(0XFF4A3298), borderRadius: BorderRadius.circular(20)),
      child: Text.rich(
        TextSpan(
            text: "But your products with ease\n\n",
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(
                  text: "View, Add & Contact",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
            ]),
      ),
    );
  }
}
