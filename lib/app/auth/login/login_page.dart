import 'package:flutter/material.dart';
import 'package:components/components.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:samurais_application/services/services.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {

  Future<bool> login() async {
    UserService services = Modular.get<UserService>();
    await services.login(username: '11', password: '1111');
    return true;
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 2.0,
        onPressed: () => print('Login Button Pressed'),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: 20.0),
        CustomInput(
          keyboardType: TextInputType.emailAddress,
          hintText: '请输入邮箱',
          hintColor: Colors.white,
          prefixIcon: Icon(
            Icons.email,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 40.0,),
        CustomInput(
          keyboardType: TextInputType.visiblePassword,
          hintText: '请输入密码',
          hintColor: Colors.white,
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCheckbox(isChecked: true, selectedIconColor: Color(0xFF398AE5), backgroundColor: Color(0xFF398AE5),text: '记住密码',),
            Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Modular.to.pushNamed('/auth/register');
                  },
                  child: Text(
                    '忘记密码?',
                    style: kLabelStyle,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 40.0),
        CustomButton(
          text: '登录',
          width: width,
          height: 60,
          borderRadius: 40.0,
          loadingColor: Color(0xFF527DAA),
          onProcess: login,
        ),
      ],
    );
  }
}