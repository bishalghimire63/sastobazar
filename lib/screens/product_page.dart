// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";
// import 'package:roshan_ecommerce_app/constraints/constants.dart';
// import 'package:roshan_ecommerce_app/widgets/custom_action_bar.dart';
// import 'package:roshan_ecommerce_app/widgets/image_swipe.dart';
// import 'package:roshan_ecommerce_app/widgets/product_size.dart';

// class ProductPage extends StatefulWidget {
//   final String productId;
//   ProductPage({this.productId});
//   @override
//   _ProductPageState createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   final CollectionReference _productsRef =
//       FirebaseFirestore.instance.collection("Products");
//   final CollectionReference _usersRef =
//       FirebaseFirestore.instance.collection("Users");

//   String _selectedProductSize = "0";

//   User _user = FirebaseAuth.instance.currentUser;

//   Future _addToCart() {
//     return _usersRef
//         .doc(_user.uid)
//         .collection("Cart")
//         .doc(widget.productId)
//         .set({"size": _selectedProductSize});
//   }

//   final SnackBar _snackBar = SnackBar(
//     content: Text("Product added to the cart"),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           FutureBuilder(
//             future: _productsRef.doc(widget.productId).get(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Scaffold(
//                   body: Center(
//                     child: Text("Error: ${snapshot.error}"),
//                   ),
//                 );
//               }
//               if (snapshot.connectionState == ConnectionState.done) {
//                 Map<String, dynamic> documentData = snapshot.data.data();
//                 List imageList = documentData['images'];
//                 List productSizes = documentData['size'];
//                 _selectedProductSize = productSizes[0];
//                 return ListView(
//                   padding: EdgeInsets.all(0),
//                   children: [
//                     ImageSwipe(
//                       imageList: imageList,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 24,
//                         right: 24,
//                         left: 24,
//                         bottom: 4,
//                       ),
//                       child: Text(
//                         "${documentData['name']}",
//                         style: Constants.boldheading,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 4.0,
//                         horizontal: 24,
//                       ),
//                       child: Text(
//                         "\$${documentData['price']}",
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Theme.of(context).accentColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 8.0,
//                         horizontal: 24,
//                       ),
//                       child: Text(
//                         "${documentData['desc']}",
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 24.0,
//                         horizontal: 24.0,
//                       ),
//                       child: Text(
//                         "Select Size",
//                         style: Constants.regulardarktext,
//                       ),
//                     ),
//                     ProductSize(
//                       productSizes: productSizes,
//                       onSelected: (size) {
//                         _selectedProductSize = size;
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(24.0),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 65,
//                             height: 65,
//                             decoration: BoxDecoration(
//                               color: Color(0xFFDCDCDC),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             alignment: Alignment.center,
//                             child: Image(
//                               image: AssetImage("assets/images/tab_saved.png"),
//                               height: 22,
//                             ),
//                           ),
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () async {
//                                 await _addToCart();
//                                 Scaffold.of(context).showSnackBar(_snackBar);
//                               },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: 65,
//                                 margin: EdgeInsets.only(
//                                   left: 16,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Text(
//                                   "Add to Cart",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 );
//               }
//               return Scaffold(
//                 body: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             },
//           ),
//           CustomActionBar(
//             hasBackArrow: true,
//             hasTitle: false,
//             hasBackground: false,
//           ),
//         ],
//       ),
//     );
//   }
// }
