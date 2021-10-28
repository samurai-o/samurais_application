

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            labelText: '邮箱',
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent, width: 10.0),
              borderRadius: BorderRadius.circular(10.0)
            ),
          ),
        ),
        SizedBox(height: 40.0,),
        TextField(
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            labelText: '密码',
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 10.0),
                borderRadius: BorderRadius.circular(10.0)
            ),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top: 15.0, left: 20.0),
          child: InkWell(
            child: Text(
              '忘记密码',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  decoration: TextDecoration.underline),
            ),
          ),
        ),
        SizedBox(height: 40.0),
        Container(
          height: 60.0,
          child: Material(
            borderRadius: BorderRadius.circular(40.0),
            shadowColor: Colors.greenAccent,
            color: Colors.green,
            elevation: 4.0,
            child: GestureDetector(
              onTap: () {},
              child: Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 60.0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1.0),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Center(
                //   child:
                //   ImageIcon(AssetImage('assets/facebook.png')),
                // ),
                Center(
                  child: Text('Log',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}