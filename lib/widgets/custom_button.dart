import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outLineButton;
  final double customHeight;
  final bool isLooding;

  CustomButton(
      {this.isLooding,
      this.text,
      this.onPressed,
      this.outLineButton,
      this.customHeight});
  @override
  Widget build(BuildContext context) {
    bool _outLineButton = outLineButton ?? false;
    bool _isLooding = isLooding ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: customHeight,
        decoration: BoxDecoration(
          color: _outLineButton ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        child: Stack(
          children: [
            Visibility(
              visible: _isLooding ? false : true,
              child: Center(
                child: Text(
                  text ?? "Text",
                  style: TextStyle(
                    fontSize: 16,
                    color: _outLineButton ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isLooding,
              child: Center(
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator())),
            ),
          ],
        ),
      ),
    );
  }
}
