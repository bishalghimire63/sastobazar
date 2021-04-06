import 'package:flutter/material.dart';
import 'package:sastobazar/tabs/home/components/body.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
