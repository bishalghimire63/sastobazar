import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sastobazar/constraints/constants.dart';

// ignore: must_be_immutable
class CustomInput extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  bool isPasswordField;
  final Icon icons;
  final bool hideIcon;
  Icon visibilityChange;
  final TextInputType keyboardType;
  final FilteringTextInputFormatter formatter;

  CustomInput(
      {this.formatter,
      this.keyboardType,
      this.textInputAction,
      this.hintText,
      this.onChanged,
      this.onSubmitted,
      this.focusNode,
      this.isPasswordField,
      this.icons,
      this.hideIcon,
      this.visibilityChange});

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  int countVisibility = 1;
  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = widget.isPasswordField ?? false;

    var formatter =
        // ignore: deprecated_member_use
        widget.formatter;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFF2F2F2),
      ),
      child: TextField(
        keyboardType: widget.keyboardType,
        obscureText: _isPasswordField,
        inputFormatters: [formatter],
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          prefixIcon: widget.icons,
          suffix: widget.hideIcon
              ? IconButton(
                  icon: (widget.visibilityChange),
                  onPressed: () {
                    if (countVisibility % 2 != 0) {
                      setState(() {
                        widget.visibilityChange = Icon(Icons.visibility);
                      });
                    } else {
                      setState(() {
                        widget.visibilityChange = Icon(Icons.visibility_off);
                      });
                    }
                    setState(() {
                      widget.isPasswordField = !_isPasswordField;
                      countVisibility = countVisibility + 1;
                      print(countVisibility);
                    });
                  })
              : null,
          border: InputBorder.none,
          hintText: widget.hintText ?? "input...",
          hintStyle: TextStyle(
            color: Colors.grey, // <-- Change this
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 14, right: 15),
        ),
        style: Constants.regulardarktext,
      ),
    );
  }
}
