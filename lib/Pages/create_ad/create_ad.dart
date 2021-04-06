import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sastobazar/Pages/create_ad/customInputBox.dart';
import 'package:sastobazar/Pages/create_ad/dropdownlist.dart';
import 'package:sastobazar/screens/home_page.dart';
import 'package:sastobazar/widgets/custom_input.dart';

class CreateAd extends StatefulWidget {
  @override
  _CreateAdState createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  var _location = ['Kathmandu', 'Jhapa', 'Biratnagar'];
  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Ad Detail",
            style: TextStyle(
              // fontSize: 10,
              color: Color(0xff0C2551),
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.green,
              )),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                })
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //
                  SizedBox(
                    height: 20,
                  ),
                  DropDownList(label: 'Location'),
                  SizedBox(
                    height: 20,
                  ),
                  DropDownList(label: 'Category'),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 20,
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyCustomInputBox(
                    label: 'Photo',
                    // inputHint: 'example@example.com',
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 8),
                        child: Text(
                          'Item Details',
                          style: TextStyle(
                            color: Color(0xff8f9db5),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  MyCustomInputBox(
                    label: 'Title',
                    // inputHint: '8+ Characters,1 Capital letter',
                  ),
                  //
                  SizedBox(
                    height: 20,
                  ),
                  MyCustomInputBox(
                    label: 'Price',
                    // inputHint: '8+ Characters,1 Capital letter',
                  ),
                  //
                  SizedBox(
                    height: 20,
                  ),
                  MyCustomInputBox(
                    label: 'Negotiable',
                    // inputHint: '8+ Characters,1 Capital letter',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyCustomInputBox(
                    label: 'Phone Number',
                    // inputHint: '8+ Characters,1 Capital letter',
                  ),
                  //
                  SizedBox(
                    height: 20,
                  ),
                  MyCustomInputBox(
                    label: 'Description',
                    // inputHint: '8+ Characters,1 Capital letter',
                  ),
                  //
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: scrWidth * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff0962ff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Create Ad',
                        style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Neu_button extends StatelessWidget {
  Neu_button({this.char});
  String char;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(12, 11),
            blurRadius: 26,
            color: Color(0xffaaaaaa).withOpacity(0.1),
          )
        ],
      ),
      //
      child: Center(
        child: Text(
          char,
          style: TextStyle(
            fontFamily: 'ProductSans',
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: Color(0xff0962FF),
          ),
        ),
      ),
    );
  }
}

class OuterClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 4);
    //
    path.cubicTo(size.width * 0.55, size.height * 0.16, size.width * 0.85,
        size.height * 0.05, size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class InnerClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width * 0.7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1);
    //
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.11, size.width * 0.7, 0);

    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
// class CreateAd extends StatefulWidget {
//   @override
//   _CreateAdState createState() => _CreateAdState();
// }

// class _CreateAdState extends State<CreateAd> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text("Location"),
//               CustomInput(
//                 hintText: "Your Location ",
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 isPasswordField: false,
//                 onSubmitted: (value) {},
//                 hideIcon: false,
//                 icons: Icon(Icons.edit),
//                 keyboardType: TextInputType.text,
//                 formatter: FilteringTextInputFormatter.deny(""),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text("Category"),
//               CustomInput(
//                 hintText: "Good Category ",
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 isPasswordField: false,
//                 onSubmitted: (value) {},
//                 hideIcon: false,
//                 icons: Icon(Icons.edit),
//                 keyboardType: TextInputType.text,
//                 formatter: FilteringTextInputFormatter.deny(""),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text("Photo"),
//               CustomInput(
//                 hintText: "Photo",
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 isPasswordField: false,
//                 onSubmitted: (value) {},
//                 hideIcon: false,
//                 icons: Icon(Icons.image),
//                 keyboardType: TextInputType.text,
//                 formatter: FilteringTextInputFormatter.deny(""),
//               ),
//             ],
//           ),
//           Divider(
//             height: 10,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text("Items Detail"),
//               CustomInput(
//                 hintText: "Title",
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 isPasswordField: false,
//                 onSubmitted: (value) {},
//                 hideIcon: false,
//                 keyboardType: TextInputType.text,
//                 formatter: FilteringTextInputFormatter.deny(""),
//               ),
//               CustomInput(
//                 hintText: "Price",
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 isPasswordField: false,
//                 onSubmitted: (value) {},
//                 hideIcon: false,
//                 keyboardType: TextInputType.number,
//                 formatter: FilteringTextInputFormatter.deny(""),
//               ),
//               CustomInput(
//                 hintText: "Negotiable",
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 isPasswordField: false,
//                 onSubmitted: (value) {},
//                 hideIcon: false,
//                 keyboardType: TextInputType.text,
//                 formatter: FilteringTextInputFormatter.deny(""),
//               ),
//               CustomInput(
//                 hintText: "Phone",
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 isPasswordField: false,
//                 onSubmitted: (value) {},
//                 hideIcon: false,
//                 keyboardType: TextInputType.number,
//                 formatter: FilteringTextInputFormatter.deny(""),
//               ),
//               CustomInput(
//                 hintText: "Condition",
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 isPasswordField: false,
//                 onSubmitted: (value) {},
//                 hideIcon: false,
//                 keyboardType: TextInputType.text,
//                 formatter: FilteringTextInputFormatter.deny(""),
//               ),
//               CustomInput(
//                 hintText: "Description",
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 isPasswordField: false,
//                 onSubmitted: (value) {},
//                 hideIcon: false,
//                 keyboardType: TextInputType.text,
//                 formatter: FilteringTextInputFormatter.deny(""),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ButtonTheme(
//                 minWidth: 340.0,
//                 height: 50.0,
//                 child: RaisedButton(
//                   onPressed: () {},
//                   child: Text("Create"),
//                   textColor: Colors.white,
//                   color: Colors.green,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       appBar: AppBar(
//         title: Text("Create ads"),
//       ),
//     );
//   }
// }
