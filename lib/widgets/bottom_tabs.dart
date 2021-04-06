import 'package:flutter/material.dart';
import 'package:sastobazar/Pages/create_ad/create_ad.dart';

class BottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  BottomTabs({this.selectedTab, this.tabPressed});
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 30,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomTabButton(
            onPressed: () {
              widget.tabPressed(0);
            },
            selected: _selectedTab == 0 ? true : false,
            imagePath: "assets/images/tab_home.png",
          ),
          BottomTabButton(
            onPressed: () {
              widget.tabPressed(1);
            },
            selected: _selectedTab == 1 ? true : false,
            imagePath: "assets/images/tab_search.png",
          ),
          BottomTabButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CreateAd()));
            },
            selected: _selectedTab == 4 ? true : false,
            imagePath: "assets/images/tab_logout.png",
          ),
          BottomTabButton(
            onPressed: () {
              widget.tabPressed(2);
            },
            selected: _selectedTab == 2 ? true : false,
            imagePath: "assets/images/tab_saved.png",
          ),
          BottomTabButton(
            onPressed: () {
              widget.tabPressed(3);
            },
            selected: _selectedTab == 3 ? true : false,
            imagePath: "assets/images/tab_saved.png",
          ),
        ],
      ),
    );
  }
}

class BottomTabButton extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;
  BottomTabButton({this.onPressed, this.imagePath, this.selected});
  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: _selected
                  ? Theme.of(context).accentColor
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 28,
          horizontal: 24,
        ),
        child: Image(
          image: AssetImage(imagePath ?? "assets/images/tab_home.png"),
          width: 26,
          height: 26,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}
