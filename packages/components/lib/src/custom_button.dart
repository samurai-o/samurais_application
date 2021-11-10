import 'dart:async';
import 'package:flutter/material.dart';

enum CustomButtonState { init, loading, done }

typedef AsyncValueSetter<T> = Future<T> Function();

class CustomButton extends StatefulWidget {
  double width;
  double height;
  double borderRadius;
  String text;
  Color loadingColor;
  Color background;
  AsyncValueSetter<bool>? onProcess;

  CustomButton({
    Key? key,
    this.onProcess,
    this.text = '',
    this.width = 60,
    this.height = 60,
    this.borderRadius = 20,
    this.loadingColor = Colors.black,
    this.background = Colors.white,
  }):super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  CustomButtonState state = CustomButtonState.init;

  Widget buildSmallButton(bool isDone) {

    return Container(
      width: widget.height,
      height: widget.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.background,
      ),
      child: Center(
        child: isDone ? Icon(
          Icons.done,
          color: Colors.green,
          size: widget.height / 1.5,
        ) :  CircularProgressIndicator(
            color: widget.loadingColor,
        ),
      ),
    );
  }
  
  Widget buildRaisedButton() {
    return RaisedButton(
      onPressed: () async {
        if(widget.onProcess != null) {
          setState(() {
            state = CustomButtonState.loading;
          });
          await Future.delayed(Duration(seconds: 3));
          await widget.onProcess!();
          setState(() {
            state = CustomButtonState.done;
          });
          await Future.delayed(Duration(seconds: 3));
          setState(() {
            state = CustomButtonState.init;
          });
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      color: widget.background,
      child: FittedBox(
        child: Text(
          widget.text,
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isStretched = state == CustomButtonState.init;
    bool isDone = state == CustomButtonState.done;
    return Container(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(state == CustomButtonState.init ? widget.borderRadius : widget.height /2),
        ),
        curve: Curves.easeIn,
        width: state == CustomButtonState.init ? widget.width : widget.height,
        height: widget.height,
        child: isStretched ? buildRaisedButton() : buildSmallButton(isDone),
      ),
    );
  }
}