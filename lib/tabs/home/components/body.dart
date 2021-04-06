import 'package:flutter/material.dart';
import 'package:sastobazar/tabs/home/components/categories_cart.dart';
import 'package:sastobazar/tabs/home/components/discount_banner.dart';
import 'package:sastobazar/tabs/home/components/home_header.dart';
import 'package:sastobazar/tabs/home/components/popular_products.dart';
import 'package:sastobazar/tabs/home/components/special_offers.dart';
import 'package:sastobazar/tabs/scrolllable_view_home.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            HomeHeader(),
            SizedBox(
              height: 20,
            ),
            DiscountBanner(),
            SizedBox(
              height: 30,
            ),
            Categories(),
            SizedBox(
              height: 30,
            ),
            SpecialOffers(),
            SizedBox(
              height: 20,
            ),
            RecentProducts(),
            SizedBox(
              height: 10,
            ),
            // HomeHeader(),
            // SpecialOffers(),
            // SizedBox(
            //   height: 10,
            // ),
            // ScrollableClass(),
            // SizedBox(
            //   height: 10,
            // ),
            // HomeHeader(),
            // SpecialOffers(),
            // SizedBox(
            //   height: 10,
            // ),
            // ScrollableClass(),
            // SizedBox(
            //   height: 10,
            // ),
            // HomeHeader(),
            // SpecialOffers(),
            // SizedBox(
            //   height: 10,
            // ),
            // ScrollableClass(),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   padding: EdgeInsets.all(5),
            //   decoration: BoxDecoration(
            //       color: Colors.green, borderRadius: BorderRadius.circular(5)),
            //   child: Column(
            //     children: [
            //       // Text(
            //       //   'Demo Headline 2',
            //       //   style: TextStyle(fontSize: 18),
            //       // ),
            //       // Card(
            //       //   child: ListTile(
            //       //       title: Text('Motivation 1'),
            //       //       subtitle:
            //       //           Text('this is a description of the motivation')),
            //       // ),
            //       // Card(
            //       //   child: ListTile(
            //       //       title: Text('Motivation 2'),
            //       //       subtitle:
            //       //           Text('this is a description of the motivation')),
            //       // ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // ScrollableClass(),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   padding: EdgeInsets.all(5),
            //   decoration: BoxDecoration(
            //       color: Colors.green, borderRadius: BorderRadius.circular(5)),
            //   child: Column(
            //     children: [
            //       Text(
            //         'Demo Headline 2',
            //         style: TextStyle(fontSize: 18),
            //       ),
            //       Card(
            //         child: ListTile(
            //             title: Text('Motivation 3'),
            //             subtitle:
            //                 Text('this is a description of the motivation')),
            //       ),
            //       Card(
            //         child: ListTile(
            //             title: Text('Motivation 4'),
            //             subtitle:
            //                 Text('this is a description of the motivation')),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
