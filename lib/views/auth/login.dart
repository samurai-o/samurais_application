import 'package:flutter/material.dart';
import 'package:samurais_application/views/auth/custom_input.dart';
import 'package:samurais_application/views/auth/icon_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40.0, top: 40),

                      /// 登录字体
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontFamily: "Cardo",
                            fontSize: 35,
                            color: Color(0xff0C2551),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40, top: 5),
                      child: Text(
                        "sign up with",
                        style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 38),
                    child: Row(
                      children: [
                        IconBtn(char: "G"),
                        SizedBox(width: 25),
                        IconBtn(char: "f")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomInput(label: "Name", inputHint: "John"),
                  SizedBox(
                    height: 30,
                  ),
                  CustomInput(
                    label: "Email",
                    inputHint: "lemonapimc@126.com",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomInput(label: "Password", inputHint: "密码")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
