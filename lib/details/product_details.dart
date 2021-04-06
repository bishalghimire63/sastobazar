import 'package:flutter/material.dart';
import 'package:sastobazar/tabs/home/components/popular_products.dart';

class ProductDetails extends StatelessWidget {
  static String routeName = "/product_details";

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class ProductDetailArguments {
  final RecentProducts products;
  ProductDetailArguments({@required this.products});
}
