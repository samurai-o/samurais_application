import 'package:flutter/material.dart';
import 'package:components/tools/constants.dart';

class CustomCheckbox extends StatefulWidget {
  bool isChecked;
  double borderRadius;
  double size;
  double iconSize;
  Color selectedColor;
  Color borderColor;
  Color backgroundColor;
  Color selectedIconColor;
  String? text;

  CustomCheckbox({
    Key? key,
    this.text = '',
    this.isChecked = true,
    this.borderRadius = 20,
    this.size = 20.0,
    this.iconSize = 15.0,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.selectedColor = Colors.white,
    this.selectedIconColor = Colors.black
  }): super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {

  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              decoration: BoxDecoration(
                color: _isSelected ? widget.selectedColor : widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: widget.borderColor,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              width: widget.size,
              height: widget.size,
              child: Icon(
                Icons.check,
                color: _isSelected ?  widget.selectedIconColor : Colors.transparent,
                size: widget.iconSize,
              ),
            ),
          ),
          SizedBox(width: 5.0,),
          Text(
            widget.text ?? '',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }
}