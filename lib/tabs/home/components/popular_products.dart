import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sastobazar/tabs/home/components/section_tab.dart';

List newlist = List();

class RecentProducts extends StatefulWidget {
  const RecentProducts({
    Key key,
  }) : super(key: key);
  @override
  _RecentProductsState createState() => _RecentProductsState();
}

class _RecentProductsState extends State<RecentProducts> {
  Future<List> getProduts() async {
    var response =
        await http.post("http://192.168.0.2:1234/sasto/products.php");
    print(newlist);
    return (newlist = jsonDecode(response.body));
  }

  @override
  void initState() {
    super.initState();
    getProduts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: getProduts(),
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white60,
            ),
            child: SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Sectiontab(text: ("Recent Ads"), press: () {}),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250.0,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: newlist.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: GestureDetector(
                        child: Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/car.png",
                                    // height: 110,
                                    width: 75,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Text(newlist[index]['title']),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(newlist[index]['price']),
                                  ),
                                ],
                              ),
                              // Column(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Container(
                              //       child: Text(newlist[index]['description']),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          );
        });
  }
}
