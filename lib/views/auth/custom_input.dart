import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final String inputHint;
  CustomInput({required this.label, required this.inputHint});

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isSubmit = false;
  final checkBoxIcon = 'assets/checkbox.svg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 50.0, bottom: 8),
            child: Text(
              widget.label,
              style: TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 15,
                  color: Color(0xff8f9db5)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 15),
          child: TextFormField(
              obscureText: widget.label == 'Password' ? true : false,
              onChanged: (value) {
                setState(() {
                  isSubmit = true;
                });
              },
              style: TextStyle(
                  fontSize: 19,
                  color: Color(0xff0962ff),
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  hintText: widget.inputHint,
                  hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 27, horizontal: 25),
                  focusColor: Color(0xff0962ff),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xff0962ff)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: isSubmit == true
                      ? Visibility(
                          visible: true,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: SvgPicture.asset(
                              checkBoxIcon,
                              height: 0.2,
                            ),
                          ),
                        )
                      : Visibility(
                          visible: true,
                          child: SvgPicture.asset(checkBoxIcon),
                        ))),
        )
      ],
    );
  }
}
