import 'package:flutter/material.dart';

enum CustomButtonState { init, loading, done }

class CustomButton extends StatefulWidget {

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isAnimating = true;
  CustomButtonState state = CustomButtonState.init;

  Widget buildSmallButton(bool isDone) {
    Color color = isDone ? Colors.green :  Colors.indigo;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:  color
      ),
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        width: state == CustomButtonState.init ? 300 : 70,
        height: 70,
        child: isDone ? Icon(Icons.done, color: Colors.white, size: 52,) :  CircularProgressIndicator(color: Colors.white, ),
      ),
      // child: Center(
      //   child: isDone ? Icon(Icons.done, color: Colors.white, size: 52,) :  CircularProgressIndicator(color: Colors.white, ),
      // ),
    );
  }
  
  Widget buildRaisedButton() {
    return RaisedButton(
      elevation: 2.0,
      onPressed: () async {
        setState(() {
          state = CustomButtonState.loading;
        });
        await Future.delayed(Duration(seconds: 3));
        setState(() {
          state = CustomButtonState.done;
        });
        await Future.delayed(Duration(seconds: 3));
        setState(() {
          state = CustomButtonState.init;
        });
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(
        '登录',
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isStretched = isAnimating || state == CustomButtonState.init;
    bool isDone = state == CustomButtonState.done;
    return Container(
      child: isStretched ? buildRaisedButton() : buildSmallButton(isDone),
    );
  }
}