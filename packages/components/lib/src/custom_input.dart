import 'package:flutter/material.dart';


class CustomInput extends StatefulWidget {
  double height;
  TextInputType keyboardType;
  Color background;
  double borderRadius;
  Color boxShadowColor;
  double boxShadowBlurRadius;
  double boxShadowOffsetX;
  double boxShadowOffsetY;
  Color color;
  String fontFamily;
  double letterSpacing;
  FontWeight fontWeight;
  Color? hintColor;
  Widget? prefixIcon;
  String? hintText;

  CustomInput({
    Key? key,
    this.prefixIcon,
    this.hintText,
    this.hintColor,
    this.height = 60.0,
    this.keyboardType = TextInputType.text,
    this.background = Colors.transparent,
    this.borderRadius = 10.0,
    this.boxShadowColor = Colors.black12,
    this.boxShadowBlurRadius = 6.0,
    this.boxShadowOffsetX = 0,
    this.boxShadowOffsetY = 2,
    this.color = Colors.white,
    this.fontFamily = 'OpenSans',
    this.letterSpacing = 2,
    this.fontWeight = FontWeight.w400,
  }): super(key: key);


  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF6CA8F1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: [
              BoxShadow(
                color: widget.boxShadowColor,
                blurRadius: widget.boxShadowBlurRadius,
                offset: Offset(widget.boxShadowOffsetX, widget.boxShadowOffsetY),
              )
            ],
          ),
          height: widget.height,
          child: TextField(
            keyboardType: widget.keyboardType,
            obscureText: widget.keyboardType == TextInputType.visiblePassword,
            style: TextStyle(
              color: widget.color,
              fontFamily: widget.fontFamily,
              fontWeight: widget.fontWeight,
              letterSpacing: widget.letterSpacing,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: widget.prefixIcon,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: widget.hintColor, fontFamily: widget.fontFamily),
            ),
          ),
        ),
      ],
    );
  }
}